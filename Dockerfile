FROM debian:stable-slim

RUN apt-get update && \
apt-get install -y --force-yes gnupg && \
gpg --keyserver http://keys.gnupg.net --recv-key 7D8D0BF6 && \ 
gpg -a --export 7D8D0BF6 | apt-key add - && \
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list && \
apt-get update && \
apt-get install -y --force-yes ruby metasploit-framework && \
apt-get autoclean

EXPOSE 4444 444

ENTRYPOINT msfconsole