FROM redis:5.0.10
MAINTAINER C_Hiang

COPY ./etc/redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]

EXPOSE 6379

LABEL Author="C_Hiang"
LABEL Version="redis5-202011041618"
LABEL Description="redis-v5:密码:''  "