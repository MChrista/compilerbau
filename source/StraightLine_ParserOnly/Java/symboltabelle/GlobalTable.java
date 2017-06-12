package symboltabelle;

import java.util.ArrayList;
import java.util.List;

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

	public boolean checkSemantic(Prg prg){
		main.checkSemantic(prg.mainClass, this);

		for (DeclClass dc : prg.classes){
			ClassTable ct = this.findClassTableByName(dc.className);
			if (ct == null){
				System.exit(1);
			}
			ct.checkSemantic(dc, this);
		}
		return false;
	}

	public ClassTable findClassTableByName(String name){
		for (ClassTable ct : classes){
			if (ct.name == name){
				return ct;
			}
		}
		return null;
	}

	public String printTable(){
		String buffer = this.main.printTable() + "\n";
		for (ClassTable cl : classes){
			buffer = buffer + cl.printTable() + "\n";
		}
		return buffer;
	}
}

