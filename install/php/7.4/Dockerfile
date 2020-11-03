FROM php:7.4-fpm
MAINTAINER C_Hiang

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak

#替换国内源
RUN  echo "deb http://mirrors.aliyun.com/debian wheezy main contrib non-free" > /etc/apt/sources.list
RUN  echo "deb-src http://mirrors.aliyun.com/debian wheezy main contrib non-free" >>/etc/apt/sources.list
RUN  echo "deb http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.163.com/debian/ jessie main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.163.com/debian/ jessie-proposed-updates main non-free contrib" >>/etc/apt/sources.list

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libmemcached-dev zlib1g-dev \
    && pecl install redis-5.1.1 \
    && pecl install memcached-3.1.4 pdo_msql  \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli\
    && docker-php-ext-enable redis memcached

EXPOSE 9000