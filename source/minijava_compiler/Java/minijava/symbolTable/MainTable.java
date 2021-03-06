package minijava.symbolTable;

import java.util.ArrayList;

import minijava.intermediate.Temp;
import minijava.syntax.DeclMain;

public class MainTable extends Table{

	public void add(DeclMain dm){
		lines = new ArrayList<TableLine>();
		lines.add(new TableLine(dm.mainArg, "StringArr", ""));
	}

	public String printTable(){
		return "main\n  " + lines.get(0).print();
	}
	
	public void setTempToVariable(String varName, Temp t){
		TableLine tl = findVariableByName(varName);
		tl.setTemp(t);
	}
	
	public Temp getTempFromVariableName(String varName){
		return this.findVariableByName(varName).getTemp();
	}
}
