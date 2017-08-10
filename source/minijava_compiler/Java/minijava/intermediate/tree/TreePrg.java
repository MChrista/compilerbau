package minijava.intermediate.tree;

import java.util.Iterator;
import java.util.List;

public final class TreePrg implements Iterable<TreeMethod> {

  private final List<TreeMethod> methods;

  public TreePrg(List<TreeMethod> methods) {
    this.methods = methods;
  }

  @Override
  public String toString() {
    StringBuilder s = new StringBuilder();
    for (TreeMethod m : methods) {
      s.append(m);
      s.append("\n");
    }
    return s.toString();
  }

  @Override
  public Iterator<TreeMethod> iterator() {
    return methods.iterator();
  }
}
