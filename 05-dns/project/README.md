# DNS Server with EC2

In this project, I was assigned to create DNS server with EC2 instance with group of 3 students.

This is basically a team project, i teamed up with [Fikri](wuvel.net) and [Rafi](rafifauz.site). Also, i actually have to redo the assignment because our submission is not actually what the project intended too (we don't delegate zone, thus we basically just add A record on our DNS record). I also read [this](https://badshah.io/how-i-hosted-a-dns-server-on-aws/) and [this](https://www.digitalocean.com/community/tutorials/
how-to-configure-bind-as-a-private-network-dns-server-on-ubuntu-18-04) guide for this project. You should see their website too! :)

## Table of contents  <!-- omit in toc -->

- [DNS Server with EC2](#dns-server-with-ec2)
  - [1. Setup EC2 with Elastic IP](#1-setup-ec2-with-elastic-ip)
    - [Launch an Instance](#launch-an-instance)
    - [Allocate Elastic IP](#allocate-elastic-ip)

## 1. Setup EC2 with Elastic IP

Launch an EC2 instance and attach Elastic IP to it. Here's step-by-step to attach Elastic IP to an instance if you want  refresher.

### Launch an Instance

In this example, i use t2.micro which is available for free-tier usage. For the image, i use ubuntu 18.04.

![launch instance](img/001.png)

> A quick note here, make sure you have proper security group configuration (open ports for DNS, etc.)

### Allocate Elastic IP

There's 2 step for attaching elastic IP to an instance, the first is to "allocate" or get an IP from amazon's pool of IPv4 addresses and then we "associate" the IP to the instance. To allocate elastic IP, look at EC2 dashboard in the "Network & Security" category, select "Elastic IPs".

![allocate elastic ip](img/002.png)