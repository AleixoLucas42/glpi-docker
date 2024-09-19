FROM ubuntu:22.04

WORKDIR /opt/glpi
ENV GLPI_VERSION=10.0.16
ENV PHP_VERSION=8.1

# Avoid interactive shell
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Dependencies
RUN apt update && apt -y install php wget curl
COPY requirements.txt .
RUN while read dep; do apt install -y php-${dep}; done < requirements.txt
RUN apt -y install apache2 libapache2-mod-php

# Apache config
RUN sed -i '/session.cookie_httponly/d' /etc/php/*/apache2/php.ini
RUN echo "session.cookie_httponly = on" >> /etc/php/$PHP_VERSION/apache2/php.ini
RUN sed -i 's|DocumentRoot /var/www/html|DocumentRoot /var/www/html/glpi|' /etc/apache2/sites-available/000-default.conf

# Install GLPI
RUN wget https://github.com/glpi-project/glpi/releases/download/$GLPI_VERSION/glpi-$GLPI_VERSION.tgz
RUN tar xvf glpi-$GLPI_VERSION.tgz
RUN mv glpi /var/www/html/
RUN chown -R www-data:www-data /var/www/html/

CMD ["bash", "-c", "chown www-data:www-data -R /var/www/html/ && /usr/sbin/apache2ctl -D FOREGROUND"]