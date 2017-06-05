package symboltabelle;

import java.util.ArrayList;
import java.util.List;

import minijava.syntax.DeclMeth;
import minijava.syntax.Parameter;

public class MethodTable extends Table{
	private String name;
	
	public MethodTable(String name){
		this.name = name;
		this.lines = new ArrayList<TableLine>();
	}
	
	public void add(DeclMeth dm){
		this.addParameters(dm.parameters);
	}
	
	public void addParameters(List<Parameter> parameters){
		for (Parameter p : parameters) {
			TableLine tl = new TableLine(p.id, p.ty.accept(new SymbolTableVisitorTy()), "");
			lines.add(tl);
	    }
	}
	
	public String print(){
		StringBuffer methodContent = new StringBuffer();
		methodContent.append("  Method: " + this.name);
	    for (TableLine tl : lines) {
	    	methodContent.append("\n      ");
	    	methodContent.append(tl.print());
	    }
	    return methodContent.toString(); 
	}
}
