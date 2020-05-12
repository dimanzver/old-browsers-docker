# Browser over SSH
#
# VERSION               0.1
# Supports Firefox, Google Chrome, and Flash
# Run with: docker run -rm -t -i magglass1/docker-browser-over-ssh

FROM fedora

# Install updates and required base packages
RUN yum update -y
RUN yum install wget -y
RUN yum groupinstall fonts -y
RUN yum install nano -y
# Install Adobe repository
#RUN yum install http://linuxdownload.adobe.com/adobe-release/adobe-release-x86_64-1.0-1.noarch.rpm -y
#RUN rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux

# Install Google Chrome repository
#ADD google-chrome.repo /etc/yum.repos.d/ 
#RUN wget -q https://dl-ssl.google.com/linux/linux_signing_key.pub
#RUN rpm --import linux_signing_key.pub
#RUN rm linux_signing_key.pub

# Install Firefox, Chrome, SSHD, and other required packages
RUN yum install openssh-server xorg-x11-xauth -y
RUN yum install net-tools -y
# Initialize SSHD and create the webuser user
#RUN sudo service sshd start
#RUN ssh-keygen
#RUN (echo "") | ssh-keygen
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key
RUN useradd webuser

RUN wget https://ftp.opera.com/pub/opera/desktop/35.0.2066.82/linux/opera-stable_35.0.2066.82_amd64.rpm -O opera.rpm
RUN dnf localinstall opera.rpm -y
RUN yum install passwd -y
RUN yum install hostname -y
RUN echo qaz | passwd --stdin webuser > /dev/null; 
RUN echo qaz | passwd --stdin root > /dev/null;
#RUN echo 'root:qaz' | chpasswd
RUN yum install mesa-libGL -y
RUN yum install glib* -y

RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config
RUN echo "X11UseLocalhost no" >> /etc/ssh/sshd_config
RUN echo 'root:qaz' | chpasswd
RUN yum install dbus-x11 -y
EXPOSE 22
CMD echo -n "Initializing..."; IP=$(hostname -i); /usr/sbin/sshd -D

