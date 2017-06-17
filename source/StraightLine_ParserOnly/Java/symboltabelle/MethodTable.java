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
	private LinkedList<String> args;

	public MethodTable(String name){
		this.name = name;
		this.lines = new ArrayList<TableLine>();
		this.args = new LinkedList<String>();
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
		return args;
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
			args.add(p.ty.accept(new SymbolTableVisitorTy()));
	    }
	}

	public void addVariables(List<DeclVar> variables){
		for (DeclVar dv : variables){
			TableLine tl = new TableLine(dv.name, dv.ty.accept(new SymbolTableVisitorTy()), "");
			lines.add(tl);
		}
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
