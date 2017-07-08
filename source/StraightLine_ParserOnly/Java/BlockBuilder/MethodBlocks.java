package BlockBuilder;

import java.util.LinkedList;
import java.util.List;

import minijava.intermediate.Label;
import minijava.intermediate.tree.TreeExpName;
import minijava.intermediate.tree.TreeMethod;
import minijava.intermediate.tree.TreeStm;
import minijava.intermediate.tree.TreeStmCJump;
import minijava.intermediate.tree.TreeStmJump;
import minijava.intermediate.tree.TreeStmLabel;

public class MethodBlocks {
	
	List<Block> blockList;
	TreeMethod treeMethod;
	boolean hasEndJump = false;
	
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
		List<Block> workingBlocks = blockList;
		List<Block> orderedBlocks = new LinkedList<>();
		
		while (!workingBlocks.isEmpty()){
			orderedBlocks.add(workingBlocks.get(0));
			workingBlocks.remove(0);
			//Letztes Statement des zuletz hinzugefügten Blocks an orderedBlocks
			TreeStm last = orderedBlocks.get(orderedBlocks.size()-1).getLast();
			// TODO
			if(last instanceof TreeStmJump){
				TreeStmJump tj = (TreeStmJump) last;
				Block handledBlock = this.findAndRemove(tj.getPossibleTargets().get(0), workingBlocks);
				if (handledBlock != null){
					orderedBlocks.get(orderedBlocks.size()-1).removeLast();
					orderedBlocks.add(handledBlock);
					//handledBlock.stmList.remove(handledBlock.stmList.size() -1);
				}
				else{
					//Block not in workingList
					//nothing has to be done
				}
			}
			else if(last instanceof TreeStmCJump){
				TreeStmCJump tcj = (TreeStmCJump) last;
				Block falseBlock = this.find(tcj.getLabelFalse(), workingBlocks);
				Block trueBlock = this.find(tcj.getLabelTrue(), workingBlocks);
				if(falseBlock != null){
					this.findAndRemove(tcj.getLabelFalse(), workingBlocks);
					orderedBlocks.add(falseBlock);
				}
				else if(falseBlock == null && trueBlock != null){
					//negate CJump and switch Labels
					TreeStmCJump newTcj = new TreeStmCJump(tcj.getRel().neg(), tcj.getLeft(), tcj.getRight(), tcj.getLabelFalse(), tcj.getLabelTrue());
					//delete old CJump and add new
					orderedBlocks.get(orderedBlocks.size()-1).removeLast();
					orderedBlocks.get(orderedBlocks.size()-1).stmList.add(newTcj);
					this.findAndRemove(tcj.getLabelTrue(), workingBlocks);
					orderedBlocks.add(trueBlock);
					
				}
				else if(falseBlock == null && trueBlock == null){
					//change falseLabel
					Label dummyJumpLabel = new Label();
					TreeStmCJump newTcj = new TreeStmCJump(tcj.getRel().neg(), tcj.getLeft(), tcj.getRight(), tcj.getLabelTrue(), dummyJumpLabel);
					orderedBlocks.get(orderedBlocks.size()-1).removeLast();
					orderedBlocks.get(orderedBlocks.size()-1).stmList.add(newTcj);
					
					//create new Block with dummyJump
					List<TreeStm> dummyList = new LinkedList<>();
					TreeStmLabel dummyLabelStm = new TreeStmLabel(dummyJumpLabel);
					List<Label> possibleTargets = new LinkedList<>();
					possibleTargets.add(dummyJumpLabel);
					TreeStmJump dummyJumpStm = new TreeStmJump(new TreeExpName(dummyJumpLabel), possibleTargets);
					dummyList.add(dummyLabelStm);
					dummyList.add(dummyJumpStm);
					
					//add Block
					Block dummyBlock = new Block(dummyList);
					orderedBlocks.add(dummyBlock);
				}
			}
			this.blockList = orderedBlocks;
		}
	}
	
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

	public Block find(Label l, List<Block> blockList){
		for (int i=0; i< blockList.size(); i++){
			Block b = blockList.get(i);
			TreeStmLabel tl = (TreeStmLabel) b.getFirst();
			if (tl.getLabel().equals(l)){
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
