package minijava.intermediate;

public final class Temp implements Comparable<Temp> {

  private static int nextId = 0;

  private final int id;
  private final String name;
  	
  /**
   * Generates a fresh temporary.
   */
  public Temp() {
    this.id = nextId++;
    name = null;
  }
  
  
  public Temp(String name){
	  this.id = nextId++;
	  this.name = name;
  }

  public static void resetCounter() {
    nextId = 0;
  }

  @Override
  public String toString() {
	  if (this.name == null){
		  return "t" + id;
	  } else {
		  return "%" + name;
	  }
    
  }

  @Override
  public boolean equals(Object obj) {
    return (obj instanceof Temp && ((Temp) obj).id == id);
  }

  @Override
  public int hashCode() {
    return id;
  }

  @Override
  public int compareTo(Temp o) {
    int oid = o.id;
    return (id < oid ? -1 : (id == oid ? 0 : 1));
  }
}
