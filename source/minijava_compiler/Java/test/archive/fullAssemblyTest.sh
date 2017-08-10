#!/bin/bash

TEST_DIR_LARGE="../../MiniJava_Examples/Large/"
TEST_DIR_SMALL="../../MiniJava_Examples/Small/"
TEST_DIR_INHERITANCE="../../MiniJava_Examples/Inheritance/"
TEST_DIR_FAIL="../../MiniJava_Examples/ShouldFail/"

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

echo "######### TESTS SMALL##########"
$(ls $TEST_DIR_SMALL)
echo "##########################"

for filename in $(ls $TEST_DIR_SMALL); do
	echo $filename
	java -cp .:../../../java-cup-v11a.jar minijava.Test $TEST_DIR_SMALL$filename > test/output
	../../risc386/risc386 test/output 2>/dev/null 1> test/cOutput
	javac -d test/classFiles $TEST_DIR_SMALL$filename
	FILE=$filename
	java -cp "test/classFiles/" "${FILE%.*}" > test/javaOutput
	diff -y --suppress-common-lines test/cOutput test/javaOutput
done

echo "######### TESTS LARGE##########"
$(ls $TEST_DIR)
echo "##########################"

for filename in $(ls $TEST_DIR_LARGE); do
	echo $filename
	java -cp .:../../../java-cup-v11a.jar minijava.Test $TEST_DIR_LARGE$filename > test/output
	../../risc386/risc386 test/output 2>/dev/null 1> test/cOutput
	javac -d test/classFiles $TEST_DIR_LARGE$filename
	FILE=$filename
	java -cp "test/classFiles/" "${FILE%.*}" > test/javaOutput
	diff -y --suppress-common-lines test/cOutput test/javaOutput
done


echo "######### TESTS INHERITANCE##########"
$(ls $TEST_DIR_INHERITANCE)
echo "##########################"

for filename in $(ls $TEST_DIR_INHERITANCE); do
	echo $filename
	java -cp .:../../../java-cup-v11a.jar minijava.Test $TEST_DIR_INHERITANCE$filename > test/output
	../../risc386/risc386 test/output 2>/dev/null 1> test/cOutput
	javac -d test/classFiles $TEST_DIR_INHERITANCE$filename
	FILE=$filename
	java -cp "test/classFiles/" "${FILE%.*}" > test/javaOutput
	diff -y --suppress-common-lines test/cOutput test/javaOutput
done

echo "######### TESTS SHOULD FAIL##########"
$(ls $TEST_DIR_FAIL)
echo "##########################"

for filename in $(ls $TEST_DIR_FAIL); do
	echo $filename
	java -cp .:../../../java-cup-v11a.jar minijava.Test $TEST_DIR_FAIL$filename > test/output
	../../risc386/risc386 test/output 2>/dev/null 1> test/cOutput
	javac -d test/classFiles $TEST_DIR_FAIL$filename
	FILE=$filename
	java -cp "test/classFiles/" "${FILE%.*}" > test/javaOutput
	diff -y --suppress-common-lines test/cOutput test/javaOutput
done

# Iterate over failing tests
cd test
