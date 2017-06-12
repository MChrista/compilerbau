package symboltabelle;

import java.util.ArrayList;
import java.util.List;

import minijava.syntax.DeclClass;
import minijava.syntax.DeclMeth;
import minijava.syntax.DeclVar;

public class ClassTable extends Table{
	List<MethodTable> methods = new ArrayList<MethodTable>();
	String name;
	
	public ClassTable(String name){
		this.name = name;
		this.lines = new ArrayList<TableLine>();
	}
	
	public void add(DeclClass dc){
		this.addVariables(dc.fields);
		this.addMethods(dc.methods);
	}
	
	public void addVariables(List<DeclVar> fields){
	    for (DeclVar d : fields) {
	      lines.add(new TableLine(d.name, d.ty.accept(new SymbolTableVisitorTy()), ""));
	    }
	}
	
	public void addMethods(List<DeclMeth> dm){
		for(DeclMeth method : dm){
			MethodTable mt = new MethodTable(method.methodName);
			methods.add(mt);
			mt.add(method);
		}	
	}
	
	public void checkSemantic(DeclClass dc, GlobalTable gt) {
		
		
		// TODO Auto-generated method stub
		
	}
	
	public String printTable(){
		StringBuffer classes = new StringBuffer();
		classes.append("class " + this.name);
	    for (TableLine tl : lines) {
	      classes.append("\n  ");
	      classes.append(tl.print());
	    }
	    for (MethodTable mt : methods) {
	      classes.append("\n  ");
	      classes.append(mt.print());
	    }
	    return classes.toString(); 
	}

	
}
