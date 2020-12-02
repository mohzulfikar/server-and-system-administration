# Wordpress Deployment
In this project, I was assigned to do wordpress deployment on EC2 instance.

## Table of contents
- [Wordpress Deployment](#wordpress-deployment)
  - [Table of contents](#table-of-contents)
  - [1. Creating the Instance](#1-creating-the-instance)
  - [2. Installing Apache, MySQL, and PHP (LAMP)](#2-installing-apache-mysql-and-php-lamp)

## 1. Creating the Instance

Choose Ubuntu 18.04 AMI, don't forget to set the security group with an additional rule to allow inbound connection on port 80 (well, actually i think we should learn how to automate this in the future).

![](img/001.png)

Open SSH connection to the server.

![](img/002.png)

The command i run on the screenshot is to set database name environtment variable for wordpress. Do the following command to initialize setup.

```bash
$ export wordpress_db_name="your_wpdb_name"
```

```bash
$ export db_root_password="your_wpdb_password"
```

Please take a note that you MUST NOT do this (specify the password in plaintext) in the production environtment.

And then, update the instance

![](img/003.png)

## 2. Installing Apache, MySQL, and PHP (LAMP)
