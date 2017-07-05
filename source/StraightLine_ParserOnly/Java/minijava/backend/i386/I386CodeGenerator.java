package minijava.backend.i386;

import minijava.backend.CodeGenerator;
import minijava.backend.MachineFunction;
import minijava.backend.MachineInstruction;
import minijava.backend.i386.I386CodeGenerator.AssemblyExpVisitor;
import minijava.intermediate.Temp;
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
import minijava.syntax.StmVisitor;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

import com.sun.beans.util.Cache.Kind;

public class I386CodeGenerator implements CodeGenerator {
	public static List<MachineInstruction> instructions = new LinkedList<>();
	public static Temp eax,ebx,ecx,edx,esp,ebp,esi,edi;
	
	/*
	 * eax, edx, ecx = caller save
	 * ebx, esi, edi = callee save
	 * esp = stack pointer
	 * ebp = frame pointer
	 */

  @Override
  public List<Temp> getAllRegisters() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public List<Temp> getGeneralPurposeRegisters() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public I386Prg codeGen(TreePrg prg) {
	  
	  List <I386Function> functions = new LinkedList<I386Function>();
	  Iterator<TreeMethod> it = prg.iterator();
	  
	  while(it.hasNext()){
		  instructions = new LinkedList<>();
		  TreeMethod tm = it.next();
		  this.genMethod(tm);
		  I386Function func = new I386Function(tm.getName(), instructions);
		  functions.add(func);
	  }
	  
	  I386Prg assemblyPrg = new I386Prg(functions);
	  return assemblyPrg;
  }
  
  public void genMethod(TreeMethod method){
	  
	  Iterator<TreeStm> it = method.iterator();
	  
	  while(it.hasNext()){
		  TreeStm ts = it.next();
		  ts.accept(new AssemblyVisitorStm());
	  }
  }
  
  static class AssemblyVisitorStm implements TreeStmVisitor<String> {

	@Override
	public String visit(TreeStmMove stmMOVE) {
		Operand src = stmMOVE.getSrc().accept(new AssemblyExpVisitor());
		Operand dst = stmMOVE.getDst().accept(new AssemblyExpVisitor());
		
		if ( src != null && dst != null){
			InstrBinary ib = new InstrBinary(minijava.backend.i386.InstrBinary.Kind.MOV, dst, src);
			instructions.add(ib);
		}
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String visit(TreeStmJump stmJUMP) {
		
		stmJUMP.getDst().accept(new AssemblyExpVisitor());
		
		InstrJump ij = new InstrJump(minijava.backend.i386.InstrJump.Kind.JMP, stmJUMP.getPossibleTargets().get(0));
		instructions.add(ij);
		
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String visit(TreeStmCJump stmCJUMP) {
		Operand left = stmCJUMP.getLeft().accept(new AssemblyExpVisitor());
		Operand right = stmCJUMP.getRight().accept(new AssemblyExpVisitor());
		
		InstrBinary ib = new InstrBinary(minijava.backend.i386.InstrBinary.Kind.CMP, right, left);
		instructions.add(ib);
		InstrJump ij = new InstrJump(minijava.backend.i386.InstrJump.Kind.J, stmCJUMP.getLabelTrue());
		instructions.add(ij);
		
		
		stmCJUMP.getLabelFalse();
		stmCJUMP.getLabelTrue();
		stmCJUMP.getLeft().accept(new AssemblyExpVisitor());
		stmCJUMP.getRight().accept(new AssemblyExpVisitor());
		stmCJUMP.getRel();
		
		
		// TODO Auto-generated method stub
		return null;
	}

	// seq doesn't exist anymore. Therefore this function is not longer required
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
  
  static class AssemblyExpVisitor implements TreeExpVisitor<Operand>{

	@Override
	public Operand visit(TreeExpConst expCONST) {
		Operand op = new Operand.Imm(expCONST.getValue());
		return op;
	}

	@Override
	public Operand visit(TreeExpName expNAME) {
		InstrLabel il = new InstrLabel(expNAME.getLabel());

		instructions.add(il);
		return null;
	}

	@Override
	public Operand visit(TreeExpTemp expTEMP) {
		Operand op = new Operand.Reg(expTEMP.getTemp());
		// TODO Auto-generated method stub
		return op;
	}

	@Override
	public Operand visit(TreeExpParam expPARAM) {
		Operand op = new Operand.Mem(esp, 4, null,expPARAM.getNumber());
		return op;
	}

	@Override
	public Operand visit(TreeExpMem expMEM) {
		expMEM.getAddress();
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Operand visit(TreeExpBinOp expOP) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Operand visit(TreeExpCall expCALL) {
		
		
		if(expCALL.getFunction() instanceof TreeExpName){
			TreeExpName tn = (TreeExpName) expCALL.getFunction();
			instructions.add(new InstrJump(minijava.backend.i386.InstrJump.Kind.CALL, tn.getLabel()));
		}
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Operand visit(TreeExpESeq expESEQ) {
		// TODO Auto-generated method stub
		return null;
	}
	  
  }
  
  
  

}
