# Provisioning Webapp Using Vagrant
In this project, I was assigned to create simple Vagrantfile for serving simple webapp with bash automation (the one i created in previous project) with private IP 192.168.56.100.

## Table of contents
- [Provisioning Webapp Using Vagrant](#provisioning-webapp-using-vagrant)
  - [Table of contents](#table-of-contents)
  - [1. Initialize Vagrant](#1-initialize-vagrant)
  - [2. Script Throwback](#2-script-throwback)
    - [Modify IP](#modify-ip)
  - [3. Provisioning VM and Running the Script](#3-provisioning-vm-and-running-the-script)

## 1. Initialize Vagrant

First, we can initialize vagrant directory by using `vagrant init`

```bash
vagrant init ubuntu/bionic64
```

![](img/001.png)

## 2. Script Throwback

After that, we can modify our Vagrantfile to match the project specification.

### Modify IP
First, change the IP address to `192.168.56.100`

```ruby
  config.vm.network "private_network", ip: "192.168.56.100"
```

Then, change the vm provisioning to `shell` and provide path to the previous script that we created.

```ruby
  config.vm.provision "shell", path:"script.sh"
```

The final Vagrantfile should look like this,

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :
##########
## By: mohzulfikar
##########
Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"
  # Set the private IP
  config.vm.network "private_network", ip: "192.168.56.100"
  config.vm.provider "virtualbox" do |vb|
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  # Specify bash script path
  config.vm.provision "shell", path:"script.sh"
end
```

## 3. Provisioning VM and Running the Script