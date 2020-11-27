# Web app deployment automation
In this project, I was assigned to create a bash script that performs automated deployment simple web app that was created earlier.

## Table of contents
- [Web app deployment automation](#web-app-deployment-automation)
  - [Table of contents](#table-of-contents)
  - [1. Learn about bash](#1-learn-about-bash)
  - [2. Creating the script](#2-creating-the-script)

## 1. Learn about bash

First thing first, we have to learn about bash. I recommend visit [this link](https://ryanstutorials.net/) and select "bash".

## 2. Creating the script

Here's my final script, there's also comments to explain more about the code.

```bash
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

```


