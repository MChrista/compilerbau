package BlockBuilder;

import java.util.LinkedList;
import java.util.List;

import minijava.intermediate.Label;
import minijava.intermediate.tree.TreeMethod;
import minijava.intermediate.tree.TreeStm;
import minijava.intermediate.tree.TreeStmJump;
import minijava.intermediate.tree.TreeStmLabel;

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
	
	/*public List<Block> sort(){
		List<Block> workingBlocks = blockList;
		List<Block> orderedBlocks = new LinkedList<>();
		
		while (!workingBlocks.isEmpty()){
			orderedBlocks.add(blockList.get(0));
			TreeStm last = blockList.get(0).getLast();
			blockList.remove(0);
			// TODO
			if(last instanceof TreeStmJump){
				TreeStmJump tj = (TreeStmJump) last;
				Block b = this.findAndRemove(tj.getPossibleTargets().get(0), orderedBlocks);
				if (b != null){
					b.stmList.remove(b.stmList.size() -1);
				}
			}
		}
		
	}
	*/
	
	public Block findAndRemove(Label l, List<Block> blockList){
		for (int i=0; i< blockList.size(); i++){
			Block b = blockList.get(i);
			TreeStmLabel tl = (TreeStmLabel) b.getFirst();
			if (tl.getLabel().equals(l)){
				blockList.remove(i);
				return b;
			}
		}
		return null;
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
