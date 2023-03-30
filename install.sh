#!/bin/bash
#
#Instalación de los servicios necesarios.
#
#DHCP,DNS,ADDS,VPN,MONITORIZACIÓN,LOGS,HTTP,SMTP,SSH,FTP, etc...
#
#
#

trap exity SIGINT 


function exity () {
	echo " "
	echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Ctrl_C Detected ... "
	echo " "
	sleep 1
	echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Saliendo. "
	echo " "
	sleep 1
	tput sgr0
	exit
}

timeout 0.7 ping -c 1 google.es &> /dev/null

if [[ $? == 0 ]] ; then
        echo " "
        echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Hay conectividad!."
        echo " "
else
        echo " "
        echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) No hay conectividad."
        echo " "
	exit
fi


apt install figlet -y &> /dev/null
apt install net-tools -y &> /dev/null
apt install zip -y &> /dev/null

echo "$(tput setaf 6)"

figlet Actualizacion de Sistema:

echo " "
echo " "
read -p "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2)Va a llevar a cabo el proceso de instalación ... ¿Desea comentar alguna línea del script para cancelar alguna instalación específica?(Y/N) --> " answerXP
echo " "
echo " "

if [[ $answerXP == "Y" ]] ; then
	nano install.sh
else


echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Updateando el Sistema ... "
apt update -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Upgradeando el Sistema ..."
apt upgrade -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 6)"

figlet Instalando Servicios de Red:

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio DHCP ..."
apt install isc-dhcp-server -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio DNS ... "
apt install bind9 -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio SMTP ... "
apt install postfix -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio FTP ... "
apt install vsftpd -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio SSH ... "
apt install openssh-server -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio SMB ... "
apt install samba -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."

echo "$(tput setaf 6)"

figlet Instalando Servicios Web:

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servico HTTP Apache2 ... "
apt install apache2 -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio HTTP nginx ... "
apt install nginx -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 6)"

figlet Instalando Servicios de Seguridad:

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio VPN ... "
apt install openvpn -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado."
sleep 1

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio UFW ..."
apt install ufw -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado. "

echo "$(tput setaf 6)"

figlet Instalando Servicios DB:

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando servicio MySQL ... "
apt-get install mariadb-server -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado. "
sleep 1

echo "$(tput setaf 6)"

figlet Instalando Monitorización:

echo "$(tput setaf 9)[$(tput setaf 6)*$(tput setaf 9)]$(tput setaf 2) Instalando NetGIOS ... "
apt install nagios4 nagios-nrpe-plugin -y &> /dev/null

echo "$(tput setaf 9)[$(tput setaf 3)*$(tput setaf 9)]$(tput setaf 2) Completado. "
sleep 1


tput sgr0

chmod +x SwissAdminTool &> /dev/null
chmod +x backup_server &> /dev/null
chmod +x dhcp_server &> /dev/null
chmod +x dns_server &> /dev/null
chmod +x ftp_server_creation &> /dev/null
chmod +x mysql_server &> /dev/null
chmod +x no_static_ip &> /dev/null
chmod +x server_config &> /dev/null
chmod +x ssh_server &> /dev/null
chmod +x static_ip &> /dev/null
chmod +x ufw_server &> /dev/null
chmod +x vpn_server &> /dev/null
fi

