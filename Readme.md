# DigitalOcean FreeBSD Droplet Setup
[![Updated Badge](https://badges.pufler.dev/updated/aesycos/FreeBSD-Server)](ttps://badges.pufler.dev)

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
