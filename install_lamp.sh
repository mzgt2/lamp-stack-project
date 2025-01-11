#!/bin/bash


# Update the system 
echo "Installing the system..."
sudo apt update -y || sudo dnf update -y

# Install Apache
echo "Installing Apache..."
sudo apt install -y apache2 || sudo dnf install -y httpd
sudo systemctl start apache2 || sudo systemctl start httpd
sudo systemctl enable apache2 || sudo systemctl enable httpd

# Install MySQL
echo "Installing MySQL..."
sudo apt install -y mysql-server || sudo dnf install -y mariadb-server
sudo systemctl start mysql || sudo systemctl start mariadb
sudo systemctl enable mysql || sudo systemctl enable mariadb

# Install PHP
echo "Installing PHP..."
sudo apt install -y php php-cli php-pdo php-mysqlnd php-json php-xml php-mbstring php-curl libapache2-mod-php || \
sudo dnf install -y php php-cli php-pdo php-mysqlnd php-json php-xml php-mbstring php-curl

echo "LAMP stack installed successfully!"
