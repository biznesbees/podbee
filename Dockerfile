FROM python:3.11.9-slim

WORKDIR /podbee/

RUN apt update && apt install -y curl wireshark tcpdump nmap iputils-ping traceroute iftop mtr iperf dnsutils telnet

COPY . .

RUN pip install -r requirements.txt

CMD uvicorn server:app --host 0.0.0.0 --port 80
