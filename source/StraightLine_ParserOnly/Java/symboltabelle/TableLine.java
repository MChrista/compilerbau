package symboltabelle;

public class TableLine {
	private String name;
	private String type;
	private String value;
	
	public TableLine(String name, String type, String value){
		this.name = name;
		this.type = type;
		this.value = value;
	}
	
	public String getName(){
		return this.name;
	}
	
	public String getType(){
		return this.type;
	}
	
	public String print(){
		return this.name + " " + this.type + " " + this.value;
	}
}
