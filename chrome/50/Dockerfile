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
RUN wget https://www.slimjet.com/chrome/download-chrome.php?file=lnx%2Fchrome64_50.0.2661.75.deb -O chrome.deb
RUN dpkg -i chrome.deb || apt -f install -y
#RUN apt install rpl -y

#CMD echo -e "IP address for SSH connetion:\t$(hostname -i)\n\nPassword: qaz";sed -i -e 's/\"\$HERE\/chrome\"  \"\$\@\"/"$HERE\/chrome" --user-data-dir="$HOME" "$@"/g' /usr/bin/google-chrome; google-chrome --no-sandbox & /usr/sbin/sshd -D
CMD echo -e "IP address for SSH connetion:\t$(hostname -i)\n\nPassword: qaz"; google-chrome --no-sandbox --user-data-dir & /usr/sbin/sshd -D
