FROM debian:stable-slim

RUN apt update && apt install -y \
    curl \
    wireshark \ 
    tcpdump \
    nmap \
    iputils-ping \
    traceroute \
    iftop \
    mtr \
    iperf \
    dnsutils \
    telnet \
    && rm -rf /var/lib/apt/lists/*
