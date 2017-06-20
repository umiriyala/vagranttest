#!/bin/bash
echo 'starting provision web '$1
sudo yum update
sudo yum install nginx
echo"<h1> machine:web "$1"</h1>" >> /usr/share/ngnix/html/index.html
echo 'procivision web '$1 'complete '
