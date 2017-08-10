#!/bin/bash

SOURCE_TEST_FILE="../../MiniJava_Examples/Large/GameOfLife.java"
date
cd ..
echo ""> test/ass_file.s

java -cp .:../../../java-cup-v11a.jar minijava.Test $SOURCE_TEST_FILE >> test/ass_file.s

date
#gcc -m32 -o runme test/ass_file.s ../../tree2c/runtime.c
#./runme
