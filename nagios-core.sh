#!/bin/bash -x
# Create by Luis Contreras
# Email: luis.contreras.do@gmail.com

echo ""
echo "This script will install the following: "
echo "Nagios 4.4.5"
echo "Nagios Plugins 2.2.1"
echo "NRPE 4.0.3"
echo "It will download Only Linux Agent for being used in your Linux hosts"


sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0
systemctl stop firewalld.service
systemctl disable firewalld.service
yum update -y && yum upgrade -y
yum install -y epel-release
yum install -y git curl make gcc wget nano vim g++ unzip tar rar zip python-devel python-setuptools python-pip net-tools
yum install -y gcc glibc glibc-common wget unzip httpd php gd gd-devel perl postfix
cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz
tar xzf nagioscore.tar.gz
cd /tmp/nagioscore-nagios-4.4.5/
./configure
make all
make install-groups-users
usermod -a -G nagios apache
make install
make install-daemoninit
systemctl enable httpd.service
make install-commandmode
make install-config
make install-webconf
htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin
systemctl start httpd.service
yum install -y gcc glibc glibc-common make gettext automake autoconf wget openssl-devel net-snmp net-snmp-utils epel-release
yum install -y perl-Net-SNMP
cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz
cd /tmp/nagios-plugins-release-2.2.1/
./tools/setup
./configure
make
make install
systemctl start nagios.service
systemctl stop nagios.service
systemctl restart nagios.service
systemctl status nagios.service
echo "INSTALACION DE NRPE V4"
echo ""
yum install -y gcc glibc glibc-common make gettext automake autoconf wget openssl-devel net-snmp net-snmp-utils epel-release
yum install -y perl-Net-SNMP
cd /tmp
wget --no-check-certificate -O nrpe.tar.gz https://github.com/NagiosEnterprises/nrpe/archive/nrpe-4.0.3.tar.gz
tar xzf nrpe.tar.gz
cd /tmp/nrpe-nrpe-4.0.3/
./configure --enable-command-args
make all
make install-groups-users
make install
make install-config
make install-plugin
cd /tmp
wget https://assets.nagios.com/downloads/nagiosxi/agents/linux-nrpe-agent.tar.gz













