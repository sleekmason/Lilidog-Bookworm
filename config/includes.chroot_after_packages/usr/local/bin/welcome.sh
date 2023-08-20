#!/bin/bash
# Welcome script for Lilidog made by sleekmason 2-24-22

full_fs=$(df ~ | tail -1 | awk '{print $1;}')  # find partition
fs=$(basename "$full_fs")
if grep -q "$fs" /proc/partitions; then
  yad --title "Welcome!" --window-icon=/usr/share/icons/ld-icons/paw-color.png \
--width=488 --height=444 --center --escape-ok --undecorated --skip-taskbar \
--button=" Begin"!/usr/share/icons/gnome/22x22/places/debian-swirl.png!:"x-terminal-emulator -T 'Customization' -e 'sudo ld-entry -i'" \
--button=" Exit!application-exit:0" \
--text-info --justify=left --wrap < /usr/share/lilidog/welcome.txt --fontname="JetBrains Mono Light 11" \
--fore="#C0DDEB"; sed -i '/welcome.sh &/d' ~/.config/openbox/autostart; exit
else
  yad --notification --image=/usr/share/icons/ld-icons/install.png --text "Install Lilidog ┃ User password ▸ 'user' ┃ Root password ▸ 'live'" --command "gksudo calamares" &
  yad --title "Welcome!" --window-icon=/usr/share/icons/ld-icons/paw-color.png \
--width=488 --height=520 --center --escape-ok --undecorated --skip-taskbar \
--button=" Exit!application-exit:0" \
--text-info --justify=left --wrap < /usr/share/lilidog/welcome2.txt --fontname="JetBrains Mono Light 11" \
--fore="#C0DDEB"; sed -i '/welcome.sh &/d' ~/.config/openbox/autostart; exit
fi
