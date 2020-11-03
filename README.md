# docker-lnmp build version
### This is a LNMP on docker environment.



#### File storage

- ./nginx ->nginx 文件夹映射目录
- ./nginx/conf.d/vhost ->nginx 虚拟主机引入页目录
- ./certificate ->nginx ssl证书存放文件夹
- ./data/***  -> 各个系统对应的数据库存放路径
- ./wwwroot -> 项目存到路径
- ./install  ->文件安装目录
- ./install/php/7.4/etc/php.ini -> php ini



#### Version description

- PHP    v7.4 ->补充 redis/mongodb/memcached/gd图像处理/imap
- REDIS
- MYSQL v8.0
- NGINX
- MONGO
- MARIADB



Port list

- nginx : 80
- php74: 9000
- mysql: 3306
- mongo:27010
- redis:6379
- mariadb:3307



#### Password List(username/password)

- Mysql:root/root
- Mongo:root/example
- Mariadb:root/root
- redis:(null)



###### *Network use "bridge" mode ,less to export the useless port to the outside network.







