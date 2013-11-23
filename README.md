# Puppet Server Config for PHPUG.SG server

## Setup Puppet Server

```
sudo rpm -ivh http://yum.puppetlabs.com/el/6/products/x86_64/puppetlabs-release-6-7.noarch.rpm
sudo yum install -y puppet puppet-server
sudo puppet resource service puppet ensure=running enable=true
sudo puppet resource service puppetmaster ensure=running enable=true
puppet module install puppetlabs/apache
```
