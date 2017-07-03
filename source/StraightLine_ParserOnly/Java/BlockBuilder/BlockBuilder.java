package BlockBuilder;

import java.util.LinkedList;
import java.util.List;

import BlockBuilder.Block;
import minijava.intermediate.*;
import minijava.intermediate.tree.*;

public class BlockBuilder {

	public TreePrg treePrg;
	
	public List<Block> blockList;

	public BlockBuilder(TreePrg treePrg) {
		this.treePrg = treePrg;
	}
	

	public List<Block> buildBlocks() {

		blockList = new LinkedList<>();

		while (this.treePrg.iterator().hasNext()) {
			TreeMethod m = this.treePrg.iterator().next();
			blockList.addAll(methodToBlocks(m));
		}
		return blockList;
	}


	public List<Block> methodToBlocks(TreeMethod m) {
		List<Block> bList = new LinkedList<>();
		// ToDo Method to List of Blocks
		// first stm with Startlabel
		// last stm with EndLabel
		List<TreeStmLabel> knownLabels = new LinkedList<>();
		List<TreeStm> stmList = new LinkedList<TreeStm>();
		Block runningBlock = new Block(stmList);
		boolean blockOpen = true;
		boolean isFirst = true;

		while (m.iterator().hasNext()) {
			TreeStm ts = m.iterator().next();
			if(isFirst){
				if(!(ts instanceof TreeStmLabel)){
					runningBlock = new Block(new TreeStmLabel(new Label("start")));
					blockOpen = true;
				}
				isFirst = false;
			}
			if (ts instanceof TreeStmCJump) {
				knownLabels.add(new TreeStmLabel(((TreeStmCJump) ts)
						.getLabelTrue()));
				knownLabels.add(new TreeStmLabel(((TreeStmCJump) ts)
						.getLabelFalse()));
				runningBlock.addStmToBlock(ts, blockOpen);
				blockOpen = false;

			} else if (ts instanceof TreeStmJump) {
				TreeStmJump tsj = (TreeStmJump) ts;

				for (Label l : tsj.getPossibleTargets()) {
					knownLabels.add(new TreeStmLabel(l));
				}
				runningBlock.addStmToBlock(ts, blockOpen);
				blockOpen = false;
			} else if (ts instanceof TreeStmLabel) {
				if(blockOpen){
					TreeStmJump newJump = new TreeStmJump(((TreeStmLabel) ts).getLabel());
					runningBlock.addStmToBlock(newJump, blockOpen);
				}
				runningBlock = new Block(ts);
				blockOpen = true;
			}else{
				runningBlock.addStmToBlock(ts, blockOpen);
			}
		}
		if(!blockOpen){
			Label endLabel = new Label("end");
			List <Label> dstList = new LinkedList<>();
			dstList.add(endLabel);
			TreeStmJump endJump = new TreeStmJump(new TreeExpName(endLabel), dstList);
			runningBlock.addStmToBlock(endJump, blockOpen);
			blockOpen = false;
		}
		return bList;
	}
	
	public String toString(){
		StringBuffer buffer = new StringBuffer();
		for(Block b : blockList){
			buffer.append(b.toString());
		}
		return buffer.toString();
	}
	

}
