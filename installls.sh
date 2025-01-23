#!/bin/bash

bold=$(tput bold)
underline=$(tput smul)
italic=$(tput sitm)
info=$(tput setaf 2)
error=$(tput setaf 160)
warn=$(tput setaf 214)
reset=$(tput sgr0)


if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

echo "    ________                            _         _   __      ____         __"
echo "   / ____/ /_  ________________  ____  (_)____   / | / /_  __/ / /__  ____/ /"
echo "  / /_  / / / / / ___/ ___/ __ \/ __ \/ / ___/  /  |/ / / / / / / _ \/ __  / "
echo " / __/ / / /_/ (__  |__  ) /_/ / / / / / /__   / /|  / /_/ / / /  __/ /_/ /  "
echo "/_/   /_/\__,_/____/____/\____/_/ /_/_/\___/  /_/ |_/\__,_/_/_/\___/\__,_/   "
echo "  "
echo "  "
echo "${underline}${warn}${bold}--=Flussonic 24.02 Nulled Private Release=--${reset}"
echo "  "
echo "  "
curl -sSf https://flussonic.com/public/install.sh | sh
sleep 2
cd resources/
dpkg -i *.deb

echo "  "
echo "${warn}${bold}Installation Complete!${reset}"

cat > /etc/flussonic/flussonic.conf <<EOF
# Global settings:
http 80;
rtmp 1935;
srt 1234;
pulsedb /var/lib/flussonic;
session_log /var/lib/flussonic;
edit_auth admin admin;

# DVRs:

# Remote sources:

# Balancer:

# Stream templates:

# Ingest streams:

# Disk file caches:

# VOD locations:

# DVB cards:

# Components:
iptv;
EOF

echo "  "


service flussonic start
/etc/init.d/flussonic restart
sleep 2
echo "  "
echo "${warn}${bold}Installation Complete!${reset}"

local_ip=$(hostname -I | awk '{print $1}')
http_port=$(cat /etc/flussonic/flussonic.conf | grep http | awk '{print $2}' | sed 's/;//g')
rtmp_port=$(cat /etc/flussonic/flussonic.conf | grep rtmp | awk '{print $2}' | sed 's/;//g')
srt_port=$(cat /etc/flussonic/flussonic.conf | grep srt | awk '{print $2}' | sed 's/;//g')
echo "${warn}${bold}Local IP: $local_ip${reset}"
echo "${warn}${bold}HTTP Port: $http_port${reset}"
echo "${warn}${bold}RTMP Port: $rtmp_port${reset}"
echo "${warn}${bold}SRT Port: $srt_port${reset}"

ip_address=$(curl -s https://ifconfig.me)
url="http://$ip_address:$http_port"
echo "${warn}${bold}Server URL: $url${reset}"
echo "${warn}${bold}Username: admin${reset}"
echo "${warn}${bold}Password: admin${reset}"
echo "${warn}${bold}Copy License Key: l4|AbOFvyPq7piW0ub_MfFUL2|r6BzpmVPpjgKpn9IunpFp6lLbCZOp3${reset}"
echo "  "
