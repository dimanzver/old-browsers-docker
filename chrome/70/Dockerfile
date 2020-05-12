FROM debian:buster

RUN apt update -y
RUN apt install openssh-server xauth -y

RUN (echo "") | ssh-keygen
RUN apt install nano -y
EXPOSE 22

RUN IP=$(hostname -i)
RUN mkdir /run/sshd
RUN echo 'root:qaz' | chpasswd
#Enable root login via SSH
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

#install chrome
RUN apt install wget -y
RUN apt install dbus-x11 libexif12
RUN wget https://www.slimjet.com/chrome/download-chrome.php?file=files%2F70.0.3538.77%2Fgoogle-chrome-stable_current_amd64.deb -O chrome.deb
#RUN apt install gdebi -y
#RUN gdebi chrome.deb
RUN dpkg -i chrome.deb || apt -f install -y

CMD echo -e "IP address for SSH connetion:\t$(hostname -i)\n\nPassword: qaz"; google-chrome --no-sandbox & /usr/sbin/sshd -D
