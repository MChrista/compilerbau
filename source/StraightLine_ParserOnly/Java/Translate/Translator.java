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
import minijava.intermediate.tree.TreeExpName;
import minijava.intermediate.tree.TreeExpTemp;
import minijava.intermediate.tree.TreeExpVisitor;
import minijava.intermediate.tree.TreeMethod;
import minijava.intermediate.tree.TreePrg;
import minijava.intermediate.tree.TreeStmCJump;
import minijava.intermediate.tree.TreeStmLabel;
import minijava.syntax.*;
import minijava.syntax.ExpBinOp.Op;

public class Translator {

	private static final String indentStep = "  ";

	public static TreePrg translate(Prg p) {
		List<TreeMethod> methods = translateClassList(p.classes);
		TreeMethod tm = translateMain(p.mainClass);
		methods.add(0, tm);
		TreePrg treePrg = new TreePrg(methods);
		return treePrg;
	}

	private static List<TreeMethod> translateClass(DeclClass c) {

		List methodList = new LinkedList<TreeMethod>();
		for(DeclMeth meth:c.methods){
			TreeMethod treeMeth = new TreeMethod(new Label(meth.methodName), meth.parameters.size() + 1, translateMethList(c.methods), new Temp());
			methodList.add(meth);
		}
		return new LinkedList<TreeMethod>();

		/*
		 * return indent + "class " + c.className + (c.superName == null ? " " :
		 * " extends " + c.superName + " ") + "{\n\n" +
		 * translateVarList(c.fields, indent + indentStep) +
		 * translateMethList(c.methods, indent + indentStep) + indent + "}\n";
		 */
	}

	private static List<TreeMethod> translateClassList(List<DeclClass> cl) {

		List<TreeMethod> methods = new LinkedList<>();
		for (DeclClass d : cl) {
			methods.addAll(translateClass(d));
		}
		return methods;
	}

	private static String translateMeth(DeclMeth m) {
		String params = "", sep = "";
		for (Parameter p : m.parameters) {
			params += sep + p.ty.accept(new TranslatorVisitorTy()) + " " + p.id;
			sep = ", ";
		}
		return null;

		/*return indent + "public " + m.ty.accept(new TranslatorVisitorTy())
				+ " " + m.methodName + " (" + params + ") {\n"
				+ translateVarList(m.localVars, indent + indentStep)
				+ m.body.accept(new TranslatorVisitorStm(indent + indentStep))
				+ indent + indentStep + "return "
				+ m.returnExp.accept(new TranslatorVisitorExp()) + ";\n"
				+ indent + "}\n";
				*/
	}

	private static List<TreeStm> translateMethList(List<DeclMeth> dm) {
		StringBuffer meths = new StringBuffer();

		for (DeclMeth m : dm) {
			meths.append("\n");
			meths.append(translateMeth(m));
		}
		return null;
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

		String name = "main";
		int numberOfParameters = 1;
		int returnTemp = 1;

		/*TreeMethod tm = new TreeMethod(new Label(name), numberOfParameters,
				d.mainBody.accept(new TranslatorVisitorStm()), new Temp());
		mainMethod TreeMethod = new TreeMethod(name, numberOfParameters, body,
				returnTemp);*/

		return null;
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
			return new TreeExpName(new Label(x.className));
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

				TreeStmCJump tsj = new TreeStmCJump(TreeStmCJump.Rel.LT, e.left.accept(this), e.right.accept(this), new Label(), new Label());
				TreeExpESeq treeEseq = new TreeExpESeq(tsj, new TreeExpTemp(new Temp()));
				return treeEseq;
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
			List<TreeExp> argList = new LinkedList<>();
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
			//return x.id;
			return null;
		}

		@Override
		public TreeExp visit(ExpNeg x) {
			return null;
			//return "!(" + x.body.accept(this) + ")";
		}
	}

	static class TranslatorVisitorStm implements StmVisitor<String, RuntimeException> {

		final String indent;

		public TranslatorVisitorStm() {

			this.indent = "";
		}

		public TranslatorVisitorStm(String indent) {
			this.indent = indent;
		}

		@Override
		public String visit(StmList slist) {
			StringBuffer str = new StringBuffer();
			for (Stm s : slist.stms) {
				str.append(s.accept(new TranslatorVisitorStm(indent)));
			}
			return str.toString();
		}

		@Override
		public String visit(StmIf s) {
			return indent
					+ "if ("
					+ s.cond.accept(new TranslatorVisitorExp())
					+ ") {\n"
					+ s.bodyTrue.accept(new TranslatorVisitorStm(this.indent
							+ indentStep))
					+ indent
					+ "} else {\n"
					+ s.bodyFalse.accept(new TranslatorVisitorStm(this.indent
							+ indentStep)) + indent + "}\n";
		}

		@Override
		public String visit(StmWhile s) {

			return indent
					+ "while ("
					+ s.cond.accept(new TranslatorVisitorExp())
					+ ") {\n"
					+ s.body.accept(new TranslatorVisitorStm(this.indent + " "))
					+ indent + "}\n";
		}

		@Override
		public String visit(StmPrintlnInt s) {
			return indent + "System.out.println("
					+ s.arg.accept(new TranslatorVisitorExp()) + ");\n";
		}

		@Override
		public String visit(StmPrintChar s) {
			return indent + "System.out.print((char)"
					+ s.arg.accept(new TranslatorVisitorExp()) + ");\n";
		}

		@Override
		public String visit(StmAssign s) {
			return indent + s.id + " = "
					+ s.rhs.accept(new TranslatorVisitorExp()) + ";\n";
		}

		@Override
		public String visit(StmArrayAssign s) {
			return indent + s.id + "["
					+ s.index.accept(new TranslatorVisitorExp()) + "] = "
					+ s.rhs.accept(new TranslatorVisitorExp()) + ";\n";
		}
	}
}
