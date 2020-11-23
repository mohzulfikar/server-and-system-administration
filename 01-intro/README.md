# Intro to Cloud Computing (AWS)
In this project, I was introduced to the AWS cloud environment. Starting from how to create an awseducate account to creating an ec2 instance.

## Table of contents
- [Intro to Cloud Computing (AWS)](#intro-to-cloud-computing-aws)
  - [Table of contents](#table-of-contents)
  - [1. AWS Account](#1-aws-account)
  - [2. Dashboard](#2-dashboard)
  - [3. EC2 Dashboard](#3-ec2-dashboard)
  - [4. Launching new Instance](#4-launching-new-instance)
    - [Step 1: Choose AMI](#step-1-choose-ami)
    - [Step 2: Choose Instance Type](#step-2-choose-instance-type)
    - [Step 3: Configure Instance](#step-3-configure-instance)
    - [Step 4: Add Storage](#step-4-add-storage)

## 1. AWS Account
![](img/intro_000.png)
There's two option for you to create AWS account, if you are a student, sign up for aws educate account in [this link](https://www.awseducate.com/). If you are not a student, simply create aws [free tier account](https://aws.amazon.com/free/).

## 2. Dashboard
![](img/intro_001.png)
In the dashboard, there's so much service provided by AWS. For this intro project, we will focus on EC2. Click EC2 in the Compute section to launch EC2 dashboard.

## 3. EC2 Dashboard
![](img/intro_002.png)
In this EC2 dashboard, we will see many term and subsection. We will focus on 5 of them. The first one is Instance (running), in this subsection we will see how many aws instance that are currently running (booting up). The second one is Volumes, in this section we can see how many volume do we have (volume is like an ssd or disk drive, but in the cloud). The third is Key pairs, key pair is the key that we use to connect to our instance. Fourth is Elastic IP that we have. Then the fifth is option to launch new EC2 instance, click to launch instance.

## 4. Launching new Instance

There are 7 step for launching an instance on AWS. The first one is to choose image, either from AWS or community (or even add your own image).

### Step 1: Choose AMI
![](img/intro_003.png)

Search "ubuntu" in the search bar and choose "Ubuntu Server 20.04". Here, we can see that there's "Free tier eligible" notes on the bottom of the logo. It means that, this image can be used for AWS free account and don't have additional cost. Select the image.

### Step 2: Choose Instance Type
![](img/intro_004.png)

Choose t2.micro that have "free tier eligible" notes. Some notes on choosing instance type, we can scale and modify our instance type later on the instance setting (that's the cool part about cloud computing). So for example, now I launch a t2.micro instance for my web app server, several months later the web app is slow because there's so much request to handle for t2.micro instance, I can easily modify currently running instance (by stopping it for a minute) into the type that has much more memory or CPU without reinstalling my web app.

### Step 3: Configure Instance
![](img/intro_005.png)

In this step, we can configure many things. The important part is the "Number of Instances", here we can specify how much t2.micro instance that we want to launch.

### Step 4: Add Storage
