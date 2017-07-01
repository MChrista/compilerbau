package symboltabelle;

import java.util.ArrayList;
import java.util.List;

import minijava.intermediate.Temp;
import minijava.syntax.DeclClass;
import minijava.syntax.DeclMeth;
import minijava.syntax.DeclVar;
import symboltabelle.GlobalTable.VarScope;

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
	
	public String getTypeOfVariable(String varName, String methName){
		MethodTable mt = this.getMethodTableByName(methName);
		if (mt == null){
			return this.getTypeOfVar(varName);
		}else{
			String varType = mt.getTypeOfVariable(varName);
			if (varType == null){
				return this.getTypeOfVar(varName);
			}
			return varType;
		}
	}
	
	public TableLine findVariableByName(String name){
		for(TableLine tl : lines){
			if (tl.getName().equals(name)){
				return tl;
			}
		}
		return null;
	}
	
	public MethodTable getMethodTableByName(String methName){
		for (MethodTable tl : methods){
			if (tl.getName().equals(methName)){
				return tl;
			}
		}
		return null;
	}
	
	public String getTypeOfMethod(String methName){
		for (MethodTable tl : methods){
			if (tl.getName().equals(methName)){
				return tl.getType();
			}
		}
		return null;
	}
	
	public List getArgsOfMethod(String methName){
		MethodTable mt = this.getMethodTableByName(methName);
		if(mt == null){
			return null;
		}
		return mt.getArgs();
	}
	
	public int getBytesNeeded(){
		int bytesForClass = 4;
		int bytesForVariables = this.lines.size() * 4;
		return bytesForClass + bytesForVariables;
	}
	
	public void setTempToVariable(String varName, String methName, Temp t){
		MethodTable mt = this.getMethodTableByName(methName);
		if (mt == null){
			TableLine tl = this.findVariableByName(varName);
			tl.setTemp(t);
		}else{
			TableLine tl = mt.findVariableByName(varName);
			if (tl == null){
				TableLine tl2 = this.findVariableByName(varName);
				tl.setTemp(t);
			}
			tl.setTemp(t);
		}
	}
	
	public Temp getTempFromVariableName(String varName, String methName){
		MethodTable mt = this.getMethodTableByName(methName);
		if (mt == null){
			TableLine tl = this.findVariableByName(varName);
			return tl.getTemp();
		}else{
			TableLine tl = mt.findVariableByName(varName);
			if (tl == null){
				TableLine tl2 = this.findVariableByName(varName);
				return tl2.getTemp();
			}
			return tl.getTemp();
		}
	}
	
	public VarScope getScopeOfVar(String methodName, String varName){
		MethodTable mt = this.getMethodTableByName(methodName);
		if (mt == null){
			TableLine tl = this.findVariableByName(varName);
			if (tl != null){
				return VarScope.GLOBAL;
			}
			return null;
		}else{
			VarScope vs = mt.getScopeOfVar(varName);
			if (vs == null){
				TableLine tl = this.findVariableByName(varName);
				if (tl != null){
					return VarScope.GLOBAL;
				}
			}
			return vs;
		}
	}
	
	public int getPositionOfParameter(String varName, String methName){
		MethodTable mt = this.getMethodTableByName(methName);
		return mt.getPositionOfParameter(varName);
	}
	
	public int getIndexOfLocalVariable(String varName){
		for (int i = 0; i < lines.size(); i++){
			TableLine tl = lines.get(i);
			if(tl.getName().equals(varName)){
				return i+1;
			}
		}
		return -1;
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
