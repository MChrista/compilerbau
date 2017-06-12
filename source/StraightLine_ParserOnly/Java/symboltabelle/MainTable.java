package symboltabelle;

import java.util.ArrayList;

import minijava.syntax.DeclMain;

public class MainTable extends Table{

	public void add(DeclMain dm){
		lines = new ArrayList<TableLine>();
		lines.add(new TableLine(dm.mainArg, "StringArr", ""));
	}

	public String printTable(){
		return "main\n  " + lines.get(0).print();
	}

	public void checkSemantic(DeclMain mainClass, GlobalTable gt) {
		mainClass.mainBody.accept(new SymbolTableVisitorStm());

		// TODO Auto-generated method stub

	}
}
