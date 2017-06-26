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
import minijava.intermediate.tree.TreeStmCJump.Rel;
import minijava.intermediate.tree.TreeStmJump;
import minijava.intermediate.tree.TreeStmLabel;
import minijava.intermediate.tree.TreeStmMove;
import minijava.intermediate.tree.TreeStmSeq;
import minijava.intermediate.tree.TreeStmVisitor;
import minijava.syntax.*;
import minijava.syntax.ExpBinOp.Op;
import symboltabelle.GlobalTable;

public class Translator {

	public static GlobalTable globalTable;
	public static String currentClass;
	public static String currentMethod;

	public static TreePrg translate(Prg p, GlobalTable gt) {
		Translator.globalTable = gt;
		TreeMethod tm = translateMain(p.mainClass);
		List<TreeMethod> methods = translateClassList(p.classes);
		methods.add(0, tm);
		TreePrg treePrg = new TreePrg(methods);
		return treePrg;
	}

	private static List<TreeMethod> translateClass(DeclClass c) {

		Translator.currentClass = c.className;
		Translator.currentMethod = "";

		List<TreeMethod> methodList = new LinkedList<TreeMethod>();
		for (DeclMeth meth : c.methods) {
			methodList.add(translateMeth(meth, c.className));
		}

		return methodList;
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

		TreeMethod tm = new TreeMethod(new Label(className + "$" + m.methodName), m.parameters.size()+1, stms, t);
		return tm;

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
			return new TreeExpParam(0);
		}

		@Override
		public TreeExp visit(ExpNewIntArray x) {

			TreeExpTemp index = new TreeExpTemp(new Temp());
			TreeExpTemp address = new TreeExpTemp(new Temp());


			LinkedList<TreeExp> args = new LinkedList<>();
			args.add(new TreeExpBinOp(TreeExpBinOp.Op.MUL, new TreeExpBinOp(TreeExpBinOp.Op.PLUS, index, new TreeExpConst(1)), new TreeExpConst(4)));

			TreeStmSeq tss = new TreeStmSeq(new TreeStmMove(index, x.size.accept(this)),
					new TreeStmSeq(new TreeStmMove(address, new TreeExpCall(new TreeExpName(new Label("_halloc")),args)),
							new TreeStmSeq(new TreeStmMove(new TreeExpMem(address), index), new TreeStmSeq()))
					);
			TreeExpESeq eseq = new TreeExpESeq(tss, new TreeExpBinOp(TreeExpBinOp.Op.PLUS, address, new TreeExpConst(4)));

			return eseq;
		}

		@Override
		public TreeExp visit(ExpNew x) {
			int bytesNeeded = Translator.globalTable.getBytesNeededForClass(x.className);
			//System.out.println(bytesNeeded + " Bytes are needed for class: " + x.className);
			TreeExpName txn = new TreeExpName(new Label("_halloc"));
			TreeExpConst txc = new TreeExpConst(bytesNeeded);
			LinkedList<TreeExp> args = new LinkedList<>();
			args.add(txc);
			return new TreeExpCall(txn, args);
		}

		@Override
		public TreeExp visit(ExpBinOp e) {
			if (e.op == ExpBinOp.Op.AND) {
				TreeExpTemp t = new TreeExpTemp(new Temp());
				Label lLeftTrue = new Label();
				Label lRightTrue = new Label();
				Label lEnd = new Label();

				TreeStmSeq tss = new TreeStmSeq(new TreeStmMove(t, new TreeExpConst(0)),
						new TreeStmCJump(Rel.EQ, e.left.accept(this), new TreeExpConst(1), lLeftTrue, lEnd),
						new TreeStmLabel(lLeftTrue), new TreeStmCJump(Rel.EQ, e.right.accept(this), new TreeExpConst(1), lRightTrue, lEnd),
						new TreeStmLabel(lRightTrue),
						new TreeStmMove(t, new TreeExpConst(1)), new TreeStmLabel(lEnd));
				TreeExpESeq tees = new TreeExpESeq(tss, t);
				return tees;
			} else if (e.op == ExpBinOp.Op.DIV) {
				return new TreeExpBinOp(TreeExpBinOp.Op.DIV, e.left.accept(this), e.right.accept(this));
			} else if (e.op == ExpBinOp.Op.LT) {
				return this.convertBoolCompare(e, Rel.LT);
			} else if (e.op == ExpBinOp.Op.MINUS) {
				return new TreeExpBinOp(TreeExpBinOp.Op.MINUS, e.left.accept(this), e.right.accept(this));
			} else if (e.op == ExpBinOp.Op.PLUS) {
				return new TreeExpBinOp(TreeExpBinOp.Op.PLUS, e.left.accept(this), e.right.accept(this));
			} else if (e.op == ExpBinOp.Op.TIMES) {
				return new TreeExpBinOp(TreeExpBinOp.Op.MUL, e.left.accept(this), e.right.accept(this));
			}

			return null;
		}

