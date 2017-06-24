package Translate;

import java.util.LinkedList;
import java.util.List;

import com.sun.java.swing.plaf.gtk.GTKConstants.ExpanderStyle;

import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.intermediate.tree.TreeExp;
import minijava.intermediate.tree.TreeExpBinOp;
import minijava.intermediate.tree.TreeExpCall;
import minijava.intermediate.tree.TreeExpConst;
import minijava.intermediate.tree.TreeExpESeq;
import minijava.intermediate.tree.TreeExpMem;
import minijava.intermediate.tree.TreeExpName;
import minijava.intermediate.tree.TreeExpParam;
import minijava.intermediate.tree.TreeExpTemp;
import minijava.intermediate.tree.TreeExpVisitor;
import minijava.intermediate.tree.TreeMethod;
import minijava.intermediate.tree.TreePrg;
import minijava.intermediate.tree.TreeStm;
import minijava.intermediate.tree.TreeStmCJump;
import minijava.intermediate.tree.TreeStmJump;
import minijava.intermediate.tree.TreeStmLabel;
import minijava.intermediate.tree.TreeStmMove;
import minijava.intermediate.tree.TreeStmSeq;
import minijava.intermediate.tree.TreeStmVisitor;
import minijava.syntax.*;
import minijava.syntax.ExpBinOp.Op;
import symboltabelle.GlobalTable;

public class Translator {

	private static final String indentStep = "  ";
	
	public static GlobalTable globalTable;
	public static String currentClass;
	public static String currentMethod;

	public static TreePrg translate(Prg p, GlobalTable gt) {
		Translator.globalTable = gt;
		//LinkedList<TreeMethod> methods = new LinkedList<TreeMethod>();
		TreeMethod tm = translateMain(p.mainClass);
		List<TreeMethod> methods = translateClassList(p.classes);
		methods.add(0, tm);
		TreePrg treePrg = new TreePrg(methods);
		return treePrg;
	}

	private static List<TreeMethod> translateClass(DeclClass c) {
		
		/*
		 * TODO: What happens with Vars
		 */
		
		Translator.currentClass = c.className;
		Translator.currentMethod = "";
		
		List<TreeMethod> methodList = new LinkedList<TreeMethod>();
		for(DeclMeth meth: c.methods){
			methodList.add(translateMeth(meth, c.className));
		}
		
		return methodList;

		/*
		 * return indent + "class " + c.className + (c.superName == null ? " " :
		 * " extends " + c.superName + " ") + "{\n\n" +
		 * translateVarList(c.fields, indent + indentStep) +
		 * translateMethList(c.methods, indent + indentStep) + indent + "}\n";
		 */
	}

	private static List<TreeMethod> translateClassList(List<DeclClass> cl) {

		List<TreeMethod> methods = new LinkedList<TreeMethod>();
		for (DeclClass d : cl) {
			methods.addAll(translateClass(d));
		}
		return methods;
	}

	private static TreeMethod translateMeth(DeclMeth m, String className) {
		
		Translator.currentMethod = m.methodName;
		
		TreeStm ts = m.body.accept(new TranslatorVisitorStm());
		
		LinkedList<TreeStm> stms = new LinkedList<TreeStm>();
		stms.add(ts);
		
		Temp t = new Temp();
		stms.add(new TreeStmMove(new TreeExpTemp(t), m.returnExp.accept(new TranslatorVisitorExp())));
		
		TreeMethod tm = new TreeMethod(new Label(className + "$" + m.methodName), m.parameters.size(), stms, t);
		return tm;

	}

	private static String translateVar(DeclVar d, String indent) {
		return indent + d.ty.accept(new TranslatorVisitorTy()) + " "
				+ d.name.toString() + ";";
	}

	private static String translateVarList(List<DeclVar> dl, String indent) {
		StringBuffer decls = new StringBuffer();
		for (DeclVar d : dl) {
			decls.append(translateVar(d, indent));
			decls.append("\n");
		}
		return decls.toString();
	}

