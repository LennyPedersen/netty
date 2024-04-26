FROM debian:bookworm-slim
ENV DEBIAN_FRONTEND=noninteractive

# Install necessary packages from Debian repos
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    curl \
    wget \
    net-tools \
    iputils-ping \
    traceroute \
    dnsutils \
    tcpdump \
    nmap \
    httpie \
    telnet \
    openssl \
    iperf3 \
    socat \
    netcat-openbsd \
    tshark \
    mtr \
    iftop \
    ngrep \
    ethtool \
    vim \
    sqlmap \
    unzip \
    git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set up a Python virtual environment
RUN python3 -m venv /opt/venv

# Install Python packages within the virtual environment
ENV PATH="/opt/venv/bin:$PATH"
RUN pip install --upgrade pip
RUN pip install locust

COPY locust/example_locust.py /opt/locust/

# Install Nikto from official GitHub repository
RUN wget https://github.com/sullo/nikto/archive/master.zip -O /tmp/nikto.zip \
    && unzip /tmp/nikto.zip -d /opt/ \
    && mv /opt/nikto-master /opt/nikto \
    && rm /tmp/nikto.zip \
    && ln -s /opt/nikto/program/nikto.pl /usr/local/bin/nikto

COPY locust/example_locust.py /opt/locust/

# Install OWASP ZAP, ensuring cleanup to minimize image size
RUN wget https://github.com/zaproxy/zaproxy/releases/download/v2.14.0/ZAP_2.14.0_Linux.tar.gz -O /tmp/zap.tar.gz \
    && tar -zxvf /tmp/zap.tar.gz -C /opt \
    && rm /tmp/zap.tar.gz

CMD ["bash"]
