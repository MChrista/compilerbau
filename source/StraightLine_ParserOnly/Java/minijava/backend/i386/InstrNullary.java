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
	  List<Temp> useList = new LinkedList<Temp>();
	  if (kind == Kind.RET){
		  useList.add(I386CodeGenerator.eax.reg);
	  }
	  return useList;
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
    if(this.kind == Kind.RET || this.kind == Kind.LEAVE){
    	return false;
    }else{
    	return true;
    }
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
    return "\t" + kind + "\n";
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
     
 }
}
