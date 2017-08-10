package minijava.backend.i386;

import minijava.intermediate.Temp;

import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.function.Function;

public abstract class Operand {

	public final static class Imm extends Operand {

		final int imm;

		Imm(Integer imm) {
			assert (imm != null);
			this.imm = imm;
		}

		@Override
		public String toString() {
			return "" + imm;
		}

		@Override
		public Operand rename(Function<Temp, Temp> sigma) {
			return this;
		}
	}

	public final static class Reg extends Operand {

		public final Temp reg;

		Reg(Temp reg) {
			assert (reg != null);
			this.reg = reg;
		}

		@Override
		public String toString() {
			return reg.toString();
		}

		@Override
		List<Temp> use() {
			List<Temp> temps = new LinkedList<Temp>();
			temps.add(reg);
			temps.remove(I386CodeGenerator.ebp.reg);
			temps.remove(I386CodeGenerator.esp.reg);
			return temps;
		}

		@Override
		public Operand rename(Function<Temp, Temp> sigma) {
			return new Reg(sigma.apply(reg));
		}
	}

	final static class Mem extends Operand {

		final Temp base; // maybe null
		final Integer scale; // null or 1, 2, 4 or 8;
		final Temp index; // maybe null
		final int displacement;

		Mem(Temp base, Integer scale, Temp index, int displacement) {
			assert (scale == null || (scale == 1 || scale == 2 || scale == 4 || scale == 8));
			this.base = base;
			this.scale = scale;
			this.index = index;
			this.displacement = displacement;
		}

		Mem(Temp base) {
			this(base, null, null, 0);
		}

		@Override
		public String toString() {
			boolean b1, b2, b3;
			String s1, s2, s3;
			b1 = (base != null);
			s1 = b1 ? base.toString() : "";
			b2 = ((index != null) && (scale != null));
			s2 = b2 ? (index.toString() + ((scale > 1) ? "*" + scale : "")) : "";
			b3 = (displacement != 0);
			s3 = b3 ? Integer.toString(displacement) : "";
			return "DWORD PTR [" + s1 + (b1 && b2 ? "+" : "") + s2 + ((b1 || b2) && b3 && displacement > 0 ? "+" : "")
					+ s3 + "]";
		}

		@Override
		List<Temp> use() {
			List<Temp> use = new ArrayList<>(2);
			if (base != null) {
				use.add(base);
			}
			if (index != null) {
				use.add(index);
			}
			use.remove(I386CodeGenerator.ebp.reg);
			use.remove(I386CodeGenerator.esp.reg);
			return use;
		}

		@Override
		public Operand rename(Function<Temp, Temp> sigma) {
			return new Mem(base != null ? sigma.apply(base) : null, scale, index != null ? sigma.apply(index) : null,
					displacement);
		}
	}

	List<Temp> use() {
		return new ArrayList<>();
		// return Collections.emptyList();
	}

	abstract Operand rename(Function<Temp, Temp> sigma);
}
