### 下载镜像
```
# 官方提供的mysql镜像
docker pull mysql
```
### 创建容器
```
docker run -itd --name=mysql -p 3307:3306 -v ./data/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 mysql
```
- -p 指定3306端口映射宿主机
- -v 数据库文件映射到宿主机
- -e 指定参数 ‘MYSQL_ROOT_PASSWORD’ 设置数据库密码

### 进入容器
```
docker exec -it mysql_wxc bash
```
