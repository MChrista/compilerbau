package minijava.intermediate.tree;

import minijava.intermediate.Label;
import minijava.intermediate.Temp;

import java.util.Iterator;
import java.util.List;

public final class TreeMethod implements Iterable<TreeStm> {

  private final Label name;
  private final int numberOfParameters;
  private final List<TreeStm> body;
  private final Temp returnTemp;
  private int numberOfVars;

  public TreeMethod(Label name, int numberOfParameters, List<TreeStm> body, Temp returnTemp) {
    this.name = name;
    this.numberOfParameters = numberOfParameters;
    this.body = body;
    this.returnTemp = returnTemp;
  }

  public Label getName() {
    return name;
  }

  public int getNumberOfParameters() {
    return numberOfParameters;
  }

  public Temp getReturnTemp() {
    return returnTemp;
  }
  
  public void setNumberOfVars(int n){
	  this.numberOfVars = n;
  }
  
  public int getNumberOfVars(){
	  return this.numberOfVars;
  }

  @Override
  public String toString() {
    StringBuilder s = new StringBuilder();
    s.append(getName()).append("(").append(getNumberOfParameters()).append(") {\n");
    for (TreeStm m : body) {
      s.append("  ");
      s.append(m);
      s.append("\n");
    }
    s.append("  return ").append(getReturnTemp()).append("\n");
    s.append("}\n");
    return s.toString();
  }

  @Override
  public Iterator<TreeStm> iterator() {
    return body.iterator();
  }
}
