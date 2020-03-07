
apt-get update
apt-get install -y autoconf gcc libc6 make wget unzip apache2 apache2-utils php libgd-dev


# Downloading the Source :

cd /tmp
wget -O nagioscore.tar.gz https://github.com/NagiosEnterprises/nagioscore/archive/nagios-4.4.5.tar.gz
tar xzf nagioscore.tar.gz


# Compile :

cd /tmp/nagioscore-nagios-4.4.5/
./configure --with-httpd-conf=/etc/apache2/sites-enabled
make all



# Create User And Group :

# This creates the nagios user and group. The www-data user is also added to the nagios group.

make install-groups-users
usermod -a -G nagios www-data


# Install Binaries :

# This step installs the binary files, CGIs, and HTML files.

make install



# Install Service / Daemon :

# This installs the service or daemon files and also configures them to start on boot.

make install-daemoninit


# Install Command Mode :

# This installs and configures the external command file.

make install-commandmode


# Install Configuration Files :

# This installs the *SAMPLE* configuration files. These are required as Nagios needs some configuration files to allow it to start.

make install-config



# Install Apache Config Files :

# This installs the Apache web server configuration files and configures the Apache settings.

make install-webconf
a2enmod rewrite
a2enmod cgi

 
# Configure Firewall :

# You need to allow port 80 inbound traffic on the local firewall so you can reach the Nagios Core web interface.

iptables -I INPUT -p tcp --destination-port 80 -j ACCEPT
apt-get install -y iptables-persistent

# Answer yes to saving existing rules

 
# Create nagiosadmin User Account :

# You'll need to create an Apache user account to be able to log into Nagios.

# The following command will create a user account called nagiosadmin and you will be prompted to provide a password for the account.

htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin


# Restart Apache :

systemctl restart apache2.service


# Installing The Nagios Plugins :

# Prerequisites :

# Make sure that you have the following packages installed.

apt-get install -y autoconf gcc libc6 libmcrypt-dev make libssl-dev wget bc gawk dc build-essential snmp libnet-snmp-perl gettext

 
# Downloading The Source :

cd /tmp
wget --no-check-certificate -O nagios-plugins.tar.gz https://github.com/nagios-plugins/nagios-plugins/archive/release-2.2.1.tar.gz
tar zxf nagios-plugins.tar.gz


# Compile + Install :

cd /tmp/nagios-plugins-release-2.2.1/
./tools/setup
./configure
make
make install


systemctl restart nagios


# Check Config for errors :

/usr/local/nagios/bin/nagios -v /usr/local/nagios/etc/nagios.cfg