		public TreeExpESeq convertBoolCompare(ExpBinOp e, Rel operator) {
			TreeExpTemp t = new TreeExpTemp(new Temp());
			Label lTrue = new Label();
			Label lFalse = new Label();

			TreeStmSeq tss = new TreeStmSeq(new TreeStmMove(t, new TreeExpConst(0)),
					new TreeStmCJump(operator, e.left.accept(this), e.right.accept(this), lTrue, lFalse),
					new TreeStmLabel(lTrue), new TreeStmMove(t, new TreeExpConst(1)), new TreeStmLabel(lFalse));

			TreeExpESeq tees = new TreeExpESeq(tss, t);
			return tees;
		}

		@Override
		public TreeExp visit(ExpArrayGet e) {
			Label lTrue = new Label();
			Label lFalse = new Label();

			LinkedList<TreeExp> args = new LinkedList<>();
			args.add(new TreeExpConst(0));

			TreeExpMem tm = null;

			TreeExp tx = e.index.accept(new TranslatorVisitorExp());
			if (tx instanceof TreeExpConst){
				TreeExpConst tc = (TreeExpConst) tx;
				int idx = tc.getValue();
				if ( idx == 0){
					tm = new TreeExpMem(e.array.accept(this));
				} else if ( idx == 1){
					tm = new TreeExpMem(new TreeExpBinOp(TreeExpBinOp.Op.PLUS, e.array.accept(this), new TreeExpConst(4)));
				} else {
					tm = new TreeExpMem(new TreeExpBinOp(TreeExpBinOp.Op.PLUS, e.array.accept(this), new TreeExpBinOp(TreeExpBinOp.Op.MUL, tc, new TreeExpConst(4))));
				}
			} else {
				tm = new TreeExpMem(new TreeExpBinOp(TreeExpBinOp.Op.PLUS, e.array.accept(this), new TreeExpBinOp(TreeExpBinOp.Op.MUL, e.index.accept(new TranslatorVisitorExp()), new TreeExpConst(4))));
			}

			return new TreeExpESeq(
					new TreeStmSeq(
							new TreeStmCJump(Rel.LT, tx, new TreeExpMem(new TreeExpBinOp(TreeExpBinOp.Op.PLUS, new TreeExpConst(-4), e.array.accept(this))), lTrue, lFalse),
							new TreeStmSeq(new TreeStmLabel(lFalse),new TreeStmSeq(
									new TreeStmMove(new TreeExpTemp(new Temp()), new TreeExpCall(new TreeExpName(new Label("_raise")), args))),
									new TreeStmSeq(new TreeStmLabel(lTrue), new TreeStmSeq())
									)
							),
					tm);
		}

		@Override
		public TreeExp visit(ExpArrayLength e) {
			return new TreeExpMem(new TreeExpBinOp(TreeExpBinOp.Op.PLUS, new TreeExpConst(-4), e.array.accept(this)));
		}

