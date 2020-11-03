FROM php:7.4-fpm
MAINTAINER C_Hiang
#替换阿里的DNS
RUN echo "nameserver 223.5.5.5" | tee /etc/resolv.conf > /dev/null
#备份源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak

#打印系统版本决定源
RUN cat /etc/issue
RUN cat /etc/apt/sources.list.bak

#替换国内源 (腾讯云)
RUN  echo "deb http://mirrors.cloud.tencent.com/debian/ buster main non-free contrib" > /etc/apt/sources.list
RUN  echo "deb http://mirrors.cloud.tencent.com/debian-security buster/updates main" >>/etc/apt/sources.list
RUN  echo "deb http://mirrors.cloud.tencent.com/debian/ buster-updates main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb http://mirrors.cloud.tencent.com/debian/ buster-backports main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.cloud.tencent.com/debian-security buster/updates main" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.cloud.tencent.com/debian/ buster main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.cloud.tencent.com/debian/ buster-updates main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.cloud.tencent.com/debian/ buster-backports main non-free contrib" >>/etc/apt/sources.list

RUN apt-get update -y && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libmemcached-dev zlib1g-dev \
    && pecl install redis-5.1.1 mongodb\
    && pecl install memcached-3.1.4\
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli\
    && docker-php-ext-enable redis memcached\
    && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/docker-php-ext-mongodb.ini

EXPOSE 9000