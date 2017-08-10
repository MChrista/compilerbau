package minijava.util;

import minijava.intermediate.Temp;

public class TempNode {
	private Temp temp;
	
	public TempNode(Temp t){
		this.temp = t;
	}
	
	public Temp getTemp(){
		return temp;
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
		return "Temp: " + temp.toString();
	}
}
