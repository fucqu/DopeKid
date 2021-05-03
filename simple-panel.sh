#!/bin/bash
#Licensed to https://www.facebook.com/joash.singh.90
#Script by DopeKid

red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
echo "Connecting to Server..."
sleep 0.4
echo "Checking Permision..."
sleep 0.3
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

# initializing IP
export DEBIAN_FRONTEND=noninteractive
OS=`uname -m`;
MYIP=$(wget -qO- ipv4.icanhazip.com);
MYIP2="s/xxxxxxxxx/$MYIP/g";

sed -i "s/serverip/$MYIP/g" /home/vps/public_html/index.php;

echo "-------------------------------------------"
echo "          Simple Panel Setup Menu          "
echo "-------------------------------------------"
echo "1.  Set Yourvps Root Password"
echo "2.  Set Servername Eg Europe"
echo "3.  Change Panel Site Name"
echo "4.  Turn off Simple Panel"
echo "5.  View Panel Reset log"
echo "6.  Remove Reset log"
echo "-------------------------------------------"
read -p "Select options from (1-6): " x

if test $x -eq 1; then
echo ""
echo "Enter A Root Password:"
read dopepass
echo ""
sed -i "s/serverpass/$dopepass/g" /home/vps/public_html/index.php;
echo "Simple panel passwrord has been set successfully."
elif test $x -eq 2; then
echo ""
echo "Enter A Server Name:"
read dopename
echo ""
sed -i "s/servername/$dopename/g" /home/vps/public_html/index.php;
echo "Simple panel servername has been set successfully."
elif test $x -eq 3; then
echo ""
echo "Enter A New Panel Site Name:"
read dopesite
echo ""
sed -i "s/DK VPS/$dopesite/g" /home/vps/public_html/index.php;
echo "Simple panel site name has been updated successfully."
elif test $x -eq 4; then
sed -i "s/$MYIP/serverip/g" /home/vps/public_html/index.php;
echo "Simple panel has been successfully TURNED OFF.."
elif test $x -eq 5; then
if [ ! -e /root/log-reset.txt ]; then
	echo "No daily limit reset activity found"
	else 
	echo 'LOG RESET'
	echo "---------"
	cat /root/log-reset.txt
fi
elif test $x -eq 6; then
echo "" > /root/log-reset.txt
echo "Simple Panel daily limit reset log successfully deleted!"
else
echo "Options Not Found In Menu"
exit
fi