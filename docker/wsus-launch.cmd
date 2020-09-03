FROM r0gger/docker-wsusoffline
RUN APT install apache2 -y
COPY index.html /var/www/html/
EXPOSE 80