		@Override
		public TreeExp visit(ExpInvoke e) {
			List<TreeExp> argList = new LinkedList<TreeExp>();

			TreeExp te = e.obj.accept(new TranslatorVisitorExp());
			if (te instanceof TreeExpCall) {
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
			return new TreeExpConst(x.value);
		}

		@Override
		public TreeExp visit(ExpId x) {
			//System.out.println("expression id is called with paramater: " + x.id);
			
			int localIdx = Translator.globalTable.getIndexOfLocalVariable(Translator.currentClass, x.id);
			if ( localIdx > 0 ){
				TreeExpBinOp twbo = new TreeExpBinOp(TreeExpBinOp.Op.PLUS, new TreeExpConst(localIdx * 4),
						new TreeExpParam(0));
				return new TreeExpMem(twbo);
			}

			int paramIdx = Translator.globalTable.getPositionOfParameter(x.id, Translator.currentClass,
					Translator.currentMethod);
			if (paramIdx >= 0) {
				return new TreeExpParam(paramIdx);
			}
			
			TreeExpTemp txt = new TreeExpTemp(Translator.globalTable.getTempFromVariableName(x.id,
					Translator.currentClass, Translator.currentMethod));
			return txt;
		}

		@Override
		public TreeExp visit(ExpNeg x) {
			if (x.body instanceof ExpTrue) {
				return new TreeExpConst(0);
			} else if (x.body instanceof ExpFalse) {
				return new TreeExpConst(1);
			} else {
				Temp t = new Temp();
				return new TreeExpESeq(new TreeStmMove(new TreeExpTemp(t),new TreeExpBinOp(TreeExpBinOp.Op.MINUS, new TreeExpConst(1), x.body.accept(this))), new TreeExpTemp(t));

			}
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
			for (Stm s : slist.stms) {
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

			TreeStmCJump jump;
			jump = new TreeStmCJump(TreeStmCJump.Rel.EQ, s.cond.accept(new TranslatorVisitorExp()), new TreeExpConst(1),
					labelTrue, labelFalse);

			List<Label> targets = new LinkedList<Label>();
			targets.add(labelEnd);

			TreeStmSeq resultSeq;
			resultSeq = new TreeStmSeq(new TreeStmLabel(labelFalse), s.bodyFalse.accept(this),
					new TreeStmJump(new TreeExpName(labelEnd), targets), new TreeStmSeq(new TreeStmLabel(labelTrue),
							s.bodyTrue.accept(this), new TreeStmLabel(labelEnd), new TreeStmSeq()));
			stms.add(jump);
			stms.add(resultSeq);
			TreeStmSeq tss = new TreeStmSeq(stms);
			return tss;
		}

		@Override
		public TreeStm visit(StmWhile s) {
			List<TreeStm> stms = new LinkedList<TreeStm>();

			Label labelStart = new Label();
			Label labelTrue = new Label();
			Label labelEnd = new Label();

			TreeStmCJump jump;
			jump = new TreeStmCJump(TreeStmCJump.Rel.EQ, s.cond.accept(new TranslatorVisitorExp()) , new TreeExpConst(1), labelTrue, labelEnd);

			List<Label> targets =  new LinkedList<Label>();
			targets.add(labelStart);

 			TreeStmSeq resultSeq;
 			resultSeq = new TreeStmSeq(
 					//new TreeStmLabel(labelStart),s.body.accept(this),
 					jump,
 					new TreeStmSeq(new TreeStmLabel(labelTrue),
 							new TreeStmSeq(s.body.accept(this)),
 							new TreeStmJump(new TreeExpName(labelStart),targets),
 							new TreeStmSeq(new TreeStmLabel(labelEnd), new TreeStmSeq())
 							)
 					);
 			stms.add(new TreeStmLabel(labelStart));
			stms.add(resultSeq);
			TreeStmSeq tss = new TreeStmSeq(stms);
			return tss;
		}

		@Override
		public TreeStm visit(StmPrintlnInt s) {
			/*
			 * Process system.out.println create a move statatement println is
			 * always a call fill up the call with all expressions you can find
			 * in the arguments of println
			 */
			List<TreeExp> expList = new LinkedList<TreeExp>();
			expList.add(s.arg.accept(new TranslatorVisitorExp()));
			TreeExpCall tec = new TreeExpCall(new TreeExpName(new Label("_println_int")), expList);
			TreeStmMove tsm = new TreeStmMove(new TreeExpTemp(new Temp()), tec);
			return tsm;
		}

		@Override
		public TreeStm visit(StmPrintChar s) {

			List<TreeExp> expList = new LinkedList<TreeExp>();
			expList.add(s.arg.accept(new TranslatorVisitorExp()));
			TreeExpCall tec = new TreeExpCall(new TreeExpName(new Label("_print_char")), expList);
			TreeStmMove tsm = new TreeStmMove(new TreeExpTemp(new Temp()), tec);
			return tsm;
		}

		@Override
		public TreeStm visit(StmAssign s) {
			//System.out.println("statement assign: " + s.id);

			int localIdx = Translator.globalTable.getIndexOfLocalVariable(Translator.currentClass, s.id);
			
			Temp t = new Temp();
			TreeStmMove tsm;
			if (localIdx > 0) {
				TreeExpBinOp twbo = new TreeExpBinOp(TreeExpBinOp.Op.PLUS, new TreeExpConst(localIdx * 4),
						new TreeExpParam(0));
				TreeExpMem txm = new TreeExpMem(twbo);
				tsm = new TreeStmMove(txm, s.rhs.accept(new TranslatorVisitorExp()));
			} else {
				Temp temp = Translator.globalTable.getTempFromVariableName(s.id, Translator.currentClass, Translator.currentMethod);
				if ( temp == null ){
					Translator.globalTable.setTempToVariable(s.id, Translator.currentClass, Translator.currentMethod, t);
					tsm = new TreeStmMove(new TreeExpTemp(t), s.rhs.accept(new TranslatorVisitorExp()));
				} else {
					tsm = new TreeStmMove(new TreeExpTemp(temp), s.rhs.accept(new TranslatorVisitorExp()));
				}
				
			}
			return tsm;
		}

		@Override
		public TreeStm visit(StmArrayAssign s) {
			
			//System.out.println("array assign");
			
			ExpId ei = new ExpId(s.id);
			TreeExp tet = ei.accept(new TranslatorVisitorExp());
			
			Label lTrue = new Label();
			Label lFalse = new Label();

			TreeExpMem tm = null;

			LinkedList<TreeExp> args = new LinkedList<>();
			args.add(new TreeExpConst(0));

			TreeExp tx = s.index.accept(new TranslatorVisitorExp());
			if (tx instanceof TreeExpConst){
				//System.out.println("tree expression constant");
				TreeExpConst tc = (TreeExpConst) tx;
				int idx = tc.getValue();
				if ( idx == 0){
					tm = new TreeExpMem(tet);
				} else if ( idx == 1){
					tm = new TreeExpMem(new TreeExpBinOp(TreeExpBinOp.Op.PLUS, tet, new TreeExpConst(4)));
				} else {
					tm = new TreeExpMem(new TreeExpBinOp(TreeExpBinOp.Op.PLUS, tet, new TreeExpBinOp(TreeExpBinOp.Op.MUL, tc, new TreeExpConst(4))));
				}
			} else {
				//System.out.println("no constant for: " + s.id);
				tm = new TreeExpMem(new TreeExpBinOp(TreeExpBinOp.Op.PLUS, tet, new TreeExpBinOp(TreeExpBinOp.Op.MUL, s.index.accept(new TranslatorVisitorExp()), new TreeExpConst(4))));
			}

			TreeStmMove tsm = new TreeStmMove(
					new TreeExpESeq(
							new TreeStmSeq(
									new TreeStmCJump(Rel.LT, s.index.accept(new TranslatorVisitorExp()), new TreeExpMem(new TreeExpBinOp(TreeExpBinOp.Op.PLUS, new TreeExpConst(-4), tet)), lTrue, lFalse),
									new TreeStmSeq(new TreeStmLabel(lFalse),new TreeStmSeq(
											new TreeStmMove(new TreeExpTemp(new Temp()), new TreeExpCall(new TreeExpName(new Label("_raise")), args))),
											new TreeStmSeq(new TreeStmLabel(lTrue), new TreeStmSeq())
											)
									),
							tm),
					s.rhs.accept(new TranslatorVisitorExp()));
			return tsm;
		}
	}
}
