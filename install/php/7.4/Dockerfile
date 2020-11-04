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

#安装拓展redis,imap,gd图像处理,mysql,mongodb,memcached
RUN apt-get update -y && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libmemcached-dev zlib1g-dev \
        libc-client-dev libkrb5-dev \
    && rm -r /var/lib/apt/lists/* \
    && pecl install redis-5.1.1 mongodb\
    && pecl install memcached-3.1.4\
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) gd imap pdo pdo_mysql mysqli\
    && docker-php-ext-enable redis memcached\
    && echo "extension=mongodb.so" > /usr/local/etc/php/conf.d/docker-php-ext-mongodb.ini


#安装php composer 如果无法安装可以下面的hash无法对应 到网站获取最新的hash值 https://getcomposer.org/download/
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" && \
        php composer-setup.php && \
        php -r "unlink('composer-setup.php');" && \
        mv composer.phar /usr/local/bin/composer

COPY ./etc/php.ini /usr/local/etc/php/php.ini


EXPOSE 9000

LABEL Author="C_Hiang"
LABEL Version="PHP74-11041448"
LABEL Description="PHP FPM 7.4 镜像.Extensions:redis,mongo,memcached,gd,imap."