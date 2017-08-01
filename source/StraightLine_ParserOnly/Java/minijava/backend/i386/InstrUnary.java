package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.backend.i386.Operand.Reg;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

final class InstrUnary implements MachineInstruction {

  enum Kind {
    PUSH, POP, NEG, NOT, INC, DEC, IDIV
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
	  List<Temp> templist = op.use();
	  return templist;
  }

  @Override
  public List<Temp> def() {
	  return new LinkedList<Temp>();
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
