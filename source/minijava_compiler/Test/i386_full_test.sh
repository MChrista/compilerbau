#!/bin/bash

TEST_DIR_LARGE="../../MiniJava_Examples/Large/"
TEST_DIR_SMALL="../../MiniJava_Examples/Small/"
TEST_DIR_INHERITANCE="../../MiniJava_Examples/Inheritance/"
TEST_DIR_FAIL="../../MiniJava_Examples/ShouldFail/"
OUTPUT_FOLDER="../Test/"

cd ../Java
echo "" > ${OUTPUT_FOLDER}testresults
echo "" > ${OUTPUT_FOLDER}output
echo "" > ${OUTPUT_FOLDER}javaOutput
echo "" > ${OUTPUT_FOLDER}cOutput
mkdir -p ${OUTPUT_FOLDER}classFiles
rm ${OUTPUT_FOLDER}classFiles/*

# Iterate over successful Tests

TEST_COUNT=0
SUC_TEST_COUNT=0

echo "######### TESTS SMALL##########"
echo $(ls $TEST_DIR_SMALL);
echo "##########################"

for filename in $(ls $TEST_DIR_SMALL); do
	echo $filename
	java -cp .:../../../libs/java-cup-v11a.jar minijava.Test $TEST_DIR_SMALL$filename > ${OUTPUT_FOLDER}output.s
	gcc -m32 -o ${OUTPUT_FOLDER}runme ${OUTPUT_FOLDER}output.s ../../tree2c/runtime.c
	${OUTPUT_FOLDER}runme > ${OUTPUT_FOLDER}cOutput
	javac -d ${OUTPUT_FOLDER}classFiles $TEST_DIR_SMALL$filename
	FILE=$filename
	java -cp "${OUTPUT_FOLDER}classFiles/" "${FILE%.*}" > ${OUTPUT_FOLDER}javaOutput
	diff -y --suppress-common-lines ${OUTPUT_FOLDER}cOutput ${OUTPUT_FOLDER}javaOutput
done

echo "######### TESTS LARGE ##########"
echo $(ls $TEST_DIR_LARGE);
echo "##########################"

for filename in $(ls $TEST_DIR_LARGE); do
        echo $filename
        java -cp .:../../../libs/java-cup-v11a.jar minijava.Test $TEST_DIR_LARGE$filename > ${OUTPUT_FOLDER}output.s
        gcc -m32 -o ${OUTPUT_FOLDER}runme ${OUTPUT_FOLDER}output.s ../../tree2c/runtime.c
        ${OUTPUT_FOLDER}runme > ${OUTPUT_FOLDER}cOutput
        javac -d ${OUTPUT_FOLDER}classFiles $TEST_DIR_LARGE$filename
        FILE=$filename
        java -cp "${OUTPUT_FOLDER}classFiles/" "${FILE%.*}" > ${OUTPUT_FOLDER}javaOutput
        diff -y --suppress-common-lines ${OUTPUT_FOLDER}cOutput ${OUTPUT_FOLDER}javaOutput
done

