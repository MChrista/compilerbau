package minijava.util;

import java.util.LinkedList;
import java.util.List;

import com.sun.xml.internal.fastinfoset.util.StringArray;

import minijava.intermediate.Temp;

public class TempNode {
	private Temp temp;
	private String[] machineRegisters = { "eax", "ebx", "ecx", "edx", "edi", "esi"};

	
	public TempNode(Temp t){
		this.temp = t;
		
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((temp == null) ? 0 : temp.hashCode());
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
		TempNode other = (TempNode) obj;
		if (temp == null) {
			if (other.temp != null)
				return false;
		} else if (!temp.equals(other.temp))
			return false;
		return true;
	}
	
	public String toString(){
		return "" + temp.toString();
	}
	
	public boolean isColored(){
		boolean colored = false;
		if(temp.getName() == null){
			return false;
		}
		for(int i = 0; i<= machineRegisters.length; i++){
			String tempName = temp.getName();
			if(tempName.contains(machineRegisters[i])){
				colored = true;
			}
		}
		return colored;
	}

}
