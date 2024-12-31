#!/bin/bash
# Lab 9
# Neil Kingdom
# 040967309
# mycalc.sh
# April 8, 2020
# This script utilizes functions and arithmetic expansion in order to solve simple equations

# All test conditions may throw unary operator exception. This is why stderr is sent to /dev/null
calculation() {
# Menu 1
	clear && echo -e "Menu 1\nC) calculation\nX) Exit"; read select
	while [ $select != C ] 2>/dev/null && [ $select != c ] || [ -z $select ]; do
		checkExit
		clear && echo -e "Menu 1\nC) calculation\nX) Exit\n\nPlease make a valid selection"
		read select
	done
# Menu 2
	clear && echo -e "Menu 2\nPlease enter an integer or X to exit"; read select
	int1=$select
	while ! [ $int1 -eq $int1 ] 2>/dev/null || [ -z $int1 ]; do
		checkExit
		clear && echo -e "Menu 2\nPlease enter an integer or X to exit\n\nYou may only use integer values"
		read int1
		select=$int1
	done
# Menu 3
	clear && echo -e "Menu 3\n+) Add\n-) Subtract\nX) Exit"; read operator
	while [ $operator != + ] 2>/dev/null && [ $operator != - ] || [ -z $operator ]; do
		checkExit
		clear && echo -e "Menu 3\n+) Add\n-) Subtract\nX) Exit\n\nYou must enter a valid selection"
		read operator
	done
# Menu 4
	clear && echo -e "Menu 2\nPlease enter an integer or X to exit"; read select
	int2=$select
	while ! [ $int2 -eq $int2 ] 2>/dev/null || [ -z $int2 ]; do
		checkExit
		clear && echo -e "Menu 2\nPlease enter an integer or X to exit\n\nYou may only use integer values"
		read int2
	       	select=$int2
	done
# Function call
	[ $operator == + ] && add $int1 $operator $int2
	[ $operator == - ] && subtract $int1 $operator $int2
	sleep 3 && calculation
}

add() {
	# If the input cannot be compared to its numerical value, it is not valid
	if ! [ $1 -eq $1 ] 2>/dev/null || ! [ $3 -eq $3 ] 2>/dev/null; then
	       echo "Sorry, but you may only add integers"
	else
		echo "Final addition of $1 + $3 = $(($1 + $3))"
	fi
}

subtract() {
	# If the input cannot be compared to its numerical value, it is not valid
	if ! [ $1 -eq $1 ] 2>/dev/null || ! [ $3 -eq $3 ] 2>/dev/null; then
	       echo "Sorry, but you may only subtract integers"
	else
		echo "Final subtraction of $1 - $3 = $(($1 - $3))"
	fi
}

# Check if user entered the exit option
checkExit() {
	[ $select == X ] && exit || [ $select == x ] && exit
	[ $operator == X ] && exit || [ $operator == x ] && exit
}

# If parameters are given, error check and handle accordingly
[ $# -eq 0 ] && calculation && exit
[ $# -gt 3 ] && echo "You have entered too many parameters" && exit
[ $2 == + ] 2>/dev/null && ! [ -z $3 ] && add $1 $2 $3 && exit
[ $2 == - ] 2>/dev/null && ! [ -z $3 ] &&  subtract $1 $2 $3 && exit
echo "You have not entered valid parameters"
