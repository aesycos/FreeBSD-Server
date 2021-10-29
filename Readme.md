# DigitalOcean FreeBSD Droplet Setup
[![Updated Badge](https://badges.pufler.dev/updated/aesycos/FreeBSD-Server)](#)

## Files
|  Filename      | Description                                                               |
|----------------|---------------------------------------------------------------------------|
|  `Readme.md`   | This readme file                                                          |
| `setup-famp.sh`| A simple script to setup a basic environment for server with a FAMP stack |


## `setup-famp.sh`

### Post-Creation Steps

 - Setup **ipfw** firewall with stateful rules and sane logging
 - Setup **ntp** and timezone information
 - Add more swap space by creating a swapfile

### Setting up a FAMP

 - Install **Apache**
 - Install **MySQL**
 - Install **PHP**
 - Finish with a test page at **ServerRoot/info.php**
 

 ## Credits
 [How To Install an Apache, MySQL, and PHP (FAMP) Stack on FreeBSD 12.0](https://www.digitalocean.com/community/tutorials/how-to-install-an-apache-mysql-and-php-famp-stack-on-freebsd-12-0)
 [Recommended Steps For New FreeBSD 12.0 Servers](https://www.digitalocean.com/community/tutorials/recommended-steps-for-new-freebsd-12-0-servers)
