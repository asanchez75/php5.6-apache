FROM ubuntu:latest
MAINTAINER Michael COULLERET <michael@coulleret.pro>

RUN apt-get update

# Install Apache
RUN apt-get install -y apache2 git

RUN export LANG=C.UTF-8 && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:nginx/stable && \
    LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y && \
    apt-get update

# Install PHP
RUN apt-get install -y php5.6 php5.6-cli php5.6-readline php5.6-intl php5.6-cli php5.6-json php5.6-mongo php5.6-mysql php5.6-curl php5.6-dev php5.6-xdebug php5.6-mbstring php5.6-dom

# Install expect
RUN apt-get install -y expect

# Add template
ADD ./template/apache2.conf /etc/apache2/apache2.conf
ADD ./template/symfony.conf /etc/apache2/sites-available/symfony.conf
ADD ./template/php.ini /etc/php5/apache2/
ADD ./template/mongo.ini /usr/local/etc/php/conf.d/

# Add composer
RUN cd /usr/local/bin && curl -sS https://getcomposer.org/installer | php -- --filename=composer

# a2enmod & a2ensite
RUN a2enmod php5.6
RUN a2enmod rewrite
RUN a2ensite symfony.conf

RUN mkdir -p /vhost/current/
VOLUME /vhost/current/
RUN usermod -u 1000 www-data
RUN chown -R www-data:www-data /vhost/current/

RUN sed -i "s/;date.timezone =.*/date.timezone = Europe\/Paris/" /etc/php5/apache2/php.ini

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/apache2/symfony_access.log
RUN ln -sf /dev/stderr /var/log/apache2/symfony_error.log

# Port
EXPOSE 80

ADD bootstrap.sh /bootstrap.sh
RUN chmod 755 /bootstrap.sh
CMD ["/bootstrap.sh"]
