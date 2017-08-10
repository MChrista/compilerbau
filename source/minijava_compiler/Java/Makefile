JFLEX = ../../../../libs/jflex/bin/jflex
JAVACUPJAR = ../../../../libs/java-cup-v11a.jar
JAVACUPJARX = ../../../libs/java-cup-v11a.jar
JAVACUP = java -jar $(JAVACUPJAR)

all: minijava/Parser.java minijava/Lexer.java 
	javac  -cp .:$(JAVACUPJARX) minijava/Test.java

minijava/Parser.java: minijava/Parser.cup
	cd minijava; $(JAVACUP) -symbols Parser_sym -parser Parser Parser.cup

minijava/Lexer.java: minijava/Lexer.jflex
	cd minijava; $(JFLEX) Lexer.jflex

clean:
	rm -f minijava/Parser_sym.java minijava/Parser.java minijava/Lexer.java minijava/Lexer.java~ minijava/*.class
