package minijava.blockBuilder;

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
	
	public TreeStm getFirst(){
		return stmList.get(0);
	}
	
	public TreeStm getLast(){
		return stmList.get(stmList.size()-1);
	}
	
	public boolean removeLast(){
		if (stmList.size() >= 1){
			stmList.remove(stmList.size()-1);
			return true;
		}
		return false;
	}
	
	public String toString(){
		StringBuffer buffer = new StringBuffer();
		
		for(TreeStm stm : stmList){
			buffer.append("  ");
			buffer.append(stm.toString() + "\n");
		}
		return buffer.toString();
	}

}
