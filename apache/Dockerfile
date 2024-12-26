FROM php:8.4-rc-apache

COPY apache2.conf /etc/apache2/sites-available/000-default.conf
COPY info.php /var/www/html/
#COPY ports.conf.template /etc/apache2/

RUN apt-get update && apt-get install -y gettext-base && a2enmod php && a2ensite 000-default.conf

#CMD ["/bin/sh", "-c", "envsubst < /etc/apache2/ports.conf.template > /etc/apache2/ports.conf && apache2ctl -D FOREGROUND"]
CMD ["/bin/sh", "-c", "apache2ctl -D FOREGROUND"]
