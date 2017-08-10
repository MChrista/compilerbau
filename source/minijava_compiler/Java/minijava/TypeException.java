package minijava;

public class TypeException extends Exception{
	TypeException(String msg) {
	    super(msg);
	    System.out.println(msg);
	    System.exit(2);
	  }
}
