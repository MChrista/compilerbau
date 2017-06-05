package symboltabelle;

import minijava.syntax.Exp;
import minijava.syntax.ExpArrayGet;
import minijava.syntax.ExpArrayLength;
import minijava.syntax.ExpBinOp;
import minijava.syntax.ExpFalse;
import minijava.syntax.ExpId;
import minijava.syntax.ExpIntConst;
import minijava.syntax.ExpInvoke;
import minijava.syntax.ExpNeg;
import minijava.syntax.ExpNew;
import minijava.syntax.ExpNewIntArray;
import minijava.syntax.ExpThis;
import minijava.syntax.ExpTrue;
import minijava.syntax.ExpVisitor;

class SymbolTableVisitorExp implements ExpVisitor<String, RuntimeException> {

    @Override
    public String visit(ExpTrue x) {
      return "true";
    }

    @Override
    public String visit(ExpFalse x) {
      return "false";
    }

    @Override
    public String visit(ExpThis x) {
      return "this";
    }

    @Override
    public String visit(ExpNewIntArray x) {
      return "new int [" + x.size.accept(this) + "]";
    }

    @Override
    public String visit(ExpNew x) {
      return "new " + x.className.toString() + "()";
    }

    @Override
    public String visit(ExpBinOp e) {
      return "(" + e.left.accept(this) + e.op.toString() + e.right.accept(this) + ")";
    }

    @Override
    public String visit(ExpArrayGet e) {
      return e.array.accept(this) + "[" + e.index.accept(this) + "]";
    }

    @Override
    public String visit(ExpArrayLength e) {
      return e.array.accept(this) + ".length";
    }

    @Override
    public String visit(ExpInvoke e) {
      String args = "";
      String sep = "";
      for (Exp ea : e.args) {
        args += sep + ea.accept(new SymbolTableVisitorExp());
        sep = ", ";
      }

      return e.obj.accept(this) + "." + e.method + "(" + args + ")";
    }

    @Override
    public String visit(ExpIntConst x) {
      return (new Integer(x.value)).toString();
    }

    @Override
    public String visit(ExpId x) {
      return x.id;
    }

    @Override
    public String visit(ExpNeg x) {
      return "!(" + x.body.accept(this) + ")";
    }
  }
