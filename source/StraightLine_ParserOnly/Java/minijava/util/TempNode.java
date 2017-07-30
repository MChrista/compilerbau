package minijava.util;

import java.util.LinkedList;
import java.util.List;

import com.sun.xml.internal.fastinfoset.util.StringArray;

import minijava.intermediate.Temp;

public class TempNode {
	private Temp temp;
	private boolean isColored = false;
	private Temp coloredTemp;
	
	public TempNode(Temp t){
		this.temp = t;
	}
	
	public void setColor(Temp t){
		this.coloredTemp = t;
		this.isColored = true;
	}
	
	public boolean isColored(){
		return isColored;
	}
	
	public Temp getTemp(){
		return temp;
	}
	
	public Temp getColoredTemp(){
		return coloredTemp;
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
}
