package minijava.backend.i386;

import minijava.backend.MachineInstruction;
import minijava.backend.i386.InstrBinary.Kind;
import minijava.backend.i386.Operand.Reg;
import minijava.backend.MachineFunction;
import minijava.intermediate.Label;
import minijava.intermediate.Temp;
import minijava.util.DirectedGraph;
import minijava.util.Pair;
import minijava.util.TempNode;

import java.util.*;
import java.util.function.Function;

final class I386Function implements MachineFunction {

	private final Label name;
	private List<MachineInstruction> body;
	private int numberOfLocalVariables = 0;

	I386Function(Label name, List<MachineInstruction> body) {
		this.name = name;
		this.body = body;
	}

	public Label getName() {
		return name;
	}

	@Override
	public Iterator<MachineInstruction> iterator() {
		return body.iterator();
	}

	@Override
	public void rename(Function<Temp, Temp> sigma) {
		boolean isFirstSub = true;
		for(MachineInstruction mi : body){
			//check for Call
			if(mi.isLabel() == null){
				mi.rename(sigma);
			}
			
		}
			
		List<MachineInstruction> newBody = new LinkedList<MachineInstruction>();
		for(MachineInstruction mi : body){
			if(mi.isMoveBetweenTemps() == null){
				if(isFirstSub == true & mi.toString().contains("SUB")){
					InstrBinary.Kind kind = Kind.SUB;
					int frameSize = this.numberOfLocalVariables * 4;
					Operand frameOp = new Operand.Imm(frameSize);
					Temp dstTemp = new Temp("esp");
					Operand dst = new Operand.Reg(dstTemp);
					newBody.add(new InstrBinary(kind, dst, frameOp));
					
					isFirstSub = false;
				}
				else{
					newBody.add(mi);
				}
			}
			else{
				if(mi.isMoveBetweenTemps().getFst().equals(mi.isMoveBetweenTemps().getSnd())){
					
				}
				else{
					newBody.add(mi);
				}
			}
		}
		this.body = newBody;
	}

	@Override
	public void spill(List<Temp> toSpill) {
		HashMap<Temp, Temp> mapTemp = new HashMap<>(); 
		HashMap<Temp, Operand.Mem> mapTempToMem = new HashMap<>();
		
		System.out.println("temps to spill");
		for (Temp t : toSpill){
			this.numberOfLocalVariables++;
			Operand.Mem spillMemAddress = new Operand.Mem(I386CodeGenerator.ebp.reg, null, null,
					-4 * this.numberOfLocalVariables);
			mapTempToMem.put(t, spillMemAddress);
			System.out.println(t);
		}
		
		Function<Temp,Temp> tempToReg = (Temp t)-> {
			if (mapTemp.containsKey(t)){
				t = mapTemp.get(t);
			}
			return t;
		};
		
		for (Temp t : toSpill){
			List<MachineInstruction> modifiedBody = new LinkedList<MachineInstruction>();
			for (MachineInstruction mi : body) {
				List<Temp> useList = (List<Temp>) mi.use();
				List<Temp> defList = (List<Temp>) mi.def();
				if (useList.contains(t) || defList.contains(t)) {
					mapTemp.put(t, new Temp());
					if (useList.contains(t)) {
						modifiedBody.add(new InstrBinary(InstrBinary.Kind.MOV, new Operand.Reg(mapTemp.get(t)), mapTempToMem.get(t)));
					}
					mi.rename(tempToReg);
					modifiedBody.add(mi);
					if (defList.contains(t)) {
						modifiedBody.add(new InstrBinary(InstrBinary.Kind.MOV, mapTempToMem.get(t), new Operand.Reg(mapTemp.get(t))));
					}
				} else {
					modifiedBody.add(mi);
				}
			}
			this.body = modifiedBody;
		}
		
	}
}
