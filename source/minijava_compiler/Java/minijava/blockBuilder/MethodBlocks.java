package minijava.blockBuilder;

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
	
	private List<Block> blockList;
	private TreeMethod treeMethod;
	private boolean hasEndJump = false;
	private Label endLabel;
	
	
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
	
	
	public Label hasEndLabel(){
		return endLabel;
	}
	
	
	public void setEndLabel(Label l){
		this.endLabel = l;
	}
	
	
	public boolean getHasEndJump(){
		return this.hasEndJump;
	}
	
	
	public void setHasEndJump(boolean hasEndJump){
		this.hasEndJump = hasEndJump;
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
		boolean twoBlocksAdded = false;

		while (!workingBlocks.isEmpty()){
			if(twoBlocksAdded == false){
			orderedBlocks.add(workingBlocks.get(0));
			workingBlocks.remove(0);
			}
			TreeStm last = orderedBlocks.get(orderedBlocks.size()-1).getLast();
			if(last instanceof TreeStmJump){
				TreeStmJump tj = (TreeStmJump) last;
				Block handledBlock = this.findAndRemove(tj.getPossibleTargets().get(0), workingBlocks);
				if (handledBlock != null){
					orderedBlocks.get(orderedBlocks.size()-1).removeLast();
					orderedBlocks.add(handledBlock);
					twoBlocksAdded = true;
				}
				else{
					twoBlocksAdded = false;

				}
			}
			else if(last instanceof TreeStmCJump){
				TreeStmCJump tcj = (TreeStmCJump) last;
				Block falseBlock = this.find(tcj.getLabelFalse(), workingBlocks);
				Block trueBlock = this.find(tcj.getLabelTrue(), workingBlocks);
				if(falseBlock != null){
					this.findAndRemove(tcj.getLabelFalse(), workingBlocks);
					orderedBlocks.add(falseBlock);
					twoBlocksAdded = true;
				}
				else if(falseBlock == null && trueBlock != null){
					addNegatedCJumpAndDelOld(orderedBlocks, tcj, tcj.getLabelTrue());
					this.findAndRemove(tcj.getLabelTrue(), workingBlocks);
					orderedBlocks.add(trueBlock);
					twoBlocksAdded = true;
				}
				else if(falseBlock == null && trueBlock == null){
					Label dummyJumpLabel = addNegatedCJumpAndDelOld(orderedBlocks, tcj, new Label());
					handleDummyJump(dummyJumpLabel, orderedBlocks, twoBlocksAdded);
				}
			}
			this.blockList = orderedBlocks;
			
		}
	}
	
	
	public Label addNegatedCJumpAndDelOld(List<Block> orderedBlocks, TreeStmCJump tcj, Label trueLabel){
		TreeStmCJump newTcj = new TreeStmCJump(tcj.getRel().neg(), tcj.getLeft(), tcj.getRight(), tcj.getLabelTrue(), trueLabel);
		orderedBlocks.get(orderedBlocks.size()-1).removeLast();
		orderedBlocks.get(orderedBlocks.size()-1).getStmList().add(newTcj);
		return trueLabel;
	}
	
	
	public void handleDummyJump(Label dummyJumpLabel, List<Block> orderedBlocks, boolean twoBlocksAdded){
		List<TreeStm> dummyList = new LinkedList<>();
		TreeStmLabel dummyLabelStm = new TreeStmLabel(dummyJumpLabel);
		List<Label> possibleTargets = new LinkedList<>();
		possibleTargets.add(dummyJumpLabel);
		TreeStmJump dummyJumpStm = new TreeStmJump(new TreeExpName(dummyJumpLabel), possibleTargets);
		dummyList.add(dummyLabelStm);
		dummyList.add(dummyJumpStm);
		Block dummyBlock = new Block(dummyList);
		orderedBlocks.add(dummyBlock);
		twoBlocksAdded = false;
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
