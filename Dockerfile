FROM centos:latest
MAINTAINER vikashashoke@gmail.com

# Use a specific CentOS mirror to avoid issues with the default mirror
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's/#baseurl/baseurl/g' /etc/yum.repos.d/CentOS-Base.repo && \
    sed -i 's/http:\/\/mirror.centos.org/https:\/\/mirrors.kernel.org/g' /etc/yum.repos.d/CentOS-Base.repo

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
