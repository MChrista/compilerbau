#!/bin/bash

SOURCE_TEST_FILE="../../MiniJava_Examples/Small/Factorial.java"

cd ..
echo ""> test/output

java -cp .:../../../java-cup-v11a.jar minijava.Test $SOURCE_TEST_FILE >> test/output

../../risc386/risc386 test/output 2>/dev/null
