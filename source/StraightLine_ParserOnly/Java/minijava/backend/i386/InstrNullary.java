package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.*;
import java.util.function.Function;

final class InstrNullary implements MachineInstruction {

  enum Kind {
    RET, LEAVE, NOP
  }

  private final Kind kind;

  InstrNullary(Kind kind) {
    this.kind = kind;
  }

  @Override
  public List<Temp> use() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public List<Temp> def() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public List<Label> jumps() {
    return null;
  }

  @Override
  public boolean isFallThrough() {
    if(this.kind == Kind.RET){
    	return false;
    }else{
    	return true;
    }
  }

  @Override
  public Pair<Temp, Temp> isMoveBetweenTemps() {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }

  @Override
  public Label isLabel() {
    return null;
  }

  @Override
  public String toString() {
    return "\t" + kind + "\n";
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
     throw new UnsupportedOperationException("Needed later for register allocation.");
 }
}
