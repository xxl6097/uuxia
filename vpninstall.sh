#!/bin/bash

function installVPN(){
	echo "begin to install VPN services";
	wget https://raw.githubusercontent.com/xxl6097/uuxia/master/vpn_centos6.sh
    chmod a+x vpn_centos6.sh
    bash vpn_centos6.sh
	
}

function uninstallVpn(){
	echo "begin to repaire VPN";
	service pptpd stop
	yum remove -y pptpd ppp
	iptables --flush POSTROUTING --table nat
	iptables --flush FORWARD
	rm -rf /etc/pptpd.conf
	rm -rf /etc/ppp
}

echo "which do you want to?input the number."
echo "1. install VPN service"
echo "2. uninstallVpn service"
read num

case "$num" in
[1] ) (installVPN);;
[2] ) (uninstallVpn);;
*) echo "nothing,exit";;
esac
