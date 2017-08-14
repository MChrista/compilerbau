package minijava;

public class ParseException extends Exception {

  ParseException(String msg) {
    super(msg);
    System.out.println(msg);
    System.exit(1);
  }
}
