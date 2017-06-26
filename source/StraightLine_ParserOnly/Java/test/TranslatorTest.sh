#!/bin/bash

SOURCE_TEST_FILE="../../MiniJava_Examples/Large/LinkedList.java"

cd ..
echo ""> test/output

java -cp .:../../../java-cup-v11a.jar minijava.Test $SOURCE_TEST_FILE >> test/output


../../tree2c/tree2c test/output > test/programm.c
gcc -m32 test/programm.c ../../tree2c/runtime.c -o test/programm
test/programm 
