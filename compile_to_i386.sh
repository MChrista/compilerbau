#!/bin/bash
CUR_DIR=$(pwd)

if [ -z "$1" ]
  then
    echo "First argument needs to be a valid minijava file"
    exit
fi

SOURCE_FILE=$CUR_DIR"/"$1

if [ -f $SOURCE_FILE ]
  then
    cd source/minijava_compiler/Java
    java -cp .:../../../libs/java-cup-v11a.jar minijava.Test $SOURCE_FILE
  else
    echo "file does not exist"
    exit
fi
