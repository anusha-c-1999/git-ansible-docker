FROM centos:latest
MAINTAINER vikashashoke@gmail.com

# Create CentOS repo directory and file
RUN mkdir -p /etc/yum.repos.d/ && \
    touch /etc/yum.repos.d/CentOS-Base.repo && \
    echo -e "[base]\nname=CentOS-\$releasever - Base\nbaseurl=https://mirrors.aliyun.com/centos/\$releasever/os/\$basearch/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial" > /etc/yum.repos.d/CentOS-Base.repo && \
    echo -e "\n[updates]\nname=CentOS-\$releasever - Updates\nbaseurl=https://mirrors.aliyun.com/centos/\$releasever/updates/\$basearch/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial" >> /etc/yum.repos.d/CentOS-Base.repo && \
    echo -e "\n[extras]\nname=CentOS-\$releasever - Extras\nbaseurl=https://mirrors.aliyun.com/centos/\$releasever/extras/\$basearch/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial" >> /etc/yum.repos.d/CentOS-Base.repo && \
    echo -e "\n[centosplus]\nname=CentOS-\$releasever - Plus\nbaseurl=https://mirrors.aliyun.com/centos/\$releasever/centosplus/\$basearch/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial" >> /etc/yum.repos.d/CentOS-Base.repo && \
    echo -e "\n[contrib]\nname=CentOS-\$releasever - Contrib\nbaseurl=https://mirrors.aliyun.com/centos/\$releasever/contrib/\$basearch/\ngpgcheck=1\ngpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial" >> /etc/yum.repos.d/CentOS-Base.repo

# Install Apache HTTP Server, zip, and unzip packages
RUN yum install -y httpd zip unzip

# Add the website content
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

WORKDIR /var/www/html/

RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Command to start Apache HTTP Server
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

# Expose port 80 to allow outside access to the container
EXPOSE 80
 
# FROM  centos:latest
# MAINTAINER vikashashoke@gmail.com
# RUN yum install -y httpd \
#  zip\
#  unzip
# ADD https://www.free-css.com/assets/files/free-css-templates/download/page265/shine.zip /var/www/html/
# WORKDIR /var/www/html/
# RUN unzip shine.zip
# RUN cp -rvf shine/* .
# RUN rm -rf shine shine.zip
# CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
# EXPOSE 80   
