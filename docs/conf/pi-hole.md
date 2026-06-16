# Pi-Hole configuration

Pi-Hole is used as the DNS Ad-blocker & DHCP Server because my ISP router DNS option isn't modifiable.

### Install configuration

Installed with the [official Docker compose service](https://github.com/pi-hole/docker-pi-hole/#quick-start). *Last accessed: 11/06/2026.*

### Network

**Fixed IP**: 192.168.1.254

UI is accessible through HTTP and not HTTPS because it should not never leave the LAN without proper encrypted encapsulation via tunnel.

### Configuration

#### DHCP

Range: 192.168.1.100 to 192.168.1.200
Netmask: 255.255.255.0 automatic
Gateway: 192.168.1.1 (ISP hardcoded)
Lease time: 1w

[x] Enable DHCPv4 rapid commit
[x] Enable additional IPv6 support for SLAAC + RA

#### DNS

Upstream DNS Servers :
- IPv4: Google, Cloudflare
- IPv6: Google, Cloudflare

[x] Use DNSSEC

# Ad-blocking lists

Chosen from [StevenBlack/hosts as raw github link](https://github.com/StevenBlack/hosts)