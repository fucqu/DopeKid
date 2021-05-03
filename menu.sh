#!/bin/bash
#Menu
#Licensed to https://www.facebook.com/joash.singh.90
#Script by DopeKid

if [[ -e /etc/debian_version ]]; then
	OS=debian
	RCLOCAL='/etc/rc.local'
elif [[ -e /etc/centos-release || -e /etc/redhat-release ]]; then
	OS=centos
	RCLOCAL='/etc/rc.d/rc.local'
	chmod +x /etc/rc.d/rc.local
else
	echo "It looks like you are not running this installer on Debian, Ubuntu or Centos system"
	exit
fi
color1='\e[031;1m'
color2='\e[34;1m'
color3='\e[0m'
echo "----------- Welcome To Premium Script Menu ----------"
echo "----------------- Script By Dope~kid ----------------"
echo ""
cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
tram=$( free -m | awk 'NR==2 {print $2}' )
swap=$( free -m | awk 'NR==4 {print $2}' )
up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')
echo -e "\e[032;1mCPU Model:\e[0m $cname"
echo -e "\e[032;1mNumber Of Cores:\e[0m $cores"
echo -e "\e[032;1mCPU Frequency:\e[0m $freq MHz"
echo -e "\e[032;1mTotal Amount Of RAM:\e[0m $tram MB"
echo -e "\e[032;1mTotal Amount Of Swap:\e[0m $swap MB"
echo -e "\e[032;1mSystem Uptime:\e[0m $up"
echo -e "-------------------------------------"
echo ""
echo -e "-----=[ SSH & OpenVPN Section ]=-----"
echo -e "${color1}1${color3}.Create User Account (${color2}user-add${color3})"
echo -e "${color1}2${color3}.Generate Random Account (${color2}user-generate${color3})"
echo -e "${color1}3${color3}.Create Trial Account (${color2}trial${color3})"
echo -e "${color1}4${color3}.Extend User Account  (${color2}user-active${color3})"
echo -e "${color1}5${color3}.Change User Account Password (${color2}user-password${color3})"
echo -e "${color1}6${color3}.Delete User Account (${color2}user-delete${color3})"
echo -e "${color1}7${color3}.User Account Details (${color2}user-detail${color3})"
echo -e "${color1}8${color3}.Display User Lists (${color2}user-list${color3})"
echo -e "${color1}9${color3}.Check Account Login (${color2}user-login${color3})"
echo -e "${color1}10${color3}.Set SSH Multi Login Limit (${color2}autokill${color3})"
echo -e " "
echo -e "-----=[ V2ray/Vmess Section ]=-----"
echo -e "${color1}11${color3}.Create Vmess WS Account (${color2}add-ws${color3})"
echo -e "${color1}12${color3}.Delete Vmess WS Account (${color2}del-ws${color3})"
echo -e "${color1}13${color3}.Extend Vmess WS Account (${color2}renew-ws${color3})"
echo -e "${color1}14${color3}.Check Vmess WS Login (${color2}check-ws${color3})"
echo -e " "
echo -e "-----=[ V2ray/Vless Section ]=-----"
echo -e "${color1}15${color3}.Create Vless WS Account (${color2}add-vless${color3})"
echo -e "${color1}16${color3}.Delete Vless WS Account (${color2}del-vless${color3})"
echo -e "${color1}17${color3}.Extend Vless WS Account (${color2}renew-vless${color3})"
echo -e "${color1}18${color3}.Check Vless WS Login (${color2}check-vless${color3})"
echo -e " "
echo -e "-----=[ VPS Section ]=-----"
echo -e "${color1}19${color3}.Speedtest Server (${color2}speedtest${color3})"
echo -e "${color1}20${color3}.Check Server RAM Usage (${color2}ram${color3})"
echo -e "${color1}21${color3}.Restart Stunnel (${color2}service stunnel restart${color3})"
echo -e "${color1}22${color3}.Restart V2ray (${color2}service v2ray restart${color3})"
echo -e "${color1}23${color3}.Restart Webmin (${color2}service webmin restart${color3})"
echo -e "${color1}24${color3}.Restart OpenSSH (${color2}service ssh restart${color3})"
echo -e "${color1}25${color3}.Restart Dropbear (${color2}service dropbear restart${color3})"
echo -e "${color1}26${color3}.Restart OpenVPN (${color2}service openvpn restart${color3})"
echo -e "${color1}27${color3}.Restart Squid Proxy (${color2}service squid restart${color3})"
echo -e "${color1}28${color3}.Edit Server Port (${color2}edit-port${color3})"
echo -e "${color1}29${color3}.Set Auto Reboot (${color2}auto-reboot${color3})"
echo -e "${color1}30${color3}.Reboot VPS(${color2}reboot${color3})"
echo -e "${color1}31${color3}.Change Server Password (${color2}passwd${color3})"
echo -e " "
echo -e "-----=[ Others ]=-----"
echo -e "${color1}32${color3}.View Installation Log (${color2}log-install${color3})"
echo -e "${color1}33${color3}.Simple Panel Setup (${color2}simple-panel${color3})"
echo -e "${color1}34${color3}.Renew V2ray Cert (${color2}v2ray-cert${color3})"
echo -e "${color1}35${color3}.About AutoScript (${color2}about${color3})"
echo -e "${color1}36${color3}.VPS Diagnostics (${color2}diagnosis${color3})"
echo -e "${color1}37${color3}.Exit Menu (${color2}exit${color3})"
echo -e "-------------------------------------"
read -p "Choose an option from (1-37): " x
if test $x -eq 1; then
user-add
elif test $x -eq 2; then
user-generate
elif test $x -eq 3; then
trial
elif test $x -eq 4; then
user-active
elif test $x -eq 5; then
user-password
elif test $x -eq 6; then
user-delete
elif test $x -eq 7; then
user-detail
elif test $x -eq 8; then
user-list
elif test $x -eq 9; then
user-login
elif test $x -eq 10; then
autokill
elif test $x -eq 11; then
add-ws
elif test $x -eq 12; then
del-ws
elif test $x -eq 13; then
renew-ws
elif test $x -eq 14; then
check-ws
elif test $x -eq 15; then
add-vless
elif test $x -eq 16; then
del-vless
elif test $x -eq 17; then
renew-vless
elif test $x -eq 18; then
check-vless
elif test $x -eq 19; then
speedtest
elif test $x -eq 20; then
ram
elif test $x -eq 21; then
service stunnel4 restart
elif test $x -eq 22; then
systemctl restart v2ray
elif test $x -eq 23; then
service webmin restart
elif test $x -eq 24; then
service ssh restart
elif test $x -eq 25; then
service dropbear restart
elif test $x -eq 26; then
service openvpn restart
elif test $x -eq 27; then
service squid restart
elif test $x -eq 28; then
edit-port
elif test $x -eq 29; then
auto-reboot
elif test $x -eq 30; then
reboot
elif test $x -eq 31; then
passwd
elif test $x -eq 32; then
log-install
elif test $x -eq 33; then
simple-panel
elif test $x -eq 34; then
v2ray-cert
elif test $x -eq 35; then
about
elif test $x -eq 36; then
diagnosis
elif test $x -eq 37; then
echo " "
echo "GOODBYE!!!"
echo "SCRIPT BY DOPE~KID"
echo " "
exit
else
echo "Options Not Available In Menu."
echo " "
exit
fi
