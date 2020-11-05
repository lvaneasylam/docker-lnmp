FROM nginx
MAINTAINER C_Hiang(base on laradock)


RUN apt-get update \
    && apt-get install -y logrotate \
    && apt-get install -y openssl \
    && apt-get install -y bash cron vim

RUN apt-get install -y curl

RUN set -x ; \
    groupadd -g 82 www-data ; \
    adduser www-data www-data && exit 0 ; exit 1

ARG PHP_UPSTREAM_CONTAINER=php-fpm
ARG PHP_UPSTREAM_PORT=9000

COPY ssl /etc/nginx/ssl/

# Create 'messages' file used from 'logrotate'
RUN touch /var/log/messages

# Copy 'logrotate' config file
COPY logrotate/nginx /etc/logrotate.d/

# Set upstream conf and remove the default conf
#RUN echo "upstream php-upstream { server ${PHP_UPSTREAM_CONTAINER}:${PHP_UPSTREAM_PORT}; }" > /etc/nginx/conf.d/upstream.conf \
#    && rm /etc/nginx/conf.d/default.conf

ADD ./startup.sh /opt/startup.sh
RUN sed -i 's/\r//g' /opt/startup.sh
CMD ["/bin/bash", "/opt/startup.sh"]

EXPOSE 80 443