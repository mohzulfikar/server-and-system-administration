#!/bin/bash

# Name: Mohammad Zulfikar
# Class: Adser TIF A
# BASH SCRIPTING ASSIGNMENT (CREATING DIRECTORY)

if [ $# -eq 0 ] # if no argument given
then
	echo "usage: ./script.sh arg1"
	exit 1	# exit program with error status
fi

if [ "$1" -le 0  ] # if an argument <= 0 then invaling
then
	echo "arg1 must be greater than 0!"
	echo "exiting..."
	exit 1
else
	for (( i=1; i<=$1; i++ )) # for loop 1 to arg1
	do
		mkdir -p $i # create directory, force if it already exist (-p flag)
	done
	echo "successfully created, $1 dir(s)"
fi
