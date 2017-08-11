package minijava.blockBuilder;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import minijava.blockBuilder.Block;
import minijava.intermediate.*;
import minijava.intermediate.tree.*;

public class BlockBuilder {

	private TreePrg treePrg;
	
	private List<MethodBlocks> methodBlockList;

	
	public BlockBuilder(TreePrg treePrg) {
		this.treePrg = treePrg;
	}
	
	
	public List<MethodBlocks> buildBlocks() {

		methodBlockList = new LinkedList<>();
		Iterator<TreeMethod> it = this.treePrg.iterator();
		
		while (it.hasNext()) {
			TreeMethod m = it.next();
			MethodBlocks bl = new MethodBlocks(m, new LinkedList<Block>());
			List<Block> b = methodToBlocks(m, bl);
			bl.setBlockList(b);
			methodBlockList.add(bl);
		}
		return methodBlockList;
	}
	
	
	public TreePrg getPrg(){
		TreePrg prg;
		List<TreeMethod> treeMethods = new LinkedList<>();
		List<TreeStm> stmList = new LinkedList<>();
		for(MethodBlocks mb : methodBlockList){
			stmList = new LinkedList<>();
			mb.sort();
			for(Block b : mb.getBlockList()){
				stmList.addAll(b.getStmList());
			}
			if(mb.getHasEndJump() == true){
				stmList.add(new TreeStmLabel(mb.hasEndLabel()));
			}
			
			TreeMethod tm = new TreeMethod(mb.getTreeMethod().getName(), mb.getTreeMethod().getNumberOfParameters(), stmList, mb.getTreeMethod().getReturnTemp());
			tm.setNumberOfVars(mb.getTreeMethod().getNumberOfVars());
			treeMethods.add(tm);
		}
		prg = new TreePrg(treeMethods);
		return prg;
	}
	

	public List<Block> methodToBlocks(TreeMethod m, MethodBlocks mb) {
		List<Block> bList = new LinkedList<>();
		List<TreeStmLabel> knownLabels = new LinkedList<>();
		Block runningBlock = new Block(new LinkedList<TreeStm>());
		boolean blockOpen = true;
		boolean isFirst = true;
		
		Iterator<TreeStm> it = m.iterator();
		while (it.hasNext()) {
			TreeStm ts = it.next();
			if(isFirst){
				if(!(ts instanceof TreeStmLabel)){
					runningBlock = new Block(new TreeStmLabel(new Label()));
					blockOpen = true;
				}
				isFirst = false;
			} else {
				isFirst = false;
			}
			if (ts instanceof TreeStmCJump) {
				knownLabels.add(new TreeStmLabel(((TreeStmCJump) ts)
						.getLabelTrue()));
				knownLabels.add(new TreeStmLabel(((TreeStmCJump) ts)
						.getLabelFalse()));
				runningBlock.addStmToBlock(ts, blockOpen);
				bList.add(runningBlock);
				blockOpen = false;
			} 
			else if (ts instanceof TreeStmJump) {
				TreeStmJump tsj = (TreeStmJump) ts;
				for (Label l : tsj.getPossibleTargets()) {
					knownLabels.add(new TreeStmLabel(l));
				}
				runningBlock.addStmToBlock(ts, blockOpen);
				bList.add(runningBlock);
				blockOpen = false;
			} 
			else if (ts instanceof TreeStmLabel) {
				if(blockOpen){
					TreeStmJump newJump = new TreeStmJump(((TreeStmLabel) ts).getLabel());
					runningBlock.addStmToBlock(newJump, blockOpen);
					bList.add(runningBlock);
				}
				runningBlock = new Block(ts);
				blockOpen = true;
			}
			else{
				runningBlock.addStmToBlock(ts, blockOpen);
			}
		}
		if(blockOpen){			
			createAndAddEndJump(blockOpen, runningBlock, mb, bList);
			blockOpen = false;
		}
		return bList;
	}
	
	
	public void createAndAddEndJump(boolean blockOpen, Block runningBlock, MethodBlocks mb, List<Block> bList){
		Label endLabel = new Label();
		List <Label> dstList = new LinkedList<>();
		dstList.add(endLabel);
		TreeStmJump endJump = new TreeStmJump(new TreeExpName(endLabel), dstList);
		runningBlock.addStmToBlock(endJump, blockOpen);
		mb.setHasEndJump(true);
		mb.setEndLabel(endLabel);
		bList.add(runningBlock);
	}

	
	public String toString(){
		StringBuffer sb = new StringBuffer();
		for (MethodBlocks mb : methodBlockList){
			sb.append(mb.toString());
		}
		return sb.toString();
	}
	

}
