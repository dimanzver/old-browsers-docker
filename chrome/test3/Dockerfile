FROM fedora
# Install updates and required base packages
RUN yum update -y
RUN yum install wget -y
RUN yum groupinstall fonts -y
RUN yum install openssh-server xorg-x11-xauth pwgen -y

RUN sudo service sshd start
RUN ssh-keygen
RUN useradd webuser
RUN yum install nano -y
RUN chmod -c 774 /etc/hosts
RUN chown -c webuser:webuser /etc/hosts
EXPOSE 22

CMD echo -n "Initializing..."; IP=$(hostname -i); PW=$(pwgen -s 16 1); echo "$PW" | passwd --stdin webuser > /dev/null; echo -e "\r               \rIP address:\t$IP\nPassword:\t$PW\nFirefox:\tssh -X webuser@$IP firefox\nGoogle Chrome:\tssh -X webuser@$IP google-chrome --no-sandbox"; /usr/sbin/sshd -D
#CMD echo -n "Initializing..."; IP=$(hostname -i); PW=$(pwgen -s 16 1); echo "$PW" | passwd --stdin webuser > /dev/null; echo -e "\r               \rIP address:\t$IP\nPassword:\t$PW\n; /usr/sbin/sshd -D
