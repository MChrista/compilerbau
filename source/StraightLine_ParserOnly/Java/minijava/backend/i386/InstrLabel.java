package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

final class InstrLabel implements MachineInstruction {

  private final Label label;

  InstrLabel(Label label) {
    this.label = label;
  }

  @Override
  public List<Temp> use() {
	  return new LinkedList<Temp>();
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
    return label;
  }

  @Override
  public String toString() {
    return label + ":\n";
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
    throw new UnsupportedOperationException("Needed later for register allocation.");
  }
}
