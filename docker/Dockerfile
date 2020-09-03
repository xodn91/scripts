FROM r0gger/docker-wsusoffline
RUN apt update
RUN apt install apache2 -y
COPY 000-default.conf /etc/apache2/sites-enabled
COPY .htaccess /wsus/wsusoffline/client
RUN /etc/init.d/apache2 start
EXPOSE 80
