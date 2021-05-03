#!/bin/bash
#Licensed to https://www.facebook.com/joash.singh.90
#Script by DopeKid

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Connecting to Server..."
sleep 0.5
echo "Checking Permision..."
sleep 0.4
CEK=DopeKid
if [ "$CEK" != "DopeKid" ]; then
		echo -e "${red}Permission Denied!${NC}";
        echo $CEK;
        exit 0;
else
echo -e "${green}Permission Accepted...${NC}"
sleep 1
clear
fi
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/v2ray/vless.json")
	if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
		clear
		echo ""
		echo "You have no existing clients!"
		exit 1
	fi

	clear
	echo ""
	echo "==================================="
        echo "Select the client you want to renew"
	echo "==================================="
	grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 2-3 | nl -s ') '
	until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
		if [[ ${CLIENT_NUMBER} == '1' ]]; then
			read -rp "Select one client [1]: " CLIENT_NUMBER
		else
			read -rp "Select one client [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
		fi
	done
read -p "How many days?: " masaaktif
user=$(grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/v2ray/vless.json" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
now=$(date +%Y-%m-%d)
d1=$(date -d "$exp" +%s)
d2=$(date -d "$now" +%s)
exp2=$(( (d1 - d2) / 86400 ))
exp3=$(($exp2 + $masaaktif))
exp4=`date -d "$exp3 days" +"%Y-%m-%d"`
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/vless.json
sed -i "s/### $user $exp/### $user $exp4/g" /etc/v2ray/vnone.json
clear
echo ""
echo " ==========================="
echo " Account Renewed Successfull"
echo " ==========================="
echo " Client Name : $user"
echo " Expired On  : $exp4"
echo " ==========================="
