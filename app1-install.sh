#! /bin/bash
sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
sudo echo '<h1>Keiths Assignment for DPG</h1>' | sudo tee /var/www/html/index.html
sudo echo '<h1>Keiths Assignment for DPG & my Hostname is</h1>' \"$(hostname)\" | sudo tee /var/www/html/index.html
sudo mkdir /var/www/html/app1


