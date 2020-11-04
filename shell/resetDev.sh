#本脚本用于重置
#停止所有容器
docker stop $(docker ps -a -q)
#删除所有容器
docker rm $(docker ps -a -q)
#删除所有的镜像
docker rmi $(docker images -q)