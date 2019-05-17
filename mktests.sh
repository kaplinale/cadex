#!/bin/bash
#generating 10th tests for an our library and execute it

function rnd()
{
    local  res=$(( ( RANDOM % 10 )  ))
    echo "$res"
}

for i in {1..10} ; do
    echo "================================START==============================="
    #Getting random values
    X1=$(rnd)
    X2=$(rnd)
    X3=$(rnd)
    
    Y1=$(rnd)
    Y2=$(rnd)
    Y3=$(rnd)
    
    #Generating source code for the test
    echo -n "Generating test$i.c... "
    cat > tests/test$i.c << EOF
#include <stdio.h>
#include <math.h>
#include "triangle_area.h"

int main()
{
    int x1=$X1;
    int x2=$X2;
    int x3=$X3;
    
    int y1=$Y1;
    int y2=$Y2;
    int y3=$Y3;
    
    if(x1 == 0 || x2 == 0 || x3 == 0 || y1 == 0 || y2 == 0 || y3 == 0)
        return 1;
    else
        return 0;
}
EOF
    echo "[ok]"
    #Generating makefile
    echo -n "Generating makefile and executable for test$i..."
    cat > Makefile.mt << EOF
CC = gcc
TARGET = tests/test$i
CFLAGS = -L./ -I./lib -Wall 
LDFLAGS = -lta -lm

all:
	@\$(CC) \$(CFLAGS) -o \$(TARGET) tests/test$i.c \$(LDFLAGS)
	
EOF
    echo "[ok]"
    make -f Makefile.mt
    echo "Execution time is:" 
    time -p ./tests/test$i
    tmp=$?
    echo -n "The result of test test$i is "
    if [ $tmp -eq "0" ]; then
        echo "PASSED"
    else
        echo "FAILED"
    fi
    echo "================================END================================="
    echo 
done
