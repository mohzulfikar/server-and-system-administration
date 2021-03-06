# Attach EBS on EC2

In this project, I was assigned to create EC2 instance with 10GB SSD and attach an additional EBS volume into the instance.

## Table of contents <!-- omit in toc -->

- [Attach EBS on EC2](#attach-ebs-on-ec2)
  - [1. Preparing the Needed](#1-preparing-the-needed)
  - [2. Creating New Volume](#2-creating-new-volume)
  - [3. Attaching the Volume](#3-attaching-the-volume)
  - [4. Creating a Filesystem](#4-creating-a-filesystem)
  - [5. Mounting the Volume](#5-mounting-the-volume)

## 1. Preparing the Needed

Go to the EC2 dashboard, select the instance that we will attach new volume into. There are 2 information that must be noted, the first is the _instance ID_ the second one is _availability zone_.

After that, on the navigation pane, select _Volume_ on _elastic block store_ section.

![prepare ec2](img/001.png)

## 2. Creating New Volume

In the EBS volume dashboard, click "Create Volume" and create new volume as desired. Here, in my case i create new volume with 4GiB with SSD gp2 type. Take a note that availability zone for the volume MUST be same as the target instance (ap-southeast-1b in my case).

![create volume](img/002.png)

![specify the size](img/003.png)

If successful, the new volume will appear on the EBS dashboard with a state / status available.

![select volume](img/004.png)

## 3. Attaching the Volume

Right click on the volume and select attach volume.

![attach the volume](img/005.png)

There will be a popup to choose the instance, recall the ID we noted before and select the instance. For the device name, we can leave as it is or change to `/dev/sdf`, `/dev/sdg`, or whatever. Click "Attach" to attach the volume.

![select instance to be attached](img/006.png)

Wait for a while until the volume state changed to "in-use" with little green circle.

![after attached](img/007.png)

## 4. Creating a Filesystem

Run the `df` command to see if the volume already exists on that instance.

![filesystem](img/008.png)

As you can see, the volume we added is not visible yet. This is because we haven't done formatting and mounting the new volume. Although, we can actually see all filesystem including volume / disk that are not mounted yet with command,

```bash
df -aH
```

We can also see all *storage* that had been attached on the instance using command,

```bash
lsblk
```

We can see there's one disk named xvdf with 4G of size (which is the volume that we created earlier).

![lsblk](img/009.png)

Before *mounting* the new volume, look at the filesystem of the new volume by typing the command,

```bash
sudo file -s /dev/xvdf
```

Then, look at the root partition filesystem with the command

```bash
sudo file -s /dev/xvda1
```

![list volume](img/010.png)

Here we can see that the new volume still doesn't have a file system and for the root partition it has an ext4 file system. Create a new filesystem for additional volume with the command,

```bash
sudo mkfs -t ext4 /dev/xvdf
```

![make filesystem](img/011.png)

## 5. Mounting the Volume

Create a new directory at home or at root. Create with the desired name such as "tambahan" (addition in bahasa).

```bash
mkdir tambahan /dev/xvdf
sudo mount -t ext4 /dev/xvdf
```

![create new dir](img/012.png)

Run the `df` command again and you can see that the previously created volume appears in the output of the command with the description _Mounted on_ the directory we created earlier.

![list mounted devices](img/013.png)

> A little additional note, because earlier we mounted it as root, the additional folder will change its ownership to root. However, we can change it with the command,
>
> ```bash
> $ sudo chown ubuntu:ubuntu tambahan
> ```
>
> After that, we should be able to use the directory without root previledges.
