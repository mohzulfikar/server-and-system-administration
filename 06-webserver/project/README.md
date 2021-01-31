# Host Multiple Wordpress Site in EC2

In this project, I was assigned to leverage NGINX server block to host multiple wordpress site on the same EC2 instance And one of the site must be served with HTTPS. Like the previuos project, this is also a team project feat [Fikri](wuvel.net) and [Rafi](rafifauz.site).

## Table of contents <!-- omit in toc -->

- [Host Multiple Wordpress Site in EC2](#host-multiple-wordpress-site-in-ec2)
  - [1. EMP Installation](#1-emp-installation)

## 1. EMP Installation

So what's EMP or LEMP? It's an abbrevation of Linux, NGINX (Engine-X), MySQL (or MariaDB), and PHP. Basically, it's one of the popular [*Tech Stack*](https://stackshare.io/stacks) used to build web application. The installation is very straight-forward in Ubuntu. First, update the repository database and upgrade.

```bash
sudo bash -c "apt update && apt dist-upgrade -yq && apt autoremove"
```
