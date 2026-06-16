# Pi-Hole configuration

Pi-Hole is used as the DNS Ad-blocker & DHCP Server because my ISP router DNS option isn't modifiable.

### Install configuration

Installed with the [official Docker compose service](https://github.com/pi-hole/docker-pi-hole/#quick-start). *Last accessed: 11/06/2026.*

### Network

**Fixed IP**: 192.168.1.254

UI is accessible through HTTP and not HTTPS because it should not never leave the LAN without proper encrypted encapsulation via tunnel.

### Configuration

#### DHCP

#### DNS Lists

#### Other options