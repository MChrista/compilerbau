package minijava;

import java.io.FileInputStream;
import java.io.FileNotFoundException;

import Translate.Translator;
import minijava.intermediate.tree.TreePrg;
import minijava.syntax.PrettyPrint;
import symboltabelle.GlobalTable;

public class Test {

  public static void main(String[] args) {

    if (args.length == 0) {
      System.out.println("First argument must be file name of straigtline program.");
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
        System.out.println(treeprg.toString());

      } finally {
        inp.close();
      }
    } catch (ParseException ex) {
      System.out.println("Parse error!\n" + ex.getMessage());
    } catch (Exception ex) {
    }

  }
}
