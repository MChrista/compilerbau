package minijava.util;

import minijava.backend.MachineInstruction;



public class Node {
	public MachineInstruction instr;
	public int ID;
	
	public Node(MachineInstruction mInstr, int id){
		this.instr = mInstr;
		this.ID = id;
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
