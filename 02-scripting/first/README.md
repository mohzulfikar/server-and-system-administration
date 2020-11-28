# Directory automation
In this project, I was assigned to create simple bash script that creates _n_ directory provided on the parameter like,
```bash
./script.sh 4
```
And then it would make 4 directories.

## Table of contents
- [Directory automation](#directory-automation)
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

