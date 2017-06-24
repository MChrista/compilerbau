package symboltabelle;

import java.util.ArrayList;
import java.util.List;

import minijava.intermediate.Temp;
import minijava.syntax.DeclClass;
import minijava.syntax.Prg;

public class GlobalTable{
	MainTable main;
	List<ClassTable> classes = new ArrayList<ClassTable>();

	public GlobalTable(Prg prg){
		this.addMain(prg);
		this.addClasses(prg);
	}

	public void addClasses(Prg prg){
		for (DeclClass dc : prg.classes){
			ClassTable ct = new ClassTable(dc.className);
			classes.add(ct);
			ct.add(dc);
		}
	}

	public void addMain(Prg prg){
		main = new MainTable();
		main.add(prg.mainClass);
	}

	public ClassTable findClassTableByName(String name){
		for (ClassTable ct : classes){
			if (ct.name.equals(name)){
				return ct;
			}
		}
		return null;
	}
	
	public String getTypeOfVariable(String varName, String className, String methName){
		if(this.isMain(className, methName)){
			return this.main.getTypeOfVar(varName);
		} else {
			ClassTable ct = this.findClassTableByName(className);
			return ct.getTypeOfVariable(varName, methName);
		}
	}
	
	public void setTempToVariable(String varName, String className, String methName, Temp t){
		if(this.isMain(className, methName)){
			this.main.setTempToVariable(varName, t);
		} else {
			ClassTable ct = this.findClassTableByName(className);
			ct.setTempToVariable(varName, methName, t);
		}
	}
	
	public Temp getTempFromVariableName(String varName, String className, String methName){
		if(this.isMain(className, methName)){
			return this.main.getTempFromVariableName(varName);
		} else {
			ClassTable ct = this.findClassTableByName(className);
			return ct.getTempFromVariableName(varName, methName);
		}
	}
	
	public boolean isMain(String className, String methName){
		if(className.equals("") && methName.equals("main")){
			return true;
		}
		return false;
	}
	
	public int getPositionOfParameter(String varName, String className, String methName){
		ClassTable ct = this.findClassTableByName(className);
		return ct.getPositionOfParameter(varName, methName);
	}
	
	public String getTypeOfMethod(String className, String methName){
		ClassTable ct = this.findClassTableByName(className);
		return ct.getTypeOfMethod(methName);
	}
	
	public MainTable getMainTable(){
		return this.main;
	}
	
	public List getArgsOfMethod(String className, String methName){
		ClassTable ct = this.findClassTableByName(className);
		if (ct == null){
			return null;
		}
		return ct.getArgsOfMethod(methName);
	}
	
	public int getBytesNeededForClass(String className){
		ClassTable ct = this.findClassTableByName(className);
		if (ct == null){
			return 0;
		}
		return ct.getBytesNeeded();
	}
	
	public int getIndexOfLocalVariable(String className, String varName){
		ClassTable ct = this.findClassTableByName(className);
		if (ct == null){
			return -1;
		}
		return ct.getIndexOfLocalVariable(varName);
	}

	public String printTable(){
		String buffer = this.main.printTable() + "\n";
		for (ClassTable cl : classes){
			buffer = buffer + cl.printTable() + "\n";
		}
		return buffer;
	}
}

