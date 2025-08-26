### 文件挂载
 > docker run -itd --name=small_nginx -p 8888:80 -v d:/index.html:/usr/share/nginx/html/index.html small/nginx
 * **-v** 表示： 宿主机文件路径：容器文件路径
 * **-p** 表示: 宿主机ip:容器ip

  这里修改了nginx默认启动页面关联到本地

 ![filemount](/res/docker/docker_4.png)

### 文件目录挂载
> docker run -itd --name=small_mysql -p 33066:3306 -v d:/docker/mysql/:/var/lib/mysql/ -e MYSQL_ROOT_PASSWORD=123456 mysql

  * **-e** 表示：向容器内传参，ex:设定数据库密码：`MYSQL_ROOT_PASSWORD=123456`


docker run -itd --name=flask_mysql -p 33066:3306 -v /var/lib/mysql:/var/lib/mysql/ -e MYSQL_ROOT_PASSWORD=123456 mysql
