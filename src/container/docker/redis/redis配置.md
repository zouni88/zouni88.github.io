docker run -p 6379:6379 --name redis -v /root/redis/redis.conf:/etc/redis/redis.conf -v /root/redis/data:/data -d redis redis-server /etc/redis/redis.conf --appendonly yes


docker run -itd --name redis -p 6379:6379 -v /root/redis/redis.conf:/etc/redis/redis.conf -v /root/redis/data:/data -d redis redis-server /etc/redis/redis.conf --appendonly yes


### 查看配置文件挂载
```shell
docker inspect redis| grep Mounts -A 20
```