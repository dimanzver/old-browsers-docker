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
RUN wget https://mirror.yandex.ru/debian/pool/main/f/firefox-esr/firefox-esr-l10n-en-gb_52.8.1esr-1~deb8u1_all.deb -O firefox.deb
RUN dpkg -i firefox.deb || apt -f install -y
#RUN apt install rpl -y

#install lins for firefox
RUN apt install libgtk-3-0 libx11-xcb1 libdbus-glib-1-2 libxt6 -y
RUN apt install libasound2 -y
CMD firefox --preferences; SETTINGS_DIR=$(ls ~/.mozilla/firefox | grep default-release); echo 'user_pref("browser.tabs.remote.autostart", false);\nuser_pref("browser.tabs.remote.autostart.2", false);' >> ~/.mozilla/firefox/$SETTINGS_DIR/prefs.js; echo -e "IP address for SSH connetion:\t$(hostname -i)\n\nPassword: qaz"; firefox --safe-mode & /usr/sbin/sshd -D
