#!/bin/bash

SUCCESSFUL_TEST_DIR="../../MiniJava_Examples/Successful/"
FAILING_TEST_DIR="../../MiniJava_Examples/Fail/"
cd ..
echo "" > test/testresults
echo "" > test/output

# Iterate over successful Tests

TEST_COUNT=0
SUC_TEST_COUNT=0

for filename in $(ls $SUCCESSFUL_TEST_DIR); do
	java -cp .:../../../java-cup-v11a.jar minijava.Test $SUCCESSFUL_TEST_DIR$filename >> test/output
	RETURNCODE="${?}"
	echo "$filename;$RETURNCODE" >> test/testresults
	
	TEST_COUNT=$(($TEST_COUNT+1))
	
	if [ $RETURNCODE = "0" ]; then
		SUC_TEST_COUNT=$(($SUC_TEST_COUNT+1))
	fi
done

# Iterate over failing tests

for filename in $(ls $FAILING_TEST_DIR); do
        java -cp .:../../../java-cup-v11a.jar minijava.Test $FAILING_TEST_DIR$filename >> test/output
        RETURNCODE="${?}"
        echo "$filename;$RETURNCODE" >> test/testresults

        TEST_COUNT=$(($TEST_COUNT+1))

        if [ $RETURNCODE != "0" ]; then
                SUC_TEST_COUNT=$(($SUC_TEST_COUNT+1))
        fi
done

echo "Result: ($SUC_TEST_COUNT/$TEST_COUNT) went successful"

