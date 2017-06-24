package symboltabelle;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import minijava.syntax.DeclMeth;
import minijava.syntax.DeclVar;
import minijava.syntax.Parameter;

public class MethodTable extends Table{
	private String name;
	private String type;
	private LinkedList<String> argsType;
	private LinkedList<String> argsName;

	public MethodTable(String name){
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
	
	public List getArgs(){
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
