package minijava.backend.regDistributor;


import java.util.Set;
import java.util.Stack;

import minijava.backend.CodeGenerator;
import minijava.backend.MachineFunction;
import minijava.backend.MachinePrg;
import minijava.util.DirectedGraph;
import minijava.util.Pair;
import minijava.util.TempNode;

public class RegisterAllocator {
	private MachinePrg prg;
	private CodeGenerator codeGen;
	private Stack<Pair<TempNode, Set<TempNode>>> tempNodeStack;
	
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
		return mf;
	}
	
	public DirectedGraph<TempNode> build(MachineFunction mf){
		GraphGenerator gg = new GraphGenerator();
		DirectedGraph<TempNode> interGraph = gg.createInterferenceGraphFromMachineFunction(mf);
		// TODO: color register nodes
		return interGraph;
	}
	
	public DirectedGraph<TempNode> simplify(DirectedGraph<TempNode> interGraph){
		
		// TODO: test here for spill
		return interGraph;
	}
	
	public DirectedGraph<TempNode> select(DirectedGraph<TempNode> interGraph){
		// TODO: if spill, so rewrite program and start over at build again
		return interGraph;
	}
	
	
	
}
