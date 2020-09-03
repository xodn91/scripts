FROM r0gger/docker-wsusoffline
RUN apt update
RUN apt install apache2 -y
WORKDIR /wsus
COPY 000-default.conf /etc/apache2/sites-enabled
COPY .htaccess /wsus/wsusoffline/client
COPY startweb.sh /wsus
RUN chmod +x startweb.sh
RUN startweb.sh
EXPOSE 80
