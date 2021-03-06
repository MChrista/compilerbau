package minijava.backend.i386;

import minijava.backend.CodeGenerator;
import minijava.backend.MachineInstruction;
import minijava.backend.i386.InstrJump.Cond;
import minijava.backend.i386.Operand.Imm;
import minijava.backend.i386.Operand.Reg;
import minijava.intermediate.Temp;
import minijava.intermediate.tree.TreeExp;
import minijava.intermediate.tree.TreeExpBinOp;
import minijava.intermediate.tree.TreeExpBinOp.Op;
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
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

public class I386CodeGenerator implements CodeGenerator {
	protected static List<MachineInstruction> instructions = new LinkedList<>();
	protected static final Operand.Reg eax = new Reg(new Temp("eax"));
	protected static final Operand.Reg ebx = new Reg(new Temp("ebx"));
	protected static final Operand.Reg ecx = new Reg(new Temp("ecx"));
	protected static final Operand.Reg edx = new Reg(new Temp("edx"));
	protected static final Operand.Reg esp = new Reg(new Temp("esp"));
	protected static final Operand.Reg ebp = new Reg(new Temp("ebp"));
	protected static final Operand.Reg esi = new Reg(new Temp("esi"));
	protected static final Operand.Reg edi = new Reg(new Temp("edi"));

	@Override
	public List<Temp> getAllRegisters() {
		List<Temp> registers = this.getGeneralPurposeRegisters();
		registers.add(I386CodeGenerator.esp.reg);
		registers.add(I386CodeGenerator.ebp.reg);
		return registers;
	}

	@Override
	public List<Temp> getGeneralPurposeRegisters() {
		List<Temp> registers = new LinkedList<>();
		registers.add(I386CodeGenerator.eax.reg);
		registers.add(I386CodeGenerator.ebx.reg);
		registers.add(I386CodeGenerator.ecx.reg);
		registers.add(I386CodeGenerator.edx.reg);
		registers.add(I386CodeGenerator.edi.reg);
		registers.add(I386CodeGenerator.esi.reg);
		return registers;
	}

	@Override
	public I386Prg codeGen(TreePrg prg) {

		List<I386Function> functions = new LinkedList<I386Function>();
		Iterator<TreeMethod> it = prg.iterator();

		Operand.Reg oldEbx = new Operand.Reg(new Temp());
		Operand.Reg oldEsi = new Operand.Reg(new Temp());
		Operand.Reg oldEdi = new Operand.Reg(new Temp());

		while (it.hasNext()) {
			instructions = new LinkedList<>();
			TreeMethod tm = it.next();
			this.enterFunction(tm);
			instructions.add(new InstrBinary(InstrBinary.Kind.MOV, oldEbx, ebx));
			instructions.add(new InstrBinary(InstrBinary.Kind.MOV, oldEsi, esi));
			instructions.add(new InstrBinary(InstrBinary.Kind.MOV, oldEdi, edi));
			this.genMethod(tm);
			instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, eax,
					new Operand.Reg(tm.getReturnTemp())));
			instructions.add(new InstrBinary(InstrBinary.Kind.MOV, ebx, oldEbx));
			instructions.add(new InstrBinary(InstrBinary.Kind.MOV, esi, oldEsi));
			instructions.add(new InstrBinary(InstrBinary.Kind.MOV, edi, oldEdi));
			this.leaveFunction(tm);
			I386Function func = new I386Function(tm.getName(), instructions);
			functions.add(func);
		}

		I386Prg assemblyPrg = new I386Prg(functions);
		return assemblyPrg;
	}

	private void enterFunction(TreeMethod tm) {
		instructions.add(new InstrUnary(minijava.backend.i386.InstrUnary.Kind.PUSH, ebp));
		instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, ebp, esp));
		int numberOfBytes = tm.getNumberOfVars() * 4;
		instructions
				.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.SUB, esp, new Operand.Imm(numberOfBytes)));
	}

	private void leaveFunction(TreeMethod tm) {
		instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, esp, ebp));
		instructions.add(new InstrUnary(minijava.backend.i386.InstrUnary.Kind.POP, ebp));
		instructions.add(new InstrNullary(minijava.backend.i386.InstrNullary.Kind.RET));
	}

	private void genMethod(TreeMethod method) {

		Iterator<TreeStm> it = method.iterator();

		while (it.hasNext()) {
			TreeStm ts = it.next();
			ts.accept(new AssemblyVisitorStm());
		}
	}

	static class AssemblyVisitorStm implements TreeStmVisitor<String> {

		@Override
		public String visit(TreeStmMove stmMOVE) {
			Operand src;
			Operand dst;
			
			src = stmMOVE.getSrc().accept(new AssemblyExpVisitor());
			dst = stmMOVE.getDst().accept(new AssemblyExpVisitor());
			
			if (src instanceof Operand.Mem && dst instanceof Operand.Mem){
				Operand.Reg temp = new Operand.Reg(new Temp());
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, temp, src));
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, dst, temp));
			} else if (src != null && dst != null) {
				InstrBinary ib;
				if (dst instanceof Operand.Imm && ((Operand.Imm) src).imm == 0){
					ib = new InstrBinary(minijava.backend.i386.InstrBinary.Kind.XOR, src, src);
				} else {
					ib = new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, dst, src);
				}
				instructions.add(ib);
			}
			return null;
		}

		@Override
		public String visit(TreeStmJump stmJUMP) {
			stmJUMP.getDst().accept(new AssemblyExpVisitor());
			InstrJump ij = new InstrJump(minijava.backend.i386.InstrJump.Kind.JMP, stmJUMP.getPossibleTargets().get(0));
			instructions.add(ij);
			return null;
		}

		@Override
		public String visit(TreeStmCJump stmCJUMP) {
			Operand left = stmCJUMP.getLeft().accept(new AssemblyExpVisitor());
			Operand right = stmCJUMP.getRight().accept(new AssemblyExpVisitor());
			Cond cond = this.getConditionFromRelation(stmCJUMP.getRel());
			
			

			InstrBinary ib = new InstrBinary(minijava.backend.i386.InstrBinary.Kind.CMP, getRegisterFromOperand(left), getRegisterFromOperand(right));
			instructions.add(ib);
			InstrJump ij = new InstrJump(minijava.backend.i386.InstrJump.Kind.J, stmCJUMP.getLabelTrue(), null, cond);
			instructions.add(ij);

			return null;
		}

		public Cond getConditionFromRelation(Rel rel) {
			Cond cond;
			switch (rel) {
			case EQ:
				cond = Cond.E;
				break;
			case GT:
				cond = Cond.G;
				break;
			case GE:
				cond = Cond.GE;
				break;
			case LT:
				cond = Cond.L;
				break;
			case LE:
				cond = Cond.LE;
				break;
			case NE:
				cond = Cond.NE;
				break;

			default:
				cond = null;
				break;
			}
			return cond;
		}
		
		public Operand.Reg getRegisterFromOperand(Operand op){
			Operand.Reg reg;
			if (op instanceof Operand.Imm) {
				Temp t = new Temp();
				reg = new Operand.Reg(t);
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, reg, op));
				return reg;
			} else if (op instanceof Operand.Reg) {
				return ((Operand.Reg) op);
			} else if (op instanceof Operand.Mem) {
				Temp t = new Temp();
				reg = new Operand.Reg(t);
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, reg, op));
				return reg;
			} else {
				throw new UnsupportedOperationException();
			}
			
		}

		// seq doesn't exist anymore. Therefore this function is not longer
		// required
		@Override
		public String visit(TreeStmSeq stmSEQ) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public String visit(TreeStmLabel stmLABEL) {
			instructions.add(new InstrLabel(stmLABEL.getLabel()));
			// TODO Auto-generated method stub
			return null;
		}

	}

	static class AssemblyExpVisitor implements TreeExpVisitor<Operand> {

		@Override
		public Operand visit(TreeExpConst expCONST) {
			Operand op = new Operand.Imm(expCONST.getValue());
			return op;
		}

		@Override
		public Operand visit(TreeExpName expNAME) {
			// do nothing
			return null;
		}

		@Override
		public Operand visit(TreeExpTemp expTEMP) {
			Operand op = new Operand.Reg(expTEMP.getTemp());
			return op;
		}

		@Override
		public Operand visit(TreeExpParam expPARAM) {
			Operand op = new Operand.Mem(ebp.reg, null, null, 8 + expPARAM.getNumber()*4);
			return op;
		}

		@Override
		public Operand visit(TreeExpMem expMEM) {
			
			if (expMEM.getAddress() instanceof TreeExpBinOp){
				
				return handleMemoryBinOp((TreeExpBinOp)expMEM.getAddress());
			}
			
			Operand op = expMEM.getAddress().accept(this);

			if (op instanceof Operand.Imm) {
				Temp t = new Temp();
				Operand.Reg reg = new Operand.Reg(t);
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, reg, op));
				return new Operand.Mem(reg.reg);
			} else if (op instanceof Operand.Reg) {
				return new Operand.Mem(((Operand.Reg) op).reg);
			} else if (op instanceof Operand.Mem) {
				Temp t = new Temp();
				Operand.Reg reg = new Operand.Reg(t);
				instructions.add(new InstrBinary(InstrBinary.Kind.MOV, reg, op));
				return new Operand.Mem(reg.reg);
			}
			throw new UnsupportedOperationException("expmem operation is not supported");
		}
		
		public Operand.Mem handleMemoryBinOp(TreeExpBinOp expOP){
			Operand oLeft = expOP.getLeft().accept(this);
			Operand oRight = expOP.getRight().accept(this);
			
			if( expOP.getLeft() instanceof TreeExpParam || expOP.getRight() instanceof TreeExpParam){
				if (expOP.getRight() instanceof TreeExpParam){
					Operand temp = oLeft;
					oLeft = oRight;
					oRight = temp;
				}
			}
			
			if (oLeft instanceof Operand.Imm) {
				oLeft = immToReg(oLeft);
			} 
			
			if (oLeft instanceof Operand.Mem && oRight instanceof Operand.Imm){
				Operand.Reg reg = new Operand.Reg(new Temp());
				instructions.add(new InstrBinary(InstrBinary.Kind.MOV, reg, oLeft));
				if(expOP.getOp() == Op.MINUS){
					Operand.Imm oNew = new Operand.Imm(-((Operand.Imm) oRight).imm);
					return new Operand.Mem(reg.reg,null,null,oNew.imm);
				}
				return new Operand.Mem(reg.reg,null,null,((Operand.Imm) oRight).imm);
			} else if (oLeft instanceof Operand.Reg && oRight instanceof Operand.Imm){
				if(expOP.getOp() == Op.MINUS){
					Operand.Imm oNew = new Operand.Imm(-((Operand.Imm) oRight).imm);
					return new Operand.Mem(((Operand.Reg)oLeft).reg,null,null,oNew.imm);
				}
				return new Operand.Mem(((Operand.Reg)oLeft).reg,null,null,((Operand.Imm) oRight).imm);
			} else if (oRight instanceof Operand.Reg && oLeft instanceof Operand.Reg){
				if(expOP.getOp() == Op.MINUS){
					Operand.Imm oNew = new Operand.Imm(-((Operand.Imm) oLeft).imm);
					return new Operand.Mem(((Operand.Reg)oRight).reg,null,null,oNew.imm);
				}
				return new Operand.Mem(((Operand.Reg)oRight).reg,1,((Operand.Reg) oLeft).reg,0);
			} else if (oLeft instanceof Operand.Reg && oRight instanceof Operand.Mem){
				Temp t = new Temp();
				Operand.Reg reg = new Operand.Reg(t);
				instructions.add(new InstrBinary(InstrBinary.Kind.MOV, reg, oRight));
				if(expOP.getOp() == Op.MINUS){
					return new Operand.Mem(reg.reg, -1 ,((Operand.Reg)oLeft).reg,0);
				}
				return new Operand.Mem(reg.reg, 1 ,((Operand.Reg)oLeft).reg,0);
			} else if (oLeft instanceof Operand.Mem && oRight instanceof Operand.Reg){
				Temp t = new Temp();
				Operand.Reg reg = new Operand.Reg(t);
				instructions.add(new InstrBinary(InstrBinary.Kind.MOV, reg, oLeft));
				if(expOP.getOp() == Op.MINUS){
					return new Operand.Mem(((Operand.Reg)oRight).reg, -1 ,reg.reg,0);
				}
				Operand.Mem mem = new Operand.Mem(((Operand.Reg)oRight).reg, 1 ,reg.reg,0);
				return mem;
			}
			throw new UnsupportedOperationException("handling memory operation not supported");
		}
		
		public Operand immToReg(Operand imm){
			if (imm instanceof Operand.Imm){
				Temp t = new Temp();
				Operand.Reg reg = new Operand.Reg(t);
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, reg, imm));
				return reg;
			}
			return imm;
			
		}

		@Override
		public Operand visit(TreeExpBinOp expOP) {
			InstrBinary.Kind kind;
			Operand oLeft = expOP.getLeft().accept(this);
			Operand oRight = expOP.getRight().accept(this);
			
			
			if (oLeft instanceof Operand.Mem && oRight instanceof Operand.Mem){
				Operand.Reg temp = new Operand.Reg(new Temp());
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, temp, oRight));
				oRight = temp;
			}
			
			Operand.Reg reg = new Operand.Reg(new Temp());
			instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, reg, oLeft));
			oLeft = reg;
		
			switch (expOP.getOp()) {
			case PLUS:
				if (oLeft instanceof Operand.Imm) {
					oLeft = immToReg(oLeft);
				}
				if ( oRight instanceof Operand.Imm && ((Operand.Imm) oRight).imm == 1){
					instructions.add(new InstrUnary(InstrUnary.Kind.INC,oLeft));
					return oLeft;
				}
				kind = InstrBinary.Kind.ADD;
				break;
			case MINUS:
				if (oLeft instanceof Operand.Imm) {
					oLeft = immToReg(oLeft);
				}
				if ( oRight instanceof Operand.Imm && ((Operand.Imm) oRight).imm == 1){
					instructions.add(new InstrUnary(InstrUnary.Kind.DEC,oLeft));
					return oLeft;
				}
				kind = InstrBinary.Kind.SUB;
				break;
			case DIV:
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, eax, oLeft));
				if (oRight instanceof Operand.Imm) {
					reg = new Operand.Reg(new Temp());
					instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, reg, oRight));
					oRight = reg;
				}
				instructions.add(new InstrBinary(InstrBinary.Kind.MOV, I386CodeGenerator.edx, I386CodeGenerator.eax));
				instructions.add(new InstrBinary(InstrBinary.Kind.SAR,I386CodeGenerator.edx, new Operand.Imm(31)));
				instructions.add(new InstrUnary(minijava.backend.i386.InstrUnary.Kind.IDIV, oRight));
				Operand.Reg ret = new Operand.Reg(new Temp());
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, ret, eax));
				return ret;
			case MUL:
				if ( oRight instanceof Operand.Imm){
					int n = ((Operand.Imm) oRight).imm;
					if ((n > 0) && ((n & (n - 1)) == 0)){
						int exponent = (int) (Math.log(n) / Math.log(2));
						instructions.add(new InstrBinary(InstrBinary.Kind.SHL, oLeft, new Operand.Imm(exponent)));
						return oLeft;
					}
				}
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, eax, oLeft));
				if (oRight instanceof Operand.Imm) {
					reg = new Operand.Reg(new Temp());
					instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, reg, oRight));
					oRight = reg;
				}
				instructions.add(new InstrUnary(minijava.backend.i386.InstrUnary.Kind.IMUL, oRight));
				Operand.Reg ret_mul= new Operand.Reg(new Temp());
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, ret_mul, eax));
				return ret_mul;
			default:
				kind = null;
				break;
			}
			
			instructions.add(new InstrBinary(kind, oLeft, oRight));
			return oLeft;
		}

		@Override
		public Operand visit(TreeExpCall expCALL) {

			if (expCALL.getFunction() instanceof TreeExpName) {
				TreeExpName tn = (TreeExpName) expCALL.getFunction();
				for (int i = expCALL.getArguments().size() - 1; i >= 0; i--) {
					TreeExp tx = expCALL.getArguments().get(i);
					
				
					Operand op = tx.accept(this);
					
					
					if (op instanceof Operand.Imm){
						Temp t = new Temp();
						Operand opDst = new Operand.Reg(t);
						instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, opDst, op));
						op = opDst;
					}
					instructions.add(new InstrUnary(minijava.backend.i386.InstrUnary.Kind.PUSH, op));
				}

				instructions.add(new InstrJump(minijava.backend.i386.InstrJump.Kind.CALL, tn.getLabel()));
				instructions.add(new InstrBinary(minijava.backend.i386.InstrBinary.Kind.ADD, esp,
						new Operand.Imm(expCALL.getArguments().size() * 4)));
				return eax;
			} else {
				throw new UnsupportedOperationException("calls other than treeexpname are not supported");
			}
		}

		@Override
		public Operand visit(TreeExpESeq expESEQ) {
			// TODO Auto-generated method stub
			return null;
		}

	}

}
