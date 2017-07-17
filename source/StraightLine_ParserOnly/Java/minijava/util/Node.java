package minijava.util;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import minijava.backend.MachineInstruction;
import minijava.intermediate.Temp;



public class Node {
	public MachineInstruction instr;
	public int ID;
	
	private Set<Temp> in;
	private Set<Temp> out;
	private Set<Temp> oldIn;
	private Set<Temp> oldOut;
	
	public Node(MachineInstruction mInstr, int id){
		this.instr = mInstr;
		this.ID = id;
		this.initializeInAndOut();
	}
	public Node(){
		
	}
	
	public void initializeInAndOut(){
		in = new HashSet<>();
		out =  new HashSet<>();
	}
	
	public void addTempListToIn(Set<Temp> t){
		in.addAll(t);
	}
	
	public void addTempListToOut(Set<Temp> t){
		out.addAll(t);
	}
	
	public Set<Temp> getInList(){
		return this.in;
	}
	
	public Set<Temp> getOutList(){
		return this.out;
	}
	
	public void moveListsToOld(){
		oldIn = in;
		oldOut = out;
		this.initializeInAndOut();
	}
	
	public boolean isNewEqOld(){
		if (oldIn.equals(in) && oldOut.equals(out)){
			return true;
		}
		return false;
	}
		
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ID;
		result = prime * result + ((instr == null) ? 0 : instr.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Node other = (Node) obj;
		if (ID != other.ID)
			return false;
		if (instr == null) {
			if (other.instr != null)
				return false;
		} else if (!instr.equals(other.instr))
			return false;
		return true;
	}
	
	public String toString(){
		return ("" + this.ID);
	}
	

}
