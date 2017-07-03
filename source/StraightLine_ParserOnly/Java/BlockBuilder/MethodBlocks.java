package BlockBuilder;

import java.util.LinkedList;
import java.util.List;

import minijava.intermediate.tree.TreeMethod;
import minijava.intermediate.tree.TreeStm;

public class MethodBlocks {
	
	List<Block> blockList;
	TreeMethod treeMethod;
	
	public MethodBlocks(TreeMethod m, List<Block> b ) {
		this.treeMethod = m;
		this.blockList = b;
	}

	public List<Block> getBlockList() {
		return blockList;
	}

	public void setBlockList(List<Block> blockList) {
		this.blockList = blockList;
	}
	
	
	public TreeMethod getTreeMethod() {
		return treeMethod;
	}

	public void setTreeMethod(TreeMethod m) {
		this.treeMethod = m;
	}
	
	public void sort(){
		
	}

	public String toString(){
		 StringBuilder s = new StringBuilder();
		    s.append(treeMethod.getName()).append("(").append(treeMethod.getNumberOfParameters()).append(") {\n");
		    for (Block b : blockList) {
		      s.append(b.toString());
		    }
		    s.append("  return ").append(treeMethod.getReturnTemp()).append("\n");
		    s.append("}\n");
		    return s.toString();
	}
	

}
