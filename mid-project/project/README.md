# Mid-term Project

The project is about configuring Moodle using AWS EC2 with 2 instance with the following requirements,

- First instance EC2 as a nginx webserver
- Second instance EC2 as a database server
- The site must have HTTPS
- The site must use a domain provided on the spreadsheet (or custom)

There's also additional requirements as follows,

- Use elastic IP for the instance
- For mysql, modify the configuration on /etc/mysql/my.cnf so that the bind address is 0.0.0.0 (the default was loopback ip 127.0.0.1)
- Open only the required port in SG (80, 443, 3306)

> As an additional notes, this is also a collaborative project. I partnered with [Fikri](wuvel.net) to finish the project, you can visit his website too :)

## Table of Contents <!-- omit in toc -->

- [Mid-term Project](#mid-term-project)
  - [EC2 Setup](#ec2-setup)

## EC2 Setup

We will create 2 instance for webserver and database. In the webserver instance, i'll open port 80 and 443 and for the database server i'll only open 3306 for mysql and 22 for SSH in each instance.
