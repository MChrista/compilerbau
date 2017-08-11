package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

final class InstrUnary implements MachineInstruction {

  enum Kind {
    PUSH, POP, NEG, NOT, INC, DEC, IDIV, IMUL
  }
  private Operand op;
  private final Kind kind;

  InstrUnary(Kind kind, Operand op) {
    assert (!(kind == Kind.POP || kind == Kind.NEG || kind == Kind.NOT
            || kind == Kind.INC || kind == Kind.DEC || kind == Kind.IDIV) || !(op instanceof Operand.Imm));
    this.op = op;
    this.kind = kind;
  }

  @Override
  public List<Temp> use() {
	  List<Temp> templist = new LinkedList<>();
	  templist.addAll(op.use());
	  if ( kind == Kind.IDIV || kind == Kind.IMUL) {
		  templist.add(I386CodeGenerator.eax.reg);
	  }
	  return templist;
  }

  @Override
  public List<Temp> def() {
	  List<Temp> tempList = new LinkedList<Temp>();
	  if (kind == Kind.IDIV || kind == Kind.IMUL){
		  tempList.add(I386CodeGenerator.eax.reg);
		  tempList.add(I386CodeGenerator.edx.reg);
	  } else if (kind != Kind.PUSH){
		  tempList.addAll(op.use());
	  }
	  return tempList;
  }

  @Override
  public List<Label> jumps() {
    return new LinkedList<Label>();
  }

  @Override
  public boolean isFallThrough() {
    return true;
  }

  @Override
  public Pair<Temp, Temp> isMoveBetweenTemps() {
	  return null;
  }

  @Override
  public Label isLabel() {
    return null;
  }

  @Override
  public String toString() {
    return "\t" + kind + " " + op + "\n";
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
	  op = op.rename(sigma);
  }
}
