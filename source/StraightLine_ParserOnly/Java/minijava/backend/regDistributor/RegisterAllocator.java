package minijava.backend.regDistributor;


import java.util.HashSet;
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
		DirectedGraph<TempNode> interGraph = this.build(mf);
		hasSpillCandidate = true;
		while(hasSpillCandidate){
			interGraph = this.simplify(interGraph);
			interGraph = this.spill(interGraph);
		}
		interGraph.printDot();
		this.select(interGraph);
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
		//interGraph.addNode(tempNodeStack.pop().getFst());
		//check for available Registers and color Node
		
		// TODO: if spill, so rewrite program and start over at build again
		return interGraph;
	}
	
	
	
}
