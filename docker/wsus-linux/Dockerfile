FROM r0gger/docker-wsusoffline
RUN apt update
RUN apt install apache2 -y
WORKDIR /wsus
COPY start_web.sh /wsus/
COPY run.sh /wsus/
RUN chmod 755 start_web.sh
RUN chmod 755 run.sh
COPY 000-default.conf /etc/apache2/sites-enabled
COPY .htaccess /wsus/wsusoffline/client
COPY fqdn.conf /etc/apache2/conf-enabled/
EXPOSE 80
