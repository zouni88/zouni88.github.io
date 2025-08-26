# mysql 配置
### 首先查看centos是否已经安装了mysql源
```
yum list installed mysql*
如果有就删除
yum remove mysql-community-*

```
### 安装mysql源

``` 数据库官网地址
https://dev.mysql.com/downloads/repo/yum/
```
```
wget -i -c http://dev.mysql.com/get/mysql57-community-release-el7-10.noarch.rpm
```
### 安装mysql
```
yum -y install mysql57-community-release-el7-10.noarch.rpm
```

### 查看是否已经安装了数据库源
```
yum repolist all | grep mysql
```
### 查看数据库源
```
/etc/yum.repos.d/mysql-community.repo
修改源可用 mysql80  enable = 1
```
### 安装数据库服务
```
yum install mysql-server
```

### 启动mysql
```
systemctl start mysqld.service
```
### 查看状态
```
systemctl status mysqld.service
```
### 查看初始密码
```
grep "password" /var/log/mysqld.log
```
### 修改密码
```
mysql> ALTER USER 'root'@'localhost' IDENTIFIED BY 'new password';

mysql> ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '123456'
```
 **注意:密码设置必须要大小写字母数字和特殊符号（,/';:等）,不然不能配置成功**
