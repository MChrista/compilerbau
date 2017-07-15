package minijava.backend.regDistributor;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import minijava.backend.*;
import minijava.backend.i386.I386Prg;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.DirectedGraph;
import minijava.util.Node;
import minijava.util.Pair;

import minijava.backend.i386.*;

public class GraphGenerator {

	private DirectedGraph<Node> ctrGraph;

	public GraphGenerator() {

	}

	public List<DirectedGraph<Node>> createInterferenzGraphFromI386Prg(I386Prg prg) {
		List<DirectedGraph<Node>> dgList = new LinkedList<>();
		Iterator<MachineFunction> itMf = prg.iterator();
		while (itMf.hasNext()) {
			MachineFunction mf = itMf.next();
			DirectedGraph<Node> dg = createControlGraphFromMachineFunction(mf);
			
			dgList.add(dg);
		}
		return dgList;
	}

	public DirectedGraph<Node> createControlGraphFromMachineFunction(MachineFunction mf) {
		DirectedGraph<Node> dg = new DirectedGraph<>();
		List<Pair<Label, Node>> targetLables = new LinkedList<>();
		int i = 0;
		boolean isFallThrough = false;
		Node precessor=null;
		Iterator<MachineInstruction> itMi = mf.iterator();
		List<Node>instrNodes = new LinkedList<>(); 
		while (itMi.hasNext()) {
			MachineInstruction mi = itMi.next();
			Node n = new Node(mi, i);
			dg.addNode(n);
			instrNodes.add(n);
			
			if(isFallThrough){
				dg.addEdge(precessor, n);
			}
			
			Label l = mi.isLabel();
			if ( l != null ){
				targetLables.add(new Pair<Label, Node>(l, n));
			}
			
			if(mi.isFallThrough()){
				isFallThrough = true;
				precessor = n;
			} else {
				isFallThrough = false;
			}
			i++;
		}
		
		Iterator<Node> it = dg.nodeSet().iterator();
		while (it.hasNext()) {
			Node n = it.next();
			Iterator<Label> jumps = n.instr.jumps().iterator();
			while(jumps.hasNext()){
				Label l = jumps.next();
				Node dst = this.findInTargetList(l, targetLables);
				if (dst != null){
					dg.addEdge(n, dst);
				}
			}
		}
		
		dg = this.addActivityInformationToGraph(instrNodes, dg);
		
		return dg;
	}
	
	public Node findInTargetList(Label l, List<Pair<Label, Node>> targets){
		for (Pair<Label, Node> p : targets){
			if(p.getFst().equals(l)){
				return p.getSnd();
			}
		}
		return null;
	}
	
	public DirectedGraph<Node> addActivityInformationToGraph(List<Node> nodes, DirectedGraph<Node> controlGraph){
		for (int i=nodes.size()-1; i>=0; i--){
			Node n = nodes.get(i);
			n.initializeInAndOut();
			boolean cond = false;
			do {
				cond = false;
				for (int j=nodes.size()-1; j>=0; j--){
					Node l = nodes.get(j);
					l.moveListsToOld();
					l.addTempListToOut(this.getInListOfSuccessors(l, controlGraph));
					Set<Temp> in = l.getInList();
					in.addAll(l.getOutList());
					for (Temp t : l.instr.def()){
						in.remove(t);
					}
					for (Temp t : l.instr.use()){
						in.add(t);
					}
					l.addTempListToIn(in);
					if (!cond){
						cond = !(l.isNewEqOld());
					}
				}
			} while (cond);
		}
		return controlGraph;
	}
	
	public Set<Temp> getInListOfSuccessors(Node n, DirectedGraph<Node> controlGraph){
		Set<Temp> temp = new HashSet<>();
		for (Node succ : controlGraph.successors(n)){
			temp.addAll(succ.getInList());
		}
		return temp;
	}
	
	public DirectedGraph<Node> createInterferenzGraphFromControlGraph(DirectedGraph<Node> controlGraph){
		DirectedGraph<Node> interGraph = new DirectedGraph<>();
		for (Node n : controlGraph.nodeSet()){
			/*
			 * each node contains a set of in and out list
			 * Besides isMoveBetweenTemps, all methods in instructions are implemented
			 * this for loop is intended to create interference graph
			 */
		}
		return interGraph;
	}
	
	
	
	public void printDot(List<DirectedGraph<Node>> graphList){
		for (DirectedGraph<Node> ctrGraph : graphList){
			ctrGraph.printDot();
		}
	}
	
	public void printDotToFile(List<DirectedGraph<Node>> graphList) throws FileNotFoundException{
		int i = 0;
		for (DirectedGraph<Node> ctrGraph : graphList){
			String filename = "graph_" + ++i + ".dot"; 
	        File f = new File(filename);
	        PrintStream ps = new PrintStream(f);
	        ctrGraph.printDot(ps);
		}
	}

}
