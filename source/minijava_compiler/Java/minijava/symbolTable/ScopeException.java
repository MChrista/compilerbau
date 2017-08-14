package minijava.symbolTable;

public class ScopeException  extends Exception{
	ScopeException(String msg) {
	    super(msg);
	    System.out.println(msg);
	    System.exit(1);
	  }

}
