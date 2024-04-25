FROM ubuntu:latest
MAINTAINER vikashashoke@gmail.com

# Update package lists and install required packages
RUN apt-get update && \
    apt-get install -y apache2 \
                       unzip

# Download and unzip the app
ADD https://www.free-css.com/assets/files/free-css-templates/download/page295/antique-cafe.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip antique-cafe.zip && \
    mv antique-cafe/* . && \
    rm -rf antique-cafe antique-cafe.zip

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2ctl", "-D", "FOREGROUND"]
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
