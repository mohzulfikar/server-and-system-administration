# LVM on AWS EC2
In this project, I was assigned to create LVM on EC2 instance 10GB capacity consist of 2 EBS volume that have 4 partition with 2GiB size each (In short, i should create LVM consist of 5 partition).

## Table of contents
- [LVM on AWS EC2](#lvm-on-aws-ec2)
  - [Table of contents](#table-of-contents)
  - [1. Creating New Volume](#1-creating-new-volume)
  - [2. Creating Partition](#2-creating-partition)
  - [3. Creating the LVM](#3-creating-the-lvm)

## 1. Creating New Volume

Like before, create 2 new EBS Volume (8 GiB each).

![Creating Volume](img/001.png)

Attach the new volume to an instance.

![Attaching Volume](img/002.png)

![Attaching Volume 2](img/003.png)

![Attaching Volume 3](img/004.png)

Run `lsblk` command to see list of attached disk.

![List Block Devices](img/005.png)

## 2. Creating Partition

Create new partition using `parted`. Assign `msdos` label and set it to become *primary partition*. For the filesystem, type `ext4`. The start position on 1st partition should be 0 until 2048MB, then 2049MB to 4096MB, 4097MB to 6144MB, and the last one 6145MB to 8192MB.

![Parted Init](img/006.png)

Type `print` on parted console and we should see the following table.

![Parted Print](img/007.png)

Exit parted and format the previously created partition into ext4 filesystem using `mkfs`.

![mkfs](img/008.png)

> if you had trouble finding the correct name for device, just type `lsblk` or `df -aH` (or just find the disk name and add number after it 1, 2, 3, and 4).

Repeat the step for the second disk and the final result should look like this,

![mkfs2](img/009.png)

## 3. Creating the LVM

Install `lvm2` and make sure to start `dm-mod` kernel module,

