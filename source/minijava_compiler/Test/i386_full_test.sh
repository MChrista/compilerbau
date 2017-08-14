#!/bin/bash

TEST_DIR_LARGE="../../MiniJava_Examples/Large/"
TEST_DIR_SMALL="../../MiniJava_Examples/Small/"
TEST_DIR_INHERITANCE="../../MiniJava_Examples/Inheritance/"
TEST_DIR_FAIL="../../MiniJava_Examples/Fail/"
OUTPUT_FOLDER="../Test/"

cd ../Java
echo "" > ${OUTPUT_FOLDER}testresults
echo "" > ${OUTPUT_FOLDER}output
echo "" > ${OUTPUT_FOLDER}javaOutput
echo "" > ${OUTPUT_FOLDER}cOutput
mkdir -p ${OUTPUT_FOLDER}classFiles
rm ${OUTPUT_FOLDER}classFiles/*
rm ${TEST_DIR_LARGE}*.s
rm ${TEST_DIR_SMALL}*.s
rm ${TEST_DIR_FAIL}*.s

# Iterate over successful Tests

TEST_COUNT=0
SUC_TEST_COUNT=0

echo "######### TESTS SMALL##########"
echo $(ls $TEST_DIR_SMALL);
echo "##########################"

for filename in $(ls $TEST_DIR_SMALL); do
	echo $filename
	java -cp .:../../../libs/java-cup-v11a.jar minijava.Test $TEST_DIR_SMALL$filename
	ass_file=${TEST_DIR_SMALL}${filename%.java}.s
	gcc -m32 -o ${OUTPUT_FOLDER}runme ${ass_file} ../../tree2c/runtime.c
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
        java -cp .:../../../libs/java-cup-v11a.jar minijava.Test $TEST_DIR_LARGE$filename
	ass_file=${TEST_DIR_LARGE}${filename%.java}.s
        gcc -m32 -o ${OUTPUT_FOLDER}runme ${ass_file} ../../tree2c/runtime.c
        ${OUTPUT_FOLDER}runme > ${OUTPUT_FOLDER}cOutput
        javac -d ${OUTPUT_FOLDER}classFiles $TEST_DIR_LARGE$filename
        FILE=$filename
        java -cp "${OUTPUT_FOLDER}classFiles/" "${FILE%.*}" > ${OUTPUT_FOLDER}javaOutput
        diff -y --suppress-common-lines ${OUTPUT_FOLDER}cOutput ${OUTPUT_FOLDER}javaOutput
done

echo "######### TESTS INVALID FILES ##########"
echo $(ls $TEST_DIR_FAIL);
echo "##########################"

for filename in $(ls $TEST_DIR_FAIL); do
        java -cp .:../../../libs/java-cup-v11a.jar minijava.Test $TEST_DIR_FAIL$filename
        RETURNCODE="${?}"
        echo "$filename;$RETURNCODE" >> ../Test/testresults
	ass_file=${TEST_DIR_FAIL}${filename%.java}.s
	if [ ${RETURNCODE} == "0" ];
	then
		gcc -m32 -o ${OUTPUT_FOLDER}runme ${ass_file} ../../tree2c/runtime.c
        	${OUTPUT_FOLDER}runme
	fi
done

