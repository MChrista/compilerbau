package minijava;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
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

        GlobalTable gt = new GlobalTable(parseTree);
        System.out.println(gt.printTable());

        System.out.println(PrettyPrint.prettyPrint(parseTree));
        System.out.println("Parsing der Eingabe erfolgreich.");
        gt.checkSemantic(parseTree);
      } finally {
        inp.close();
      }
    } catch (ParseException ex) {
      System.out.println("Parse error!\n" + ex.getMessage());
    } catch (Exception ex) {
    }

  }
}
