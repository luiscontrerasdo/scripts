#!/bin/bash -x

yum update -y && yum uprade -y
curl https://packages.microsoft.com/config/rhel/7/prod.repo | sudo tee /etc/yum.repos.d/microsoft.repo
yum install -y powershell

