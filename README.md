# MiniJava Compiler #

## Description ##
This compiler translates given minijava programs to IntelI386 assembly code.

## Execution ##
First, you need to compile our compiler. Therefore, you can either traverse to folder source/minijava_compiler/Java and execute make or you use script make.sh which is doing the job 
for you.
In second step, use script "compile_to_i386.sh" and give relative path to your minijava program as first parameter. Once compilation is completed and no error has occured, the 
program will output that assembly file has been written to disk. Afterwards, you can find the compiled assembly file in same folder as your source file. 

## Demo execution ##
Command below will compile the minijava program Stck.java to assembly code:

	./compile_to_i386.sh source/MiniJava_Examples/Small/Stck.java

After execution, the result file Stck.s will be located in source/MiniJava_Examples/Small/. 

## Authors ##
Michael Christa (LMU)

Daniel Haas (LMU)


