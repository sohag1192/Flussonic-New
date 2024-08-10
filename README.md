# Flussonic-New


Installing Flussonic Media Server¶
You can install Flussonic Media Server on Ubuntu, CentOS/RedHat and other RPM-based distributions.
----------------

http://flussonic.com/doc/installation

# Flussonic-SH
On Ubuntu
Supported architectures: amd64, arm64.

Supported OS versions: Ubuntu LTS 22.04, 20.04.

Install Flussonic Media Server using the apt tool:

curl -sSf https://flussonic.com/public/install.sh | sh

# Installing Flussonic using Debian installation package (for Ubuntu and higher or Debian 64 bit)

wget -q -O - http://debian.erlyvideo.org/binary/gpg.key | apt-key add -;

echo "deb http://debian.erlyvideo.org binary/" > /etc/apt/sources.list.d/erlyvideo.list;

apt-get update;

apt-get -y install flussonic flussonic-ffmpeg flussonic-python

# Now you are ready to start Flussonic

Activating Flussonic Media Server¶

To activate Flussonic Media Server:

1) Start the server by running the following command in the terminal:

service flussonic start

#Open in browser
---
web interface on the page http://localhost
 --


# "Active Flussonic License Key is Below":
**l4|rXM4FdbzMJif4xUUwkaoi2|r6BzpmVPpjgKpn9IunpFp6lLbCZOp3** 

l4|8Ku8ypPgOUySHysCdkFHW0|r6BzpmVPpjgKpn9IunpFp6lLbCZOp3

l4|rXM4FdbzMJif4xUUwkaoi2|r6BzpmVPpjgKpn9IunpFp6lLbCZOp3

l4|aO4RO2ZdLEzHAdH46n6iD0|r6BzpmVPpjgKpn9IunpFp6lLbCZOp3

# Updating Flussonic

To install updates, simply update the packages and install Flussonic:

apt-get update
apt-get -y install flussonic
service flussonic restart


