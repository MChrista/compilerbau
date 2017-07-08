package BlockBuilder;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import BlockBuilder.Block;
import minijava.intermediate.*;
import minijava.intermediate.tree.*;

public class BlockBuilder {

	public TreePrg treePrg;
	
	public List<MethodBlocks> methodBlockList;

	public BlockBuilder(TreePrg treePrg) {
		this.treePrg = treePrg;
	}
	

	public List<MethodBlocks> buildBlocks() {

		methodBlockList = new LinkedList<>();
		Iterator<TreeMethod> it = this.treePrg.iterator();
		
		while (it.hasNext()) {
			
			TreeMethod m = it.next();
			List<Block> b = methodToBlocks(m);
			
			MethodBlocks bl = new MethodBlocks(m, b);
			methodBlockList.add(bl);
		}
		return methodBlockList;
	}
	
	public TreePrg getPrg(){
		TreePrg prg;
		List<TreeMethod> treeMethods = new LinkedList<>();
		List<TreeStm> stmList = new LinkedList<>();
		for(MethodBlocks mb : methodBlockList){
			//mb.sort();
			stmList = new LinkedList<>();
			for(Block b : mb.blockList){
				stmList.addAll(b.stmList);
			}
			//endlabel adden falls flag gesetzt
			TreeMethod tm = new TreeMethod(mb.treeMethod.getName(), mb.treeMethod.getNumberOfParameters(), stmList, mb.treeMethod.getReturnTemp());
			tm.setNumberOfVars(mb.treeMethod.getNumberOfVars());
			treeMethods.add(tm);
		}
		prg = new TreePrg(treeMethods);
		return prg;
	}
	



	public List<Block> methodToBlocks(TreeMethod m) {
		List<Block> bList = new LinkedList<>();

		List<TreeStmLabel> knownLabels = new LinkedList<>();
		List<TreeStm> stmList = new LinkedList<TreeStm>();
		Block runningBlock = new Block(stmList);
		
		boolean blockOpen = true;
		boolean isFirst = true;
		
		Iterator<TreeStm> it = m.iterator();
		while (it.hasNext()) {
			TreeStm ts = it.next();
			if(isFirst){
				if(!(ts instanceof TreeStmLabel)){
					runningBlock = new Block(new TreeStmLabel(new Label("start")));
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

			} else if (ts instanceof TreeStmJump) {
				TreeStmJump tsj = (TreeStmJump) ts;

				for (Label l : tsj.getPossibleTargets()) {
					knownLabels.add(new TreeStmLabel(l));
				}
				runningBlock.addStmToBlock(ts, blockOpen);
				bList.add(runningBlock);
				blockOpen = false;
			} else if (ts instanceof TreeStmLabel) {
				if(blockOpen){
					TreeStmJump newJump = new TreeStmJump(((TreeStmLabel) ts).getLabel());
					runningBlock.addStmToBlock(newJump, blockOpen);
					bList.add(runningBlock);
				}
				runningBlock = new Block(ts);
				blockOpen = true;
			}else{
				runningBlock.addStmToBlock(ts, blockOpen);
			}
			
		}
		if(blockOpen){
			Label endLabel = new Label("end");
			List <Label> dstList = new LinkedList<>();
			dstList.add(endLabel);
			TreeStmJump endJump = new TreeStmJump(new TreeExpName(endLabel), dstList);
			runningBlock.addStmToBlock(endJump, blockOpen);
			runningBlock.addStmToBlock(new TreeStmLabel(endLabel), blockOpen);
			//add flag
			bList.add(runningBlock);
			blockOpen = false;
		}
		return bList;
	}
	

	
	public String toString(){
		StringBuffer sb = new StringBuffer();
		for (MethodBlocks mb : methodBlockList){
			sb.append(mb.toString());
		}
		return sb.toString();
	}
	

}
