package minijava.backend.regDistributor;


import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.Stack;

import minijava.backend.CodeGenerator;
import minijava.backend.MachineFunction;
import minijava.backend.MachinePrg;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.DirectedGraph;
import minijava.util.Node;
import minijava.util.Pair;
import minijava.util.TempNode;

public class RegisterAllocator {
	private MachinePrg prg;
	private CodeGenerator codeGen;
	private Stack<Pair<TempNode, Set<TempNode>>> tempNodeStack;
	private List<TempNode> spillNodes;
	private int registerCount;
	private boolean hasSpill = false;
	private boolean hasSpillCandidate = false;
	
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
		//DirectedGraph<TempNode> interGraph;
		//do{
			DirectedGraph<TempNode> interGraph = this.build(mf);
			hasSpillCandidate = true;
			spillNodes = new LinkedList<TempNode>();
			while (hasSpillCandidate) {
				interGraph = this.simplify(interGraph);
				interGraph = this.spill(interGraph);
			}
			this.select(interGraph);
			interGraph.printDot();
		//}while(!spillNodes.isEmpty());
		System.out.println("number of spillnodes: " + spillNodes.size());
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
				tn.setColor(tn.getTemp());
			} else {
				tn.resetColor();
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
	
	public boolean isColored(TempNode n){
		return codeGen.getGeneralPurposeRegisters().contains(n.getTemp());
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
				tn.getFst().setColor(availRegister);
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
				colorOfNeighbors.add(tempNode.getColoredTemp());
			}
		}
		return colorOfNeighbors;
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
		spillNodes.add(t);
	}
	
	public MachineFunction rewriteProgram(MachineFunction mf){
		// List of spill nodes is globally available
		return mf;
	}
	
	public MachineFunction replaceTempsWithRegisters(MachineFunction mf, DirectedGraph<TempNode> interGraph){
		return mf;
	}
	
}
