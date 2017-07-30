package minijava.backend.regDistributor;


import java.util.Set;
import java.util.Stack;

import minijava.backend.CodeGenerator;
import minijava.backend.MachineFunction;
import minijava.backend.MachinePrg;
import minijava.intermediate.Label;
import minijava.util.DirectedGraph;
import minijava.util.Node;
import minijava.util.Pair;
import minijava.util.TempNode;

public class RegisterAllocator {
	private MachinePrg prg;
	private CodeGenerator codeGen;
	private Stack<Pair<TempNode, Set<TempNode>>> tempNodeStack;
	final int registerCount = 6;
	private boolean hasSpill = false;
	
	public RegisterAllocator(MachinePrg prg, CodeGenerator cg){
		this.prg = prg;
		this.codeGen = cg;
	}
	
	public MachinePrg allocateRegistersOfMachinePrg(){
		for (MachineFunction mf : prg){
			this.allocateRegistersOfMachineFunction(mf);
		}
		return prg;
	}
	
	
	public MachineFunction allocateRegistersOfMachineFunction(MachineFunction mf){
		// implement algo from slide 281 with methods below
		//check for hasSpill after simplify
		//if true call spill and set hasSpill to false
		return mf;
	}
	
	public DirectedGraph<TempNode> build(MachineFunction mf){
		GraphGenerator gg = new GraphGenerator();
		DirectedGraph<TempNode> interGraph = gg.createInterferenceGraphFromMachineFunction(mf);
		
		// TODO: color register nodes
		return interGraph;
	}
	
	public DirectedGraph<TempNode> simplify(DirectedGraph<TempNode> interGraph){
		Set <TempNode> nodes = interGraph.nodeSet();
		int removeCount = 1;
		hasSpill = false;
		while(removeCount != 0){
			removeCount = 0;			
			for(TempNode n : nodes){
				if(!isColored(n) && interGraph.successors(n).size() < registerCount){
					tempNodeStack.push(new Pair<TempNode, Set<TempNode>>(n, interGraph.successors(n)));
					interGraph.removeNode(n);
					if (removeCount == 0){
						removeCount++;
					}
				} else {
					hasSpill = true;
				}
			}
		}
		return interGraph;
	}
	
	public boolean isColored(TempNode n){
		return codeGen.getGeneralPurposeRegisters().contains(n.getTemp());
	}
	
	public DirectedGraph<TempNode> spill(DirectedGraph<TempNode> interGraph){
		//entferne ungefaerbten Knoten mit maximalem Grad
		TempNode maxSuccsNode = null;
		int maxSuccsCount = 0;
		for(TempNode n : interGraph.nodeSet()){
			if(!isColored(n)){
				if(interGraph.successors(n).size() > maxSuccsCount){
					maxSuccsCount = interGraph.successors(n).size();
					maxSuccsNode = n;
				}
			}
			if(maxSuccsNode != null){
				interGraph.removeNode(maxSuccsNode);
				tempNodeStack.push(new Pair<TempNode, Set<TempNode>>(maxSuccsNode, interGraph.successors(maxSuccsNode)));
			}
		}
		return interGraph;
	}
	
	//TODO: write Function that checks for available machineRegisters
	
	public DirectedGraph<TempNode> select(DirectedGraph<TempNode> interGraph){
		interGraph.addNode(tempNodeStack.pop().getFst());
		//check for available Registers and color Node
		
		// TODO: if spill, so rewrite program and start over at build again
		return interGraph;
	}
	
	
	
}
