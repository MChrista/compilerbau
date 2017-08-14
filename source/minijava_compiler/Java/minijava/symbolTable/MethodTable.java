package minijava.symbolTable;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import minijava.symbolTable.SymbolTable.VarScope;
import minijava.syntax.DeclMeth;
import minijava.syntax.DeclVar;
import minijava.syntax.Parameter;

public class MethodTable extends Table{
	private int numberOfLocalVars;
	private String name;
	private String type;
	private LinkedList<String> argsType;
	private LinkedList<String> argsName;

	public MethodTable(String name){
		this.numberOfLocalVars = 0;
		this.name = name;
		this.lines = new ArrayList<TableLine>();
		this.argsType = new LinkedList<String>();
		this.argsName = new LinkedList<String>();
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getType(){
		return this.type;
	}
	
	public String getTypeOfVariable(String varName){
		return this.getTypeOfVar(varName);
	}
	
	public LinkedList<String> getArgs(){
		return argsType;
	}
	
	public void add(DeclMeth dm){
		this.addParameters(dm.parameters);
		this.addVariables(dm.localVars);
		this.type = dm.ty.accept(new SymbolTableVisitorTy());
	}

	public void addParameters(List<Parameter> parameters){
		for (Parameter p : parameters) {
			TableLine tl = new TableLine(p.id, p.ty.accept(new SymbolTableVisitorTy()), "");
			lines.add(tl);
			argsType.add(p.ty.accept(new SymbolTableVisitorTy()));
			argsName.add(p.id);
	    }
	}

	public void addVariables(List<DeclVar> variables){
		for (DeclVar dv : variables){
			if ( this.argsName.contains(dv.name)){
				new ScopeException("local variable " + dv.name + " is alread in use");
			}
			this.numberOfLocalVars++;
			TableLine tl = new TableLine(dv.name, dv.ty.accept(new SymbolTableVisitorTy()), "");
			lines.add(tl);
		}
	}
	
	public int getPositionOfParameter(String varName){
		if ( varName == this.name ){
			return 0;
		} else {
			for(int i = 0; i < argsName.size(); i++){
				if (argsName.get(i).equals(varName)){
					return i+1;
				}
			}
		}
		return -1; // not found		
	}
	
	public VarScope getScopeOfVar(String varName){
		if (this.getPositionOfParameter(varName) > 0){
			return VarScope.PARAM;
		} else if (this.findVariableByName(varName) != null ){
			return VarScope.LOCAL;
		} else {
			return null;
		}
	}
	
	public int getNumberOfLocalVars(){
		return numberOfLocalVars;
	}

	public String print(){
		StringBuffer methodContent = new StringBuffer();
		methodContent.append("  Method: " + this.type+ " " +  this.name);
	    for (TableLine tl : lines) {
	    	methodContent.append("\n      ");
	    	methodContent.append(tl.print());
	    }
	    return methodContent.toString();
	}
}
