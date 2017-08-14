package minijava;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.List;
import minijava.backend.i386.*;
import minijava.backend.regDistributor.RegisterAllocator;
import minijava.blockBuilder.BlockBuilder;
import minijava.blockBuilder.MethodBlocks;
import minijava.intermediate.Translator;
import minijava.intermediate.canon.Canonizer;
import minijava.intermediate.tree.TreePrg;
import minijava.symbolTable.SymbolTable;
import minijava.AssemblyFileWriter;


public class Test {

  public static void main(String[] args) {

    if (args.length == 0) {
      System.out.println("First argument must be file name of straightline program.");
      System.exit(-1);
    }

    String filename = args[0];
    java.io.InputStream inp;

    try {
      inp = new FileInputStream(filename);
    } catch (FileNotFoundException e) {
      throw new Error("File not found: " + filename);
    }
    
    System.out.println("Start compiling: " + filename);
    
    Lexer lex = new Lexer(inp);
    Parser parser = new Parser(lex);

    minijava.syntax.Prg parseTree;
    try {
      try {
    	  
    	    parseTree = (minijava.syntax.Prg) parser.parse().value;

	        SymbolTable gt = new SymbolTable(parseTree);
	       
	        TypeChecker.checkType(parseTree, gt);
	        
	        TreePrg treeprg = Translator.translate(parseTree, gt);
	        
	        Canonizer can = new Canonizer();
	        TreePrg canonizedPrg = can.canonPrg(treeprg);
	        
	      
	        BlockBuilder blockB = new BlockBuilder(canonizedPrg);
	        
	        blockB.buildBlocks();
	        TreePrg orderdTreePrg = blockB.getPrg();
	 
	        I386CodeGenerator cg = new I386CodeGenerator();
	        I386Prg assemPrg = cg.codeGen(orderdTreePrg);
	        RegisterAllocator ra = new RegisterAllocator(assemPrg, cg);
	        assemPrg = (I386Prg) ra.allocateRegistersOfMachinePrg();
		       
	        AssemblyFileWriter.writeAssemblyFile(filename, assemPrg.renderAssembly());

      } finally {
        inp.close();
      }
    } catch (ParseException ex) {
      System.out.println("Parse error!\n" + ex.getMessage());
    } catch (Exception ex) {
    	ex.printStackTrace();
    }

  }
}
