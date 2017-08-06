package minijava.backend.regDistributor;


import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.Stack;
import java.util.function.Function;

import minijava.backend.CodeGenerator;
import minijava.backend.MachineFunction;
import minijava.backend.MachineInstruction;
import minijava.backend.MachinePrg;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.DirectedGraph;
import minijava.util.Node;
import minijava.util.Pair;
import minijava.util.TempNode;
import minijava.backend.i386.*;

public class RegisterAllocator {
	private MachinePrg prg;
	private CodeGenerator codeGen;
	private Stack<Pair<TempNode, Set<TempNode>>> tempNodeStack;
	private List<Temp> toSpill;
	private int registerCount;
	private boolean hasSpill = false;
	private boolean hasSpillCandidate = false;
	private HashMap<Temp, Temp> mapTemps;
	
	public RegisterAllocator(MachinePrg prg, CodeGenerator cg){
		this.prg = prg;
		this.codeGen = cg;
		this.registerCount = this.codeGen.getGeneralPurposeRegisters().size();
		this.tempNodeStack = new Stack<>();
	}
	
	public MachinePrg allocateRegistersOfMachinePrg(){
		for (MachineFunction mf : prg){
			this.allocateRegistersOfMachineFunction(mf);
		}
		return prg;
	}
	
	
	public MachineFunction allocateRegistersOfMachineFunction(MachineFunction mf){
		mapTemps = new HashMap<>();
		toSpill = new LinkedList<>();
		DirectedGraph<TempNode> interGraph;
		do{
			if (!toSpill.isEmpty()){
				mf.spill(toSpill);
			}
			interGraph = this.build(mf);
			hasSpillCandidate = true;
			toSpill = new LinkedList<Temp>();
			
			while (hasSpillCandidate) {
				interGraph = this.simplify(interGraph);
				interGraph = this.spill(interGraph);
			}
			this.select(interGraph);
			
		}while(!toSpill.isEmpty());
		System.out.println("number of spillnodes: " + toSpill.size());
		this.replaceTempsWithRegisters(mf, interGraph);
		return mf;
	}
	
	
	public DirectedGraph<TempNode> build(MachineFunction mf){
		GraphGenerator gg = new GraphGenerator();
		DirectedGraph<TempNode> interGraph = gg.createInterferenceGraphFromMachineFunction(mf);
		return this.preColorNodes(interGraph);
	}
	
	public DirectedGraph<TempNode> preColorNodes(DirectedGraph<TempNode> interGraph){
		List<Temp> regs = this.codeGen.getAllRegisters();
		for (TempNode tn : interGraph.nodeSet()){
			if (regs.contains(tn.getTemp())){
				mapTemps.put(tn.getTemp(), tn.getTemp());
			}
		}
		return interGraph;
	}
	
	public DirectedGraph<TempNode> simplify(DirectedGraph<TempNode> interGraph){
		
		int removeCount = 1;
		while(removeCount != 0){
			Set <TempNode> nodes = new HashSet<TempNode>();
			nodes.addAll(interGraph.nodeSet());
			hasSpillCandidate = false;
			removeCount = 0;			
			for(TempNode n : nodes){
				if(!isColored(n) && interGraph.successors(n).size() < registerCount){
					tempNodeStack.push(new Pair<TempNode, Set<TempNode>>(n, interGraph.successors(n)));
					interGraph.removeNode(n);
					if (removeCount == 0){
						removeCount++;
					}
				} else if (!isColored(n)){
					hasSpillCandidate = true;
				} 
			}
		}
		return interGraph;
	}
	
	public DirectedGraph<TempNode> spill(DirectedGraph<TempNode> interGraph){
		TempNode maxSuccsNode = null;
		int maxSuccsCount = 0;
		for(TempNode n : interGraph.nodeSet()){
			if(!isColored(n)){
				if(interGraph.successors(n).size() > maxSuccsCount){
					maxSuccsCount = interGraph.successors(n).size();
					maxSuccsNode = n;
				}
			}
		}
		
		if(maxSuccsNode != null){
			tempNodeStack.push(new Pair<TempNode, Set<TempNode>>(maxSuccsNode, interGraph.successors(maxSuccsNode)));
			interGraph.removeNode(maxSuccsNode);
		}
		return interGraph;
	}
	
	public DirectedGraph<TempNode> select(DirectedGraph<TempNode> interGraph){
		while (!tempNodeStack.empty()){
			Pair<TempNode, Set<TempNode>> tn = tempNodeStack.pop();
			interGraph.addNode(tn.getFst());
			Set<Temp> colorOfNeighbors = this.addEdgesAndGetColorOfNeighborNodes(tn.getFst(), tn.getSnd(), interGraph);
			Temp availRegister = getAvailableRegister(colorOfNeighbors);
			if (availRegister == null){
				this.addNodeToSpillNodes(tn.getFst());
			} else {
				//System.out.println("register alloc " + tn.getFst() + " - " + availRegister );
				mapTemps.put(tn.getFst().getTemp(), availRegister);
			}
		}
		return interGraph;
	}
	
	public Set<Temp> addEdgesAndGetColorOfNeighborNodes(TempNode src, Set<TempNode> targets, DirectedGraph<TempNode> interGraph){
		Set<Temp> colorOfNeighbors = new HashSet<Temp>();
		for (TempNode tempNode : targets){
			if(interGraph.nodeSet().contains(tempNode)){
				interGraph.addEdge(src, tempNode);
				interGraph.addEdge(tempNode, src);
				colorOfNeighbors.add(mapTemps.get(tempNode.getTemp()));
			}
		}
		return colorOfNeighbors;
	}
	
	public boolean isColored(TempNode n){
		Temp t = n.getTemp();
		return mapTemps.containsKey(t);
	}
	
	public Temp getAvailableRegister(Set<Temp> colorOfNeighbors){
		for (Temp t : this.codeGen.getGeneralPurposeRegisters()){
			if (!colorOfNeighbors.contains(t)){
				return t;
			}
		}
		return null;
	}
	
	public void addNodeToSpillNodes(TempNode t){
		toSpill.add(t.getTemp());
	}
	
	public MachineFunction replaceTempsWithRegisters(MachineFunction mf, DirectedGraph<TempNode> interGraph){
		//Function that swaps Temps
		Function<Temp,Temp> tempToReg = (Temp t)-> {
			DirectedGraph<TempNode> iGraph = interGraph;
			for(TempNode tn : iGraph.nodeSet()){
				if(tn.getTemp().equals(t)){
					if(isColored(tn)){
						t = mapTemps.get(tn.getTemp());
						return t;
					}
				}
			}
			return t;
		};
		mf.rename(tempToReg);
		/*for(MachineInstruction mi : mf){
				//check for Call
				if(mi.isLabel() == null){
					mi.rename(tempToReg);
				}
			}
			*/
		return mf;
	}
	
}
