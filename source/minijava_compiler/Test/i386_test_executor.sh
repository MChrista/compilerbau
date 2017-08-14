#!/bin/bash

SOURCE_TEST_FILE="../../MiniJava_Examples/Large/GameOfLife.java"
cd ../Java
echo ""> ../Test/ass_file.s

start=$(($(date +%s%N)/1000000))
java -cp .:../../../libs/java-cup-v11a.jar minijava.Test $SOURCE_TEST_FILE >> ../Test/ass_file.s
end=$(($(date +%s%N)/1000000))
echo $(($end-$start))


#gcc -m32 -o runme test/ass_file.s ../../tree2c/runtime.c
#./runme
