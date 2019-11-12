#! /bin/bash


loadkeys fr
&&
pacman -Syu openssh && systemctl start sshd
&&
passwd root
&&
hostname -i



