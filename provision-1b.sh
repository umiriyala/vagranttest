#!/bin/bash
echo 'stating provision-1b for loadbalance'
sudo yum -y install epel-release
sudo yum -y install nginx
sudo systemctl stop nginx
sudo rm -rf /etc/nginx/sites-enabled/default
sudo touch /etc/nginx/sites-enabled/default
echo "upstream backend {
   server 10.0.0.11; 
   server 10.1.0.12;
   }

# This server accepts all traffic to port 80 and passes it to the upstream. 
# Notice that the upstream name and the proxy_pass need to match.

server {
   listen 80;
    
   root /usr/share/ngnix/html;
   index index.html index.htm;
   server_name localhost;
   
   location / {
      proxy_pass http://backend;
   }
}">> /etc/ngnix/sites-enabled/default
sudo systemctl start nginx
echo " machine lb1" >> /usr/share/ngnix/html/index.html
echo "provision lb1 complete"
