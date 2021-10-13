#!/bin/bash
sudo su
yum -y install httpd
yum -y install git
echo "<p> Dynamic Instance Created !!! </p>" >> /var/www/html/index.html
sudo systemctl enable httpd
sudo systemctl start httpd
sudo git clone https://github.com/vinay93avk/NMGtestapp.git /var/www/html/webapp
ip4=$(hostname -i)
echo "$ip4   test1.foo.io" | sudo tee -a /etc/hosts
echo "$ip4   test2.foo.io" | sudo tee -a /etc/hosts
sudo touch /etc/httpd/conf.d/sites_available.conf
echo -e "<VirtualHost *:80> \n ServerName test1.foo.io \n	ServerAlias test1.foo.io \n	Serveradmin root@$ip4 \n	DocumentRoot  /var/www/html/webapp/test1 \n	ErrorLog /var/www/html/webapp/test1/error.log \n	CustomLog /var/www/html/webapp/test1/access.log combined \n </VirtualHost> \n <VirtualHost *:80> \n 	ServerName test2.foo.io \n 	ServerAlias test2.foo.io \n 	Serveradmin root@$ip4 \n 	DocumentRoot  /var/www/html/webapp/test2 \n 	ErrorLog /var/www/html/webapp/test2/error.log  \n 	CustomLog /var/www/html/webapp/test2/access.log combined \n </VirtualHost> " | sudo tee -a /etc/httpd/conf.d/sites_available.conf
sudo systemctl restart httpd