package minijava;

import java.util.LinkedList;
import java.util.List;

import minijava.symbolTable.*;
import minijava.syntax.*;


public class TypeChecker {

	private static SymbolTable symbolTable;

	public static void checkType(Prg p, SymbolTable gt) {
		symbolTable = gt;
		typeCheckerMain(p.mainClass);
		typeCheckerClassList(p.classes);
	}

	private static void typeCheckerClass(DeclClass c) {
		typeCheckerVarList(c.fields, c.className, "");
		typeCheckerMethList(c.methods, c.className);
	}

	private static void typeCheckerClassList(List<DeclClass> cl) {
		for (DeclClass d : cl) {
			typeCheckerClass(d);
		}
	}

	private static void typeCheckerMeth(DeclMeth m, String className) {
		for (Parameter p : m.parameters) {
	      p.ty.accept(new TypeCheckerVisitorTy());
	    }
		typeCheckerVarList(m.localVars, className, m.methodName);

		m.body.accept(new TypeCheckerVisitorStm(className, m.methodName));
		if (m.returnExp.accept(new TypeCheckerVisitorExp(className, m.methodName)).equals(symbolTable.getTypeOfMethod(className, m.methodName))){
		} else {
			new TypeException("return value is not from type of method");
		}
	}

	private static void typeCheckerMethList(List<DeclMeth> dm, String className) {
		for (DeclMeth m : dm) {
			typeCheckerMeth(m, className);
		}
	}

	private static void typeCheckerVar(DeclVar d, String className, String methName) {
		d.ty.accept(new TypeCheckerVisitorTy());
	}

	private static void typeCheckerVarList(List<DeclVar> dl, String className, String methName) {
		for (DeclVar d : dl) {
			typeCheckerVar(d, className, methName);
		}
	}

	private static void typeCheckerMain(DeclMain d) {
		d.mainBody.accept(new TypeCheckerVisitorStm("", "main"));
	}

	static class TypeCheckerVisitorTy implements TyVisitor<String> {
		public TypeCheckerVisitorTy() {
		}

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

		public String visit(TyClass x) {
			if (symbolTable.findClassTableByName(x.c.toString()) == null){
				new TypeException("Class Type is not defined " + "(" + x.c + ")");
			}
			return x.c.toString();
		}

		@Override
		public String visit(TyArr x) {
			return x.ty.accept(this) + "Arr";
		}
	}

	static class TypeCheckerVisitorExp implements ExpVisitor<String, RuntimeException> {

		private String className;
		private String methName;

		public TypeCheckerVisitorExp() {
			// TODO Auto-generated constructor stub
		}

		public TypeCheckerVisitorExp(SymbolTable gt) {
			// TODO Auto-generated constructor stub
		}

		public TypeCheckerVisitorExp(String className, String methName) {
			this.className = className;
			this.methName = methName;
		}

		@Override
		public String visit(ExpTrue x) {
			return "boolean";
		}

		@Override
		public String visit(ExpFalse x) {
			return "boolean";
		}

		@Override
		public String visit(ExpThis x) {
			if (this.className.equals("") && this.methName.equals("main")){
				new TypeException("this is not allowed in method main");
			}
			return this.className;
		}

		@Override
		public String visit(ExpNewIntArray x) {
			// probably it is sufficient to return intArr
			// Check if x is an integer
			if (x.size.accept(new TypeCheckerVisitorExp(className, methName)).equals("int")) {
				return "intArr";
			}
			new TypeException("size of new array is not from type integer");
			return "";

		}

		@Override
		public String visit(ExpNew x) {
			// just return classname in order to check if class name exists
			return x.className.toString();
		}

		@Override
		public String visit(ExpBinOp e) {
			if (e.left.accept(this).equals(e.right.accept(this))){
				if(ExpBinOp.Op.AND == e.op || ExpBinOp.Op.LT == e.op){
					return "boolean";
				} else {
					return "int";
				}
			}else{
				new TypeException("expression expbinop is not correct " + "(" + e.left.prettyPrint() + e.op.toString() +  e.right.prettyPrint() + ")");
			}
			return "";
		}

		@Override
		public String visit(ExpArrayGet e) {
			if (e.index.accept(this).equals("int")){
			}else{
				new TypeException("Array get is not working due to index is not an integer");
			}
			return e.array.accept(this).substring(0, e.array.accept(this).length()-3);
		}

		@Override
		public String visit(ExpArrayLength e) {
			e.array.accept(this);
			return "int";
		}

