# Puppet Server Config for PHPUG.SG server

## Setup Puppet Server

```
sudo rpm -ivh http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
sudo yum install -y puppet puppet-server
sudo puppet resource service puppet ensure=running enable=true
sudo puppet resource service puppetserver ensure=running enable=true
puppet module install puppetlabs/apache
puppet module install thias/php
puppet module install willdurand/composer
puppet module install puppetlabs/mysql
```

## Installation on Ubuntu
1. To enable the repository for Ubuntu 14.04 Trusty Tahr:

	```
wget https://apt.puppetlabs.com/puppetlabs-release-trusty.deb
sudo dpkg -i puppetlabs-release-trusty.deb
sudo apt-get update
```

2. Install Puppet Master

	```
apt-get install puppetserver
```

3. Start the service

	```
service puppetserver start
```

4. Take note of memory allocation - Puppet server uses 2GB of RAM by default. To change that setting, edit `/etc/sysconfig/puppetserver` and modify:

	```
# Modify this if you'd like to change the memory allocation, enable JMX, etc
JAVA_ARGS="-Xms2g -Xmx2g"
```

	For 1GB: `JAVA_ARGS="-Xms1g -Xmx1g"`
	
Source: [https://github.com/puppetlabs/puppet-server/blob/master/documentation/install_from_packages.markdown](https://github.com/puppetlabs/puppet-server/blob/master/documentation/install_from_packages.markdown)

