# docker-lnmp base version
### This is a LNMP on docker environment.



#### File storage

- ./nginx/conf ->nginx conf文件夹映射目录
- ./nginx/certificate ->nginx ssl证书存放文件夹
- ./data/***  -> 各个系统对应的数据库存放路径
- ./wwwroot -> 项目存到路径



#### Version description

- PHP    v7.3
- REDIS
- MYSQL v8.0
- NGINX
- MONGO
- MARIADB



Port list

- nginx : 8080,80
- php: 9000
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







