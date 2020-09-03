FROM r0gger/docker-wsusoffline
RUN apt update
RUN apt install apache2 -y
WORKDIR /wsus
COPY 000-default.conf /etc/apache2/sites-enabled
COPY .htaccess /wsus/wsusoffline/client
COPY fqdn.conf /etc/apache2/conf-enabled/
CMD apachectl -D FOREGROUND
EXPOSE 80
