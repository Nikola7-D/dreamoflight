#! /bin/bash



pacman -Syy
&&
alsamixer &&
alsactl store
&&
pacman -S nano ntp cronie gst-plugins-{base,good,bad,ugly} gst-libav xorg-{server,xinit,apps} xf86-input-libinput xdg-user-dirs ttf-{bitstream-vera,liberation,freefont,dejavu} freetype2 cups hplip python-pyqt5
pacman -S foomatic-{db,db-ppds,db-gutenprint-ppds,db-nonfree,db-nonfree-ppds} gutenprint libreoffice-still-fr firefox-i18n-fr firefox-ublock-origin gvfs-{afc,goa,google,gphoto2,mtp,nfs,smb} mate mate-extra lightdm-gtk-greeter gnome-icon-theme vlc quodlibet python-pyinotify accountsservice ffmpegthumbnailer pulseaudio
pulseaudio-{alsa,bluetooth} blueman libcanberra-{pulse,gstreamer} system-config-printer thunderbird-i18n-fr plank albert screenfetch gparted lightdm-gtk-greeter-settings neofetch htop git -y


#useradd -m -g wheel -c 'Nom complet de l’utilisateur' -s /bin/bash nom-de-l’utilisateur → sur une seule ligne !
#passwd nom-de-l’utilisateur


&& echo "Wheel ALL=(ALL) ALL" > /etc/sudoers
&& localectl set-x11-keymap fr

&& git clone https://aur.archlinux.org/trizen
&& cd trizen
&& makepkg -sri -y




&& systemctl enable syslog-ng@default
&& systemctl enable cronie
&& systemctl enable avahi-daemon
&& systemctl enable avahi-dnsconfd
&& systemctl enable org.cups.cupsd
&& systemctl enable bluetooth
&& systemctl enable ntpd


&& systemctl enable accounts-daemon
&& systemctl enable lightdm

&& systemctl start accounts-daemon
&& systemctl start lightdm