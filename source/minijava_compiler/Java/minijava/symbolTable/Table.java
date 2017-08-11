package minijava.symbolTable;

import java.util.ArrayList;
import java.util.List;

public abstract class Table {
	List<TableLine> lines;
	
	public String printTable(){
		return "";
	};
	
	public String getTypeOfVar(String varName){
		for ( TableLine tl : lines ){
			if (tl.getName().equals(varName)) {
				return tl.getType();
			}
		}
		return null;
	}
	
	public TableLine findVariableByName(String name){
		for(TableLine tl : lines){
			if (tl.getName().equals(name)){
				return tl;
			}
		}
		return null;
	}
}
