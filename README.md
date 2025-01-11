# LAMP Stack Installation Project

## Overview 
This project demonstrates the installation and configuration of a LAMP stack (Linux, Apache, MySQL PHP) on a Linux server.
It includes hosting a basic PHP page, connecting to a MySQL database, and troubleshooting common issues.


## Components
1. **Linux**: Operating system for hosting the stack.
2. **Apache**: Web server to serve PHP files.
3. **MySQL**: Database management system for data storage.
4. **PHP**: Server-side scripting language for dynamic content.


## Scripts

1. **'install_lamp.sh'**
   Automates the installation and setup of the LAMP stack components.

## How to Use

### 1. Run the Installation Script
chmod +x install_lamp.sh
./install_lamp.sh

## Configuration 

### 1. Verify Apachue

    **Open your browser and visit**:
    http://localhost

    -You should see the Apache welcome page

### 2. Test PHP
    
    1. **Create a PHP info file**:
       echo "<?php phpinfo(); ?>" | sudo tee /var/www/html/info.php

    2. **Visit**:
       http://localhost/info.php

    3. **After confirming PHP works, remove the file**:
       sudo rm /var/www/html/info.php

### 3. Set Up MySQL

    1. **Secure the MariaDB installation**:
       sudo mysql_secure_installation
       
      -Follow the prompts to set a root password and secure the database.

    2. **Log in to MySQL**:
       sudo mysql -u root -p
  
    3. **Create a test database**:
       CREATE DATABASE testdb;
       CREATE TABLE testdb.test_table (id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(50));
       INSERT INTO testdb.test_table (name) VALUES ('Hello World');
       SELECT * FROM testdb.test_table;
       EXIT;

### 4. Test Database Connection

    1. **Create a PHP file to test the connection**:
       sudo vim /var/www/html/test_db.php

    2. **Add the following content**:
       <?php
       error_reporting(E_ALL);
       ini_set('display_errors', 1);
       $conn = new mysqli('localhost', 'root', 'your_root-password', 'testdb');
       if ($conn->connect_error) {
           die("Connection failed: " . $conn->connect_error);
       }
       echo "Connected successfully to the database!";
       ?>

     3. **Visit**:
        http://localhost/test_db.php

     4. **After verifying, remove the file**:
        sudo rm /var/www/html/test_db.php

## Troubleshooting

###     1. Apache Not Working
        **Ensure the service is running**:
        sudo systemctl start httpd

###     2. PHP Not Executing
        **Check if PHP is installed and the Apache PHP module is loaded**:
        sudo dnf install php libapache2-mod-php
        sudo systemctl restart httpd

###     3. Database Connection Issues
        **Ensure MySQL/MariaDB is running**:
        sudo systemctl start mariadb

        **Update the root authentication method**:
        ALTER USER 'root'@'localhost' IDENTIFIED BY 'your_root_password';

###     4. Blank pages
        **Enable PHP error reporting in the script**:
        error_reporting(E_ALL);
        ini_set('display_errors', 1);

## Learning Outcomes

- Installed and configured a fully functional LAMP stack.
- Connected PHP to MySQL/MariaDB databases.
- Debugged and resolved common server-side issues. 
       