		@Override
		public String visit(ExpInvoke e) {
			e.objType = e.obj.accept(this);

			LinkedList<String> args = TypeChecker.symbolTable.getArgsOfMethod(e.obj.accept(this), e.method);
			if (args == null){
				new TypeException("Method " + e.method + " is not defined");
			}
			if (args.size() != e.args.size()){
				new TypeException("Number of arguments is not correct " + "(" + e.args.size() + ")");
			}
			for (int i = 0; i< e.args.size(); i++){
				if (!args.get(i).toString().equals(e.args.get(i).accept(new TypeCheckerVisitorExp(className, methName)))){
					new TypeException("Type of parameters don't match type of passed variables - " + args.get(i).toString() + " " +
				e.args.get(i).accept(new TypeCheckerVisitorExp(className, methName)));
				}
			}
			String typeOfTable = TypeChecker.symbolTable.getTypeOfMethod(e.obj.accept(this), e.method);
			if (typeOfTable == null){
				new TypeException("Method " + e.method + " is not defined");
			}
			return typeOfTable;
		}

		@Override
		public String visit(ExpIntConst x) {
			return "int";
		}

		@Override
		public String visit(ExpId x) {
			String varType = TypeChecker.symbolTable.getTypeOfVariable(x.id, className, methName);
			if (varType == null) {
				new TypeException("Could not find variable " + x.prettyPrint());
			}
			return varType;
		}

		@Override
		public String visit(ExpNeg x) {
			if (x.body.accept(this).equals("boolean")){
				return "boolean";
			} else {
				new TypeException("Negation is not possible because argument is not from type boolean " + x.prettyPrint());
			}
			return "!(" + x.body.accept(this) + ")";
		}
	}

	static class TypeCheckerVisitorStm implements StmVisitor<String, RuntimeException> {
		private String className;
		private String methName;

		public TypeCheckerVisitorStm(String className, String methName) {
			this.className = className;
			this.methName = methName;
		}

		public TypeCheckerVisitorStm() {
			// TODO Auto-generated constructor stub
		}

		@Override
		public String visit(StmList slist) {
			for (Stm s : slist.stms) {
				s.accept(new TypeCheckerVisitorStm(className, methName));
			}
			return "";
		}

		@Override
		public String visit(StmIf s) {
			if(s.cond.accept(new TypeCheckerVisitorExp(className, methName)).equals("boolean")){
				s.bodyTrue.accept(new TypeCheckerVisitorStm(className, methName));
				s.bodyFalse.accept(new TypeCheckerVisitorStm(className, methName));
			} else {
				new TypeException("Type error in if condition");
			}
			return "";
		}

		@Override
		public String visit(StmWhile s) {
			if(s.cond.accept(new TypeCheckerVisitorExp(className, methName)).equals("boolean")){
				s.body.accept(new TypeCheckerVisitorStm(className, methName));
			}else{
				new TypeException("Type error in while condition");
			}
			return "";
		}

		@Override
		public String visit(StmPrintlnInt s) {
			String type = s.arg.accept(new TypeCheckerVisitorExp(className, methName));
			if (type.equals("int")){
				return "";
			}
			new TypeException("syntax error in println. Type is not from type Int " + "(" + s.arg.prettyPrint() + ")");
			return "";
		}

		@Override
		public String visit(StmPrintChar s) {
			if(s.arg.accept(new TypeCheckerVisitorExp(className, methName)).equals("int")){
				return "";
			}
			new TypeException("syntax error in print char");
			return "";
		}

		@Override
		public String visit(StmAssign s) {
			String typeOfExpression = s.rhs.accept(new TypeCheckerVisitorExp(className, methName));
			String typeOfVariable = TypeChecker.symbolTable.getTypeOfVariable(s.id, className, methName);

			if (typeOfExpression.equals(typeOfVariable)){
				return "";
			}else{
				new TypeException("Statement assign is not correct: " + s.id );
			}
			return "";


		}

		@Override
		public String visit(StmArrayAssign s) {
			if ( s.index.accept(new TypeCheckerVisitorExp(className, methName)).equals("int")){
				String typeOfArray = TypeChecker.symbolTable.getTypeOfVariable(s.id, this.className, this.methName);
				String typeOfArrayField = typeOfArray.substring(0, typeOfArray.length()-3);
				if (s.rhs.accept(new TypeCheckerVisitorExp(className, methName)).equals(typeOfArrayField)){
					return "";
				} else {
					new TypeException("Array assign fails because type of array doesn't match type of expression.");
				}
			} else {
				new TypeException("Array assign does not work due to wrong type.");
			}
			return "";
		}
	}
}
