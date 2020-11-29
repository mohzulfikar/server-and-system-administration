# Intro to Vagrant
In this project, I was assigned to create simple Vagrantfile for provisioning Ubuntu VM with private IP 192.168.56.100.

## Table of contents
- [Intro to Vagrant](#intro-to-vagrant)
	- [Table of contents](#table-of-contents)
	- [1. Creating a new directory for vagrant](#1-creating-a-new-directory-for-vagrant)
	- [2. Initialize Vagrant directory](#2-initialize-vagrant-directory)
	- [3. Look at the vagrantfile configuration file](#3-look-at-the-vagrantfile-configuration-file)
	- [4. Boot Up the vm](#4-boot-up-the-vm)

## 1. Creating a new directory for vagrant

Create a new directory for Vagrantfile. Here, i name it "projek adser", go to the directory and install vagrant (vagrant installation can be done before creating a directory). Because i use arch-based linux, my command for installing it would be,
```bash
$ sudo pacman -S vagrant
```
Wait for the installation process to complete.
![](img/intro-vgr-001.png)

## 2. Initialize Vagrant directory

Open the directory using prefered text editor (here, i use vscodium). Type this command to initialize vagrant directory (create vagrantfile) with ubuntu bionic (18.04) image.
``` bash
$ vagrant init ubuntu/bionic64
```
![](img/intro-vgr-002.png)

## 3. Look at the vagrantfile configuration file

![](img/intro-vgr-003.png)

We can delete the lines that are less important (for this assignment) and leave as follows,

![](img/intro-vgr-004.png)

## 4. Boot Up the vm

We can boot up the vm using,
```bash
$ vagrant up
```
![](img/intro-vgr-005.png)
