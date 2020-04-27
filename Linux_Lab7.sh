#!/bin/bash
#Neil Kingdom
#040967309
#CST 8102
#Section 300
#This script calculates a student's final grade based on the inputs given for each grading criteria
while [ true ]
do
	echo -n "Enter Assignment mark (0-40): "; read assign
	if [ $assign -lt 0 ] || [ $assign -gt 40 ]
       	then 
	       	echo "Number out of range" 
	else
	       	break
	fi
done

while [ true ]
do
	echo -n "Enter test 1 mark (0-15): "; read test1
	if [ $test1 -lt 0 ] || [ $test1 -gt 15 ]
	then
		echo "Number out of range"
	else
		break
	fi
done

while [ true ]
do
	echo -n "Enter test 2 mark (0-15): "; read test2
	if [ $test2 -lt 0 ] || [ $test2 -gt 15 ]
	then
		echo "Number out of range"
	else 
		break
	fi
done

while [ true ]
do
	echo -n "Enter final exam mark (0-30): "; read final
	if [ $final -lt 0 ] || [ $final -gt 30 ]
	then
		echo "Number out of range"
	else
		break
	fi
done

grade=$(($assign+$test1+$test2+$final))
#Declare an associative array that maps key values to integer values
declare -A letterMatrix=([F]=49 [D-]=52 [D]=56 [D+]=59 [C-]=62 [C]=66 [C+]=69 [B-]=72 [B]=76 [B+]=79 [A-]=84 [A]=89 [A+]=100)
#For each key-value pair in the letterMatrix array, check if the associated value is less than or equal to the calculated grade value
for i in F D- D D+ C- C C+ B- B B+ A- A A+ fin; do
	if [ $grade -le ${letterMatrix[$i]} ] 
	then
		echo "Number grade is $grade, and letter grade is $i"
		break
	fi
done
