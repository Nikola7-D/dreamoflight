pacman -S reflector -y && mkfs.ext4 /dev/sda1 && mkfs.ext4 /dev/sda2 && mkfs.ext4 /dev/sda3 && mkswap /dev/sda4 && swapon /dev/sda4 && mount /dev/sda2 /mnt && mkdir /mnt/{boot,home} && mount /dev/sda3 /mnt/home && mount /dev/sda1 /mnt/boot && reflector --verbose --latest 10 --sort rate --save /etc/pacman.d/mirrorlist && pacstrap /mnt base base-devel pacman-contrib && pacstrap /mnt zip unzip p7zip vim mc alsa-utils syslog-ng mtools dosfstools lsb-release ntfs-3g exfat-utils bash-completion linux-lts intel-ucode && genfstab -U -p /mnt >> /mnt/etc/fstab && pacstrap /mnt grub os-prober && arch-chroot /mnt && echo "KEYMAP=fr-latin9 && FONT=eurlatgr" > /etc/vconsole.conf && echo "LANG=fr_FR.UTF-8
LC_COLLATE=C" > /etc/locale.conf && echo "fr_FR.UTF-8 UTF-8" > /etc/locale.gen && locale-gen && export LANG=fr_FR.UTF-8 && echo "archlinux" > /etc/hostname && ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime && mkinitcpio -p linux-lts && grub-install --no-floppy --recheck /dev/sda && grub-mkconfig -o /boot/grub/grub.cfg && passwd root && pacman -Syy networkmanager && systemctl enable NetworkManager && exit && umount -R /mnt && reboot













