#!/usr/bin/env bash

# 安裝jetlinks的程序如下:

# JDK 1.8.0_2xx (需要小版本号大于200) 下载jdk(opens new window)
# Redis 5.x
# PostgreSQL 11 或者 mysql 5.7 +
# ElasticSearch 6.8 + 下载 (opens new window),也可以直接使用内嵌ElasticSearch.

# ================================
# 安裝 JRD JDK  redis-server nodejs npm git
# ================================
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
sudo apt-get install git -y
# ================================
# 開始下載LAMP 並安裝
# ================================
#sudo git clone https://github.com/eric010101/LAMP2021 /root/LAMP2021/
sudo git clone https://gitee.com/eric010101/LAMP2021.git /root/LAMP2021/
sudo cp /root/LAMP2021/lamp2021.sh /root/lamp2021.sh
sudo cp /root/LAMP2021/dockerfile.py /root/dockerfile.py
sudo chmod +x lamp2021.sh
sudo sh lamp2021.sh

# ================================
# 開始下載elasticsearch docker-compose 並安裝
# ================================

sudo apt install apt-transport-https -y
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
sudo apt update -y
sudo apt install elasticsearch -y
apt  install docker-compose -y

# ================================
# 開始下載jetlinks-community 但不先安裝
# ================================

git clone https://github.com/jetlinks/jetlinks-community.git

# ================================
# 開始下載postgresql-client 並安裝
# 版本不合問題，要先移除 client10版本，然後裝12版，不然pgadmin4 無法使用pg_dump 功能，
# ================================
# Create the file repository configuration:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
# Update the package lists:
sudo apt-get update -y
# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt-get remove postgresql-client-10 -y
sudo apt-get -y install postgresql-client-12 -y

# ================================
# 開始pg_dump 安裝
# ================================
sudo ln -s /usr/lib/postgresql/12/bin/pg_dump /usr/bin/pg_dump --force
#
# Setup the repository
#
# Install the public key for the repository (if not done previously):
sudo curl https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo apt-key add
# Create the repository configuration file:
sudo sh -c 'echo "deb https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
#
# Install pgAdmin
#
# Install for both desktop and web modes:
sudo apt install pgadmin4 -y
# Configure the webserver, if you installed pgadmin4-web:
sudo cp /root/LAMP2021/pgadmin4_install.pl /root/pgadmin4_install.pl
sudo chmod +x pgadmin4_install.pl
sudo expect /root/pgadmin4_install.pl >> pgadmin4_install.log
#sudo /usr/pgadmin4/bin/setup-web.sh
# ================================
# 開始更新參數檔案，安裝php7.4-pgsql 介面
# ================================
sudo cp /root/LAMP2021/jetlinkdbtest.php /var/www/html/jetlinkdbtest.php
sudo apt install php7.4-pgsql -y
sudo python3 dockerfile.py
systemctl restart apache2
# ================================
# 開始啟動jetlink 介面
# ================================
cd jetlinks-community/docker/run-all
docker-compose up

