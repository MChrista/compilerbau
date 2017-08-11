package minijava.symbolTable;

import minijava.syntax.TyArr;
import minijava.syntax.TyBool;
import minijava.syntax.TyClass;
import minijava.syntax.TyInt;
import minijava.syntax.TyVisitor;
import minijava.syntax.TyVoid;

public class SymbolTableVisitorTy implements TyVisitor<String> {

    @Override
    public String visit(TyVoid b) {
      return "void";
    }

    @Override
    public String visit(TyBool b) {
      return "boolean";
    }

    @Override
    public String visit(TyInt i) {
      return "int";
    }

    @Override
    public String visit(TyClass x) {
      return x.c.toString();
    }

    @Override
    public String visit(TyArr x) {
      return x.ty.accept(this) + "Arr";
    }


  }
