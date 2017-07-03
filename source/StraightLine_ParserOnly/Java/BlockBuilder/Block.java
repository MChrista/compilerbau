package BlockBuilder;

import java.util.LinkedList;
import java.util.List;

import minijava.intermediate.tree.TreeStm;
import minijava.intermediate.tree.TreeStmLabel;

public class Block {
	public List<TreeStm> stmList = new LinkedList<>();
	
	public Block(List<TreeStm> stmConstrList){
		this.stmList = stmConstrList;
	}
	
	public Block(TreeStm start){
		
		stmList.add(start);
	}
	
	public void addStmToBlock(TreeStm stm, boolean isOpen){
		if(isOpen){
			stmList.add(stm);
		}else{
			System.err.println("Dead Code found");
		}
	}
	
	public String toString(){
		StringBuffer buffer = new StringBuffer();
		
		for(TreeStm stm : stmList){
			buffer.append(stm.toString());
		}
		return buffer.toString();
	}

}
