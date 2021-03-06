package minijava.backend.regDistributor;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintStream;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import minijava.backend.*;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.DirectedGraph;
import minijava.util.Node;
import minijava.util.Pair;
import minijava.util.TempNode;

public class GraphGenerator {

	public List<DirectedGraph<TempNode>> createInterferenzGraphFromMachinePrg(MachinePrg prg) throws FileNotFoundException {
		List<DirectedGraph<TempNode>> dgList = new LinkedList<>();
		List<DirectedGraph<Node>> ctrlList = new LinkedList<>();
		
		Iterator<MachineFunction> itMf = prg.iterator();
		while (itMf.hasNext()) {
			MachineFunction mf = itMf.next();
			DirectedGraph<Node> dg = createControlGraphFromMachineFunction(mf);
			DirectedGraph<TempNode> iG = createInterferenzGraphFromControlGraph(dg);
			ctrlList.add(dg);
			dgList.add(iG);
		}

		return dgList;
	}
	
	public DirectedGraph<TempNode> createInterferenceGraphFromMachineFunction(MachineFunction mf){
		DirectedGraph<Node> ctrGraph = createControlGraphFromMachineFunction(mf);
		DirectedGraph<TempNode> interGraph = createInterferenzGraphFromControlGraph(ctrGraph);
		return interGraph;
	}

	public DirectedGraph<Node> createControlGraphFromMachineFunction(MachineFunction mf) {
		DirectedGraph<Node> dg = new DirectedGraph<>();
		List<Pair<Label, Node>> targetLables = new LinkedList<>();
		int i = 0;
		boolean isFallThrough = false;
		Node precessor=null;
		Iterator<MachineInstruction> itMi = mf.iterator();
		List<Node>instrNodes = new LinkedList<>(); // list is needed for reverse loop during adding activities to nodes
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
			Iterator<Label> jumps = n.getInstr().jumps().iterator();
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
		}
		
		boolean cond = false;
		do {
			cond = false;
			for (int j=nodes.size()-1; j>=0; j--){
				Node l = nodes.get(j);
				l.moveListsToOld();
				l.addTempListToOut(this.getInListOfSuccessors(l, controlGraph));
				Set<Temp> in = new HashSet<>();
				in.addAll(l.getOutList());
				for (Temp t : l.getInstr().def()){
					in.remove(t);
				}
				for (Temp t : l.getInstr().use()){
					in.add(t);
				}
				l.addTempListToIn(in);
				if (!cond){
					cond = !(l.isNewEqOld());
				}
			}
		} while (cond);
		//this.printNodesWithLists(nodes); // here we can verify that activities are added correctly to nodes
		
		return controlGraph;
	}
	
	public Set<Temp> getInListOfSuccessors(Node n, DirectedGraph<Node> controlGraph){
		Set<Temp> temp = new HashSet<>();
		for (Node succ : controlGraph.successors(n)){
			temp.addAll(succ.getInList());
		}
		return temp;
	}
	
	public DirectedGraph<TempNode> createInterferenzGraphFromControlGraph(DirectedGraph<Node> controlGraph){
		
		DirectedGraph<TempNode> interGraph = this.addNodesToInterGraph(controlGraph);
		
		for (Node n : controlGraph.nodeSet()){
			Set<Temp> out = n.getOutList();
			
			if(n.getInstr().isMoveBetweenTemps() == null){
				for(Temp t : n.getInstr().def()){
					TempNode tn1 = new TempNode(t);
					for(Temp u : out){
						TempNode tn2 = new TempNode(u);
						if (!tn1.equals(tn2)){
							this.addEdgesToInterferenceGraph(tn1, tn2, interGraph);
						}
					}
				}
			}
			else{
				Pair<Temp, Temp> mov = n.getInstr().isMoveBetweenTemps();
				Temp v = mov.getFst();
				Temp t = mov.getSnd();
				TempNode tn1 = new TempNode(t);
				for(Temp u : out){
					if(!u.equals(v)){
						TempNode tn2 = new TempNode(u);
						if (!tn2.equals(tn1)){
							this.addEdgesToInterferenceGraph(tn1, new TempNode(u), interGraph);
						}
					}
				}
			}
		}
		return interGraph;
	}
	
	public DirectedGraph<TempNode> addNodesToInterGraph(DirectedGraph<Node> ctrGraph){
		DirectedGraph<TempNode> interGraph = new DirectedGraph<>();
		for (Node n : ctrGraph.nodeSet()){
			for(Temp t : n.getInstr().def()){
				interGraph.addNode(new TempNode(t));
			}
			for(Temp t : n.getInstr().use()){
				interGraph.addNode(new TempNode(t));
			}
		}
		return interGraph;
	}
	
	public void addEdgesToInterferenceGraph(TempNode u, TempNode v, DirectedGraph<TempNode> interGraph){
		interGraph.addEdge(u, v);
		interGraph.addEdge(v, u);
	}
	
	
	
	public void printNodesWithLists(List<Node> nodeList){
		StringBuffer sb = new StringBuffer();
		for (Node n : nodeList){
			sb.append(n.getInAndOutList());
		}
		System.out.println(sb);
	}
	
	
	public void printDot(List<DirectedGraph<Node>> graphList){
		for (DirectedGraph<Node> ctrGraph : graphList){
			ctrGraph.printDot(System.out);
		}
	}
	
	public void printTempDot(List<DirectedGraph<TempNode>> graphList){
		for (DirectedGraph<TempNode> ctrGraph : graphList){
			ctrGraph.printDot(System.out);
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
	
	public void printTempDotToFile(List<DirectedGraph<TempNode>> graphList) throws FileNotFoundException{
		int i = 0;
		for (DirectedGraph<TempNode> ctrGraph : graphList){
			String filename = "graph_" + ++i + ".dot"; 
	        File f = new File(filename);
	        PrintStream ps = new PrintStream(f);
	        ctrGraph.printDot(ps);
		}
	}

}
