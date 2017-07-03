package minijava.intermediate.canon;

import minijava.intermediate.tree.TreeMethod;
import minijava.intermediate.tree.TreePrg;
import minijava.intermediate.tree.TreeStm;

import java.util.ArrayList;
import java.util.List;

/**
 * Main class for canonization. Use {@code canonPrg} to canonize a tree program.
 */
public class Canonizer {

  public TreePrg canonPrg(TreePrg prg) {
    List<TreeMethod> canonMeth = new ArrayList<>();
    for (TreeMethod m : prg) {
      canonMeth.add(canonMethod(m));
    }
    return new TreePrg(canonMeth);
  }

  private TreeMethod canonMethod(TreeMethod method) {

    List<TreeStm> canonBody = new ArrayList<>();
    for (TreeStm s : method) {
      canonBody.addAll(s.accept(new CanonStm()));
    }
    return new TreeMethod(method.getName(), method.getNumberOfParameters(), canonBody, method.getReturnTemp());
  }

}
