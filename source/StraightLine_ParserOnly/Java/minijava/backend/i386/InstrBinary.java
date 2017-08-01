package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.Pair;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

public class InstrBinary implements MachineInstruction {

  enum Kind {
    MOV, ADD, SUB, SHL, SHR, SAL, SAR, AND, OR, XOR, TEST, CMP, LEA, IMUL
  }

  private Operand src;
  private Operand dst;
  private final Kind kind;

  InstrBinary(Kind kind, Operand dst, Operand src) {
    assert (kind != null && src != null && dst != null);
    assert (!((src instanceof Operand.Mem) && (dst instanceof Operand.Mem)));
    assert (kind != Kind.LEA || (((src instanceof Operand.Mem) )) && (dst instanceof Operand.Reg));
    this.src = src;
    this.dst = dst;
    this.kind = kind;
  }
  
  public boolean isMov(){
	  if(this.kind == Kind.MOV){
		  return true;
	  }else{
		  return false;
	  }
  }
  
  public Operand getDst(){
	  return this.dst;
  }
  
  public Operand getSrc(){
	  return this.src;
  }
  
  

  @Override
  public List<Temp> use() {
	  List<Temp> templist = new LinkedList<>();
	  templist.addAll(src.use());
	  if (dst instanceof Operand.Mem || kind != Kind.MOV ){
		  templist.addAll(dst.use());
	  }
	  return templist;
  }

  @Override
  public List<Temp> def() {
	  List<Temp> tempList = new LinkedList<Temp>();
	  if (dst instanceof Operand.Reg){
		  tempList = dst.use();
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
	  if (this.kind == Kind.MOV){
		  if (this.src instanceof Operand.Reg && this.dst instanceof Operand.Reg){
			  Temp src = ((Operand.Reg) this.src).reg;
			  Temp dst = ((Operand.Reg) this.dst).reg;
			  return new Pair<Temp, Temp>(src, dst);
		  }

	  }
	  return null;
 }

  @Override
  public Label isLabel() {
    return null;
 }

  @Override
  public String toString() {
    return "\t" + kind + " " + dst + ", " + src + "\n";
  }

  @Override
  public void rename(Function<Temp, Temp> sigma) {
   src = src.rename(sigma);
   dst = dst.rename(sigma);
  }
}
