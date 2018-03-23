export LC_ALL=en_US.UTF-8 >> ~/.bashrc
apt-get update
apt-get -qqy upgrade
apt-get remove docker docker-engine docker.io
apt-get remove docker-compose
apt-get install -y apt-transport-https ca-certificates curl software-properties-common git
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
apt-get install -y docker-ce
usermod -aG docker vagrant
ufw default deny incoming
ufw default allow outgoing
ufw allow www
ufw allow https
ufw allow ssh
ufw allow 2377/tcp
ufw allow 7946/tcp
ufw allow 7946/udp
ufw allow 4789/udp
yes | ufw enable
echo "Final update check"
apt-get update
apt-get -qqy upgrade

vagrantTip="[35m[1mThe shared directory is located at /shared\\nTo access your shared files: cd /shared[m"
echo -e $vagrantTip > /etc/motd

echo "Done installing your virtual machine!"