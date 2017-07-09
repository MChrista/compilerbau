package minijava;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.LinkedList;
import java.util.List;
import minijava.backend.i386.*;

import BlockBuilder.Block;
import BlockBuilder.BlockBuilder;
import BlockBuilder.MethodBlocks;
import Translate.Translator;
import minijava.intermediate.canon.Canonizer;
import minijava.intermediate.tree.TreePrg;
import minijava.syntax.PrettyPrint;
import symboltabelle.GlobalTable;


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

    Lexer lex = new Lexer(inp);
    Parser parser = new Parser(lex);

    minijava.syntax.Prg parseTree;
    try {
      try {
        parseTree = (minijava.syntax.Prg) parser.parse().value;

        //System.out.println("create global table");
        GlobalTable gt = new GlobalTable(parseTree);
        //System.out.println("Symboltable");
        //System.out.println(gt.printTable());

        //System.out.println(PrettyPrint.prettyPrint(parseTree));
        //System.out.println("Parsing der Eingabe erfolgreich.");

        //System.out.println("Start type check");
        TypeChecker.checkType(parseTree, gt);
        
        //System.out.println("Start translating");
        TreePrg treeprg = Translator.translate(parseTree, gt);
        //System.out.println(treeprg.toString());
        
        
        Canonizer can = new Canonizer();
        TreePrg canonizedPrg = can.canonPrg(treeprg);
        //System.out.println("Canonizing Programm \n");
        //System.out.println(canonizedPrg.toString());
        
        //System.out.println("Building Blocks");
        BlockBuilder blockB = new BlockBuilder(canonizedPrg);
        
        List<MethodBlocks> unorderedBlocks = blockB.buildBlocks();
        TreePrg orderdTreePrg = blockB.getPrg();
        //System.out.println("Building blocks completed");
        //System.out.println(unorderedBlocks.size());
        //System.out.println(orderdTreePrg.toString());
        
        I386CodeGenerator cg = new I386CodeGenerator();
        I386Prg assemPrg = cg.codeGen(orderdTreePrg);
        System.out.println(assemPrg.renderAssembly());
        

      } finally {
        inp.close();
      }
    } catch (ParseException ex) {
      System.out.println("Parse error!\n" + ex.getMessage());
    } catch (Exception ex) {
    }

  }
}
