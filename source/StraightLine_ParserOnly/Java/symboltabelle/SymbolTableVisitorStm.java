package symboltabelle;

import minijava.syntax.Stm;
import minijava.syntax.StmArrayAssign;
import minijava.syntax.StmAssign;
import minijava.syntax.StmIf;
import minijava.syntax.StmList;
import minijava.syntax.StmPrintChar;
import minijava.syntax.StmPrintlnInt;
import minijava.syntax.StmVisitor;
import minijava.syntax.StmWhile;

class SymbolTableVisitorStm implements StmVisitor<String, RuntimeException> {
	
	private final String indentStep = "  ";
    final String indent;

    public SymbolTableVisitorStm() {
      this.indent = "";
    }

    public SymbolTableVisitorStm(String indent) {
      this.indent = indent;
    }

    @Override
    public String visit(StmList slist) {
      StringBuffer str = new StringBuffer();
      for (Stm s : slist.stms) {
        str.append(s.accept(new SymbolTableVisitorStm(indent)));
      }
      return str.toString();
    }

    @Override
    public String visit(StmIf s) {
      return "";
    }

    @Override
    public String visit(StmWhile s) {
      return "";
    }

    @Override
    public String visit(StmPrintlnInt s) {
      return indent + "System.out.println(" +
              s.arg.accept(new SymbolTableVisitorExp()) + ");\n";
    }

    @Override
    public String visit(StmPrintChar s) {
      return indent + "System.out.print((char)" +
              s.arg.accept(new SymbolTableVisitorExp()) + ");\n";
    }

    @Override
    public String visit(StmAssign s) {
      return indent + s.id + " = " +
              s.rhs.accept(new SymbolTableVisitorExp()) + ";\n";
    }

    @Override
    public String visit(StmArrayAssign s) {
      return indent + s.id +
              "[" + s.index.accept(new SymbolTableVisitorExp()) + "] = " +
              s.rhs.accept(new SymbolTableVisitorExp()) + ";\n";
    }
  }
