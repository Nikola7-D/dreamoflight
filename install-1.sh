#! /bin/bash


loadkeys fr
&&
pacman -Syu openssh && systemctl start sshd
&&
passwd root
&&
ip addr #pour connaître l'adresse ip 
dhclient #si besoin pour relancer les requêtes DHCP (utiliser la commande "wifi-menu" pour une connexion wifi) 



