#!/bin/bash

SOURCE_TEST_FILE="../../MiniJava_Examples/Small/Stck.java"

cd ..
echo ""> test/ass_file.s

java -cp .:../../../java-cup-v11a.jar minijava.Test $SOURCE_TEST_FILE >> test/ass_file.s

gcc -m32 -o runme test/ass_file.s ../../tree2c/runtime.c
./runme
