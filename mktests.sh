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
    
    #counting triangle area using bash
    tst=$(bc <<< "scale=1;0.5*$X1*$X2")
    #counting trinagle area using an our library
    tstta=$( ./ta $X1 $X2 )
    echo -n "For basic=$X1 and height=$X2; countin using bash is $tst; counting using library is $tstta. Test is "
    if [ "$tst" == "$tstta" ]; then
        echo "passed."
    else
        echo "failed."
    fi
    #Generating source code for the test
    echo "================================END================================="
    echo 
done
