# Intro to Vagrant
In this project, I was assigned to create EC2 instance with 10GB SSD and attach an additional EBS volume into the instance.

## Table of contents
- [Intro to Vagrant](#intro-to-vagrant)
  - [Table of contents](#table-of-contents)
  - [1. Preparing the Needed](#1-preparing-the-needed)
  - [2. Creating New Volume](#2-creating-new-volume)
  - [3. Look at the vagrantfile configuration file](#3-look-at-the-vagrantfile-configuration-file)

## 1. Preparing the Needed

Go to the EC2 dashboard, select the instance that we will attach new volume into. There are 2 information that must be noted, the first is the _instance ID_ the second one is _availability zone_.

After that, on the navigation pane, select _Volume_ on _elastic block store_ section.

![](img/001.png)

## 2. Creating New Volume

In the EBS volume dashboard, click "Create Volume" and create new volume as desired. Here, in my case i create new volume with 4GiB with SSD gp2 type. Take a note that availability zone for the volume MUST be same as the target instance (ap-southeast-1b in my case).

![](img/002.png)

![](img/003.png)

![](img/004.png)


## 3. Look at the vagrantfile configuration file

![](img/intro-vgr-003.png)

We can delete the lines that are less important (for this assignment) and leave as follows,

