# Network Troubleshooting and Penetration Testing Environment

This Docker environment is tailored for network troubleshooting and penetration testing, specifically for REST APIs and websites. It is based on Debian 12 (Bookworm) and includes a wide range of command-line tools to assist developers and security professionals.

## Tools Included

- **Network Tools**

  - `curl`: Command line tool and library for transferring data with URLs.
  - `wget`: Free utility for non-interactive download of files from the web.
  - `net-tools`: Collection of programs for controlling the network subsystem of the Linux kernel.
  - `iputils-ping`: Tools to test the reachability of network hosts.
  - `traceroute`: Traces the route packets take to a network host.
  - `dnsutils`: Utilities for DNS testing such as `dig`.
  - `tcpdump`: Command-line packet analyzer.
  - `nmap`: Network discovery and security auditing tool.
  - `httpie`: User-friendly HTTP client.
  - `telnet`: User interface to the TELNET protocol.
  - `openssl`: Toolkit for the Transport Layer Security (TLS) and Secure Sockets Layer (SSL) protocols.
  - `iperf3`: Network bandwidth measurement tool.
  - `socat`: Multipurpose relay for bidirectional data transfer.
  - `netcat`: Networking utility for reading from and writing to network connections.
  - `tshark`: Network protocol analyzer.
  - `locust.io`: Locust.io is an open-source load testing tool designed to evaluate the performance of web applications and RESTful APIs under stress. It allows users to write test scenarios in Python, enabling highly customizable and scriptable user behavior simulations. Users can start load tests via a web interface or the command line, making it versatile for both development and continuous integration environments. Locust supports scaling with distributed testing, making it suitable for testing large-scale systems capable of handling thousands to millions of simultaneous users. Its lightweight nature and user-friendly design make it a preferred choice for developers and testers aiming to identify bottlenecks and improve the performance of their applications.

- **Penetration Testing Tools**
  - `nikto`: Web server scanner which performs comprehensive tests against web servers.
  - `sqlmap`: Automatic SQL injection and database takeover tool.
  - `owasp-zap`: OWASP ZED Attack Proxy for finding vulnerabilities in web applications.

## Installation

1. Clone the repository or download the Dockerfile:

- `git clone <repository-url>`
- `cd <repository-directory>`

2. Build the Docker image:

- `docker build -t netty .`

3. Run the Docker container:

- `docker run -it netty`

## Example Commands per package

**curl** :`curl https://example.com`

**wget** :`wget https://example.com/file`

**traceroute** :`traceroute example.com`

**dig (from dnsutils)** : `dig example.com`

**tcpdump** : `tcpdump -i eth0`

**nmap** : `nmap -v -A example.com``

**httpie** : `http https://api.example.com`

**nikto** : nikto -h http://example.com

**sqlmap** : sqlmap -u http://example.com/index.php?id=1 --batch

### **owasp-zap**

`zap-cli start`

`zap-cli open-url http://example.com`

`zap-cli active-scan http://example.com`

`zap-cli report -o report.html`

### **locust.io**

mounted in the compose-file,
usage example inside the container.
`locust -f /opt/locust/example_locust.py --host=http://target.website.com --web-host=0.0.0.0`

## Networking with Docker Compose

Refer to the provided `docker-compose.yml` for configuring custom networks and running the container with specific network settings, this can be used
when running it internally and want to have access to other docker networks.

## Contribution

Feel free to contribute to this repository by submitting pull requests or by reporting bugs and issues.
