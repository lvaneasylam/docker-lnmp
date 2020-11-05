FROM php:5.6-fpm
MAINTAINER C_Hiang
#copy 需要的包
COPY ./package/memcached-2.2.0.tgz /home/memcached-2.2.0.tgz
#时区配置
ENV TIMEZONE Asia/Shanghai
#替换阿里的DNS
RUN echo "nameserver 223.5.5.5" | tee /etc/resolv.conf > /dev/null
#备份源
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak

#打印系统版本决定源
RUN cat /etc/issue
RUN cat /etc/apt/sources.list.bak

#替换国内源 (腾讯云)
#RUN  echo "deb http://mirrors.cloud.tencent.com/debian/ buster main non-free contrib" > /etc/apt/sources.list
#RUN  echo "deb http://mirrors.cloud.tencent.com/debian-security buster/updates main" >>/etc/apt/sources.list
#RUN  echo "deb http://mirrors.cloud.tencent.com/debian/ buster-updates main non-free contrib" >>/etc/apt/sources.list
#RUN  echo "deb http://mirrors.cloud.tencent.com/debian/ buster-backports main non-free contrib" >>/etc/apt/sources.list
#RUN  echo "deb-src http://mirrors.cloud.tencent.com/debian-security buster/updates main" >>/etc/apt/sources.list
#RUN  echo "deb-src http://mirrors.cloud.tencent.com/debian/ buster main non-free contrib" >>/etc/apt/sources.list
#RUN  echo "deb-src http://mirrors.cloud.tencent.com/debian/ buster-updates main non-free contrib" >>/etc/apt/sources.list
#RUN  echo "deb-src http://mirrors.cloud.tencent.com/debian/ buster-backports main non-free contrib" >>/etc/apt/sources.list

#替换国内源 (163)
RUN  echo "deb http://mirrors.163.com/debian/ buster main non-free contrib" > /etc/apt/sources.list
RUN  echo "deb http://mirrors.163.com/debian/ buster-updates main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb http://mirrors.163.com/debian/ buster-backports main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb http://mirrors.163.com/debian-security/ buster/updates main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.163.com/debian/ buster main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.163.com/debian/ buster-updates main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.163.com/debian/ buster-backports main non-free contrib" >>/etc/apt/sources.list
RUN  echo "deb-src http://mirrors.163.com/debian-security/ buster/updates main non-free contrib" >>/etc/apt/sources.list



#安装 redis imap gd mongo memcached mysql
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libmemcached-dev zlib1g-dev \
        libc-client-dev libkrb5-dev \
    && rm -r /var/lib/apt/lists/* \
    && pecl channel-update https://pecl.php.net/channel.xml \
    && pecl install mongo \
    && pecl install redis-2.2.8 \
    && pecl install memcached-2.2.0.tgz \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql mysqli \
    && docker-php-ext-enable redis memcached mongo \
    && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/memcached.ini \
    && echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

#安装php composer
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" && \
        php composer-setup.php && \
        php -r "unlink('composer-setup.php');" && \
        mv composer.phar /usr/local/bin/composer


COPY ./etc/php.ini /usr/local/etc/php/php.ini

EXPOSE 9000

#MAC 用
#RUN usermod -u 1000 www-data && usermod -G staff www-data

LABEL Author="C_Hiang"
LABEL Version="PHP56-11041037"
LABEL Description="PHP FPM 5.6 镜像.Extensions:redis,mongo,memcached,gd,imap."