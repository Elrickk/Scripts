# Download metasploit :

curl https://github.com/rapid7/metasploit-omnibus/blob/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall

# Once the script is downloaded, make it executable :
chmod +x msfinstall

#Then execute the installer to install Metasploit Framework on Debian 10/9 :
./msfinstall

# Check your Framework version using :
msfconsole --version

# When installation is completed, create and initialize the msf database :
msfdb init

# This will create an initial database schema, set service account and start services. Output similar to below should be printed.

# Now  that database is initialized, you can launch :
msfconsole

# Updating Metasploit framework :
msfupdate
