#!/usr/bin/env bash
sudo apt update -y
java -version 
sudo apt install default-jre -y 
java -version
sudo apt install default-jdk -y
javac -version
sudo apt update -y
sudo apt install redis-server -y
sudo apt-get install curl -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y
nodejs -v
npm -v
sudo git clone https://github.com/eric010101/LAMP2021 /root/LAMP2021/
sudo cp /root/LAMP2021/lamp2021.sh /root/lamp2021.sh
sudo chmod +x lamp2021.sh
sudo sh lamp2021.sh
sudo apt install apt-transport-https -y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update -y
sudo apt install elasticsearch -y
apt  install docker-compose -y
git clone https://github.com/jetlinks/jetlinks-community.git
sudo python3 dockerfile.py
cd jetlinks-community/docker/run-all
docker-compose up