	private static TreeMethod translateMain(DeclMain d) {

		int numberOfParameters = 1;
		Translator.currentClass = "";
		Translator.currentMethod = "main";
		
		LinkedList<TreeStm> stmlist = new LinkedList<>();
		stmlist.add(d.mainBody.accept(new TranslatorVisitorStm()));
		
		Temp retTemp = new Temp();
		TreeStm ret = new TreeStmMove(new TreeExpTemp(retTemp), new TreeExpConst(0));
		stmlist.add(ret);		
		
		TreeMethod tm = new TreeMethod(new Label("main"), numberOfParameters, stmlist, retTemp);

		return tm;
	}

	static class TranslatorVisitorTy implements TyVisitor<String> {

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
			return x.ty.accept(this) + "[]";
		}
	}

	static class TranslatorVisitorExp implements ExpVisitor<TreeExp, RuntimeException> {

		@Override
		public TreeExp visit(ExpTrue x) {
			return new TreeExpConst(1);
		}

		@Override
		public TreeExp visit(ExpFalse x) {
			return new TreeExpConst(0);
		}

		@Override
		public TreeExp visit(ExpThis x) {
			return null;
		}

		@Override
		public TreeExp visit(ExpNewIntArray x) {
			return null;
		}

		@Override
		public TreeExp visit(ExpNew x) {
			int bytesNeeded = Translator.globalTable.getBytesNeededForClass(x.className);
			System.out.println(bytesNeeded + " Bytes are needed for class: " + x.className);
			TreeExpName txn = new TreeExpName(new Label("_halloc"));
			TreeExpConst txc = new TreeExpConst(bytesNeeded);
			LinkedList<TreeExp> args = new LinkedList<>();
			args.add(txc);
			return new TreeExpCall(txn, args);
		}

		@Override
		public TreeExp visit(ExpBinOp e) {
			TreeExpBinOp.Op op = null;
			if (e.op == e.op.AND){
				op = op.AND;
			}
			else if (e.op == e.op.DIV){
				op = op.DIV;
			}
			else if (e.op == e.op.LT){

				op = op.MINUS;
			}
			else if (e.op == e.op.MINUS){
				op = op.MINUS;
			}
			else if (e.op == e.op.PLUS){
				op = op.PLUS;
			}
			else if (e.op == e.op.TIMES){
				op = op.MUL;
			}

			return new TreeExpBinOp(op, e.left.accept(this), e.right.accept(this));
		}

		@Override
		public TreeExp visit(ExpArrayGet e) {
			//System.out.println("pretty print arr get: " + e.array.accept(this));
			//return e.array.accept(this) + "[" + e.index.accept(this) + "]";
			return null;
		}

		@Override
		public TreeExp visit(ExpArrayLength e) {
			//return e.array.accept(this) + ".length";
			return null;
		}

		@Override
		public TreeExp visit(ExpInvoke e) {
			List<TreeExp> argList = new LinkedList<TreeExp>();
			
			TreeExp te = e.obj.accept(new TranslatorVisitorExp());
			if (te instanceof TreeExpCall ){
				// new class was generated
				argList.add(te);
			} else {
				// TODO: add parameter of calling object
				argList.add(new TreeExpParam(0));
			}
			for (Exp ea : e.args) {
				argList.add(ea.accept(new TranslatorVisitorExp()));
			}
			
			return new TreeExpCall(new TreeExpName(new Label(e.objType + "$" + e.method)), argList);
		}

		@Override
		public TreeExp visit(ExpIntConst x) {
			//return (new Integer(x.value)).toString();
			return new TreeExpConst(x.value);
		}

		@Override
		public TreeExp visit(ExpId x) {
			System.out.println("expression id is called with paramater: " + x.id);
			
			int paramIdx = Translator.globalTable.getPositionOfParameter(x.id, Translator.currentClass, Translator.currentMethod);
			if (paramIdx >= 0 ){
				return new TreeExpParam(paramIdx);
			}
			TreeExpTemp txt = new TreeExpTemp(Translator.globalTable.getTempFromVariableName(x.id, Translator.currentClass, Translator.currentMethod));
			return txt;
		}

		@Override
		public TreeExp visit(ExpNeg x) {
			return null;
			//return "!(" + x.body.accept(this) + ")";
		}
	}

	static class TranslatorVisitorStm implements StmVisitor<TreeStm, RuntimeException> {

		final String indent;

		public TranslatorVisitorStm() {

			this.indent = "";
		}

		public TranslatorVisitorStm(String indent) {
			this.indent = indent;
		}

		@Override
		public TreeStm visit(StmList slist) {
			List<TreeStm> stms = new LinkedList<TreeStm>();
			for (Stm s : slist.stms){
				stms.add(s.accept(this));
			}
			TreeStmSeq tss = new TreeStmSeq(stms);
			return tss;
		}

		@Override
		public TreeStm visit(StmIf s) {
			List<TreeStm> stms = new LinkedList<TreeStm>();

			Label labelTrue = new Label();
			Label labelFalse = new Label();
			Label labelEnd = new Label();
			
			ExpBinOp ebo = (ExpBinOp) s.cond;
			TreeStmCJump jump = null;
			if ( ebo.op == ExpBinOp.Op.LT ){
				jump = new TreeStmCJump(TreeStmCJump.Rel.LT, ebo.left.accept(new TranslatorVisitorExp()) , ebo.right.accept(new TranslatorVisitorExp()), labelTrue, labelFalse);
			} else if ( ebo.op == ExpBinOp.Op.AND ){
				jump = new TreeStmCJump(TreeStmCJump.Rel.EQ, ebo.left.accept(new TranslatorVisitorExp()) , ebo.right.accept(new TranslatorVisitorExp()), labelTrue, labelFalse);
			}
			List<Label> targets =  new LinkedList<Label>();
			targets.add(labelEnd);
 			TreeStmSeq seq = new TreeStmSeq(new TreeStmLabel(labelFalse),s.bodyFalse.accept(this),new TreeStmJump(new TreeExpName(labelEnd),targets),new TreeStmSeq(new TreeStmLabel(labelTrue), s.bodyTrue.accept(this),new TreeStmLabel(labelEnd),new TreeStmSeq()));
			
			// Return statement
			stms.add(jump);
			stms.add(seq);
			TreeStmSeq tss = new TreeStmSeq(stms);
			return tss;
		}

		@Override
		public TreeStm visit(StmWhile s) {
			/*
			return indent
					+ "while ("
					+ s.cond.accept(new TranslatorVisitorExp())
					+ ") {\n"
					+ s.body.accept(new TranslatorVisitorStm(this.indent + " "))
					+ indent + "}\n";
					*/
			return null;
		}

		@Override
		public TreeStm visit(StmPrintlnInt s) {
			/*
			 * Process system.out.println
			 * create a move statatement
			 * println is always a call
			 * fill up the call with all expressions you can find in the arguments of println
			 */
			List<TreeExp> expList = new LinkedList<TreeExp>();
			expList.add(s.arg.accept(new TranslatorVisitorExp()));
			TreeExpCall tec = new TreeExpCall(new TreeExpName(new Label("_println_int")), expList);
			TreeStmMove tsm = new TreeStmMove(new TreeExpTemp(new Temp()), tec);
			return tsm;
		}

		@Override
		public TreeStm visit(StmPrintChar s) {
			/*
			return indent + "System.out.print((char)"
					+ s.arg.accept(new TranslatorVisitorExp()) + ");\n";
					*/
			return null;
		}

		@Override
		public TreeStm visit(StmAssign s) {
			
			// if s.id == local variable
			int localIdx = Translator.globalTable.getIndexOfLocalVariable(Translator.currentClass, s.id);
			Temp t = new Temp();
			TreeStmMove tsm;
			if ( localIdx > 0 ){
				TreeExpBinOp twbo = new TreeExpBinOp(TreeExpBinOp.Op.PLUS, new TreeExpConst(localIdx*4), new TreeExpParam(0));
				TreeExpMem txm = new TreeExpMem(twbo);
				tsm = new TreeStmMove(txm, s.rhs.accept(new TranslatorVisitorExp()));
			} else {
				Translator.globalTable.setTempToVariable(s.id, Translator.currentClass, Translator.currentMethod, t);
				tsm = new TreeStmMove(new TreeExpTemp(t), s.rhs.accept(new TranslatorVisitorExp()));
			}
			return tsm;
		}

		@Override
		public TreeStm visit(StmArrayAssign s) {
			/*
			return indent + s.id + "["
					+ s.index.accept(new TranslatorVisitorExp()) + "] = "
					+ s.rhs.accept(new TranslatorVisitorExp()) + ";\n";
					*/
			return null;
		}
	}
}