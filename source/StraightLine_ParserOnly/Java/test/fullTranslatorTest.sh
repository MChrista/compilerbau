#!/bin/bash

TEST_DIR="../../MiniJava_Examples/Small/"

cd ..
echo "" > test/testresults
echo "" > test/output
echo "" > test/javaOutput
echo "" > test/cOutput
mkdir -p test/classFiles
rm test/classFiles/*

# Iterate over successful Tests

TEST_COUNT=0
SUC_TEST_COUNT=0

echo "######### TESTS ##########"
$(ls $TEST_DIR)
echo "##########################"

for filename in $(ls $TEST_DIR); do
	echo $filename
	java -cp .:../../../java-cup-v11a.jar minijava.Test $TEST_DIR$filename > test/output
	../../tree2c/tree2c test/output > test/programm.c
	gcc -m32 test/programm.c ../../tree2c/runtime.c -o test/programm
	test/programm > test/cOutput
	javac -d test/classFiles $TEST_DIR$filename
	FILE=$filename
	java -cp "test/classFiles/" "${FILE%.*}" > test/javaOutput
	diff -y --suppress-common-lines test/cOutput test/javaOutput
done

# Iterate over failing tests
cd test
