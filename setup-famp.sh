# Configure basic firewall
################################################################################

# Enable ipfw firewall
sudo sysrc firewall_enable="YES"

# Don't output to stdout
sudo sysrc firewall_quiet="YES"

# Use stateful rules
sudo sysrc firewall_type="workstation"

# Open ports for services
sudo sysrc firewall_myservices="22/tcp 80/tcp 443/tcp"

# Make services publicaly available
sudo sysrc firewall_allowservices="any"

# Log all denied attempts to connect
sudo sysrc firewall_logdeny="YES"

# Start firewall
sudo service ipfw start

# Limit logging
echo "\n# Limit logging\nnet.inet.ip.fw.verbose_limit=5" >> /etc/sysctl.conf

# Apply rule to current session
sudo sysctl net.inet.ip.fw.verbose_limit=5


# Setup NTP
################################################################################

sudo sysrc ntpd_enable="YES"
sudo sysrc ntpd_sync_on_start="YES"

# Start service
sudo service ntpd start


# Setup swapfile
################################################################################

# Create swapfile
sudo truncate -s 4G /var/swapfile

# Edit swapfile permissions
sudo chmod 0600 /var/swapfile

# Add swapfile to filesystem table
echo "md99 none swap sw,file=/var/swapfile,late 0 0" | sudo tee -a /etc/fstab

# Activate swap
sudo swapon -aqL


# Install Apache
################################################################################

sudo pkg install apache24

# Enable Apache service
sudo sysrc apache24_enable="YES"

# Start Apache service
sudo service apache24 start
sudo service apache24 status


# Install MySQL
################################################################################

sudo pkg install mysql80-server

# Enable service
sudo sysrc mysql_enable="YES"

# Start service
sudo service mysql-server start
sudo service mysql-server status

# Finish Install
sudo mysql_secure_installation


# Install PHP
################################################################################

sudo pkg install php73 php73-mysqli mod_php73

# Copy php config
sudo cp /usr/local/etc/php.ini-production /usr/local/etc/php.ini

# Regenerate the system’s cached information
rehash

# Configure

sudo tee -a /usr/local/etc/apache24/modules.d/001_mod-php.conf > /dev/null <<EOF
<IfModule dir_module>
    DirectoryIndex index.php index.html
    <FilesMatch "\.php$">
        SetHandler application/x-httpd-php
    </FilesMatch>
    <FilesMatch "\.phps$">
        SetHandler application/x-httpd-php-source
    </FilesMatch>
</IfModule>
EOF

# Test & Restart Apache
sudo apachectl configtest
sudo apachectl restart

echo "<?php phpinfo(); ?>" | sudo tee -a /usr/local/www/apache24/data/info.php > /dev/null
