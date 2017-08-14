package minijava;

import java.io.FileWriter;
import java.io.IOException;

public class AssemblyFileWriter {
	public static void writeAssemblyFile(String path, String content){
	       String fn = path.substring(0, path.length() - 5) + ".s";
	       try{
	    	   FileWriter fw = new java.io.FileWriter(fn);
		       fw.write(content);
		       fw.close();  
		       System.out.println("Assembly file has been written to: " + fn);
	       }
	       catch(IOException ex){
	    	   ex.printStackTrace();
	       };
	       
	}
}
