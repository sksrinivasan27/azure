#!/bin/bash
sudo apt-get update
#install gnome desktop
#sudo apt-get install ubuntu-desktop -y
#install xrdp
sudo apt-get install xrdp -y

#using xfce if you are using Ubuntu version later than Ubuntu 12.04LTS
sudo apt-get install xfce4 -y
#sudo apt-get install xubuntu-desktop -y
sudo echo xfce4-session >/root/.xsession
sudo sed -i '/\/etc\/X11\/Xsession/i xfce4-session' /etc/xrdp/startwm.sh
sudo service xrdp restart

#install docker
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce -y

#install cloudlens container
sudo docker pull ixiacom/cloudlens-sandbox-agent
sudo docker run \
--name CloudLensEBC \
-v /:/host \
-v /var/run/docker.sock:/var/run/docker.sock \
-d --restart=always \
--net=host \
--privileged \
ixiacom/cloudlens-sandbox-agent:latest \
--server agent.ixia-sandbox.cloud \
--accept_eula y \
--apikey s1CUSM61Wny4G8u6sRUztH4T7N0h76o0853OLPUtO \
--custom_tags CloudServiceProvider=Azure
