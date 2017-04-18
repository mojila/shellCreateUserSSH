#!/bin/bash
#Script auto create user ssh

read -p "Username          : " username
read -p "Password          : " password
read -p "Masa Aktif (hari) : " masaAktif

IP=`dig +short myip.opendns.com @resolver1.opendns.com`
useradd -e `date -d "$masaAktif days" +"%Y-%m-%d"` -s /bin/false -M $username
exp="$(chage -l $username | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$password\n$password\n" | passwd $username &> /dev/null
echo -e ""
echo -e "Account Terbuat"
echo -e "==========================="
echo -e "Host      : $IP"
echo -e "Port      : 443,143"
echo -e "Username  : $username"
echo -e "Masa Aktif: $exp"
echo -e "==========================="
echo -e "Created By Moji"
