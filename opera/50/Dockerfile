FROM debian:buster

RUN echo "deb http://deb.debian.org/debian/ stretch main" | tee /etc/apt/sources.list.d/debian-stretch.list
RUN apt update -y
RUN apt install openssh-server xauth nano wget dbus-x11 libexif12 -y

RUN (echo "") | ssh-keygen
EXPOSE 22

RUN IP=$(hostname -i)
RUN mkdir /run/sshd
RUN echo 'root:qaz' | chpasswd

#Enable root login via SSH
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

#install chrome
RUN wget https://ftp.opera.com/pub/opera/desktop/50.0.2762.67/linux/opera-stable_50.0.2762.67_amd64.deb -O opera.deb
RUN dpkg -i opera.deb || apt -f install -y
#RUN apt install rpl -y
RUN apt install libgl1 -y
CMD echo "IP for SSH connetion:\t$(hostname -i)\n\nPassword: qaz"; opera --no-sandbox & /usr/sbin/sshd -D
