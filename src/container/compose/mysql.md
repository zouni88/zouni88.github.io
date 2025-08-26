```yaml
mysql:
    image: mysql:8.0
    container_name: mysql-container
    restart: always
    environment:
      # 设置 MySQL 根用户密码
      MYSQL_ROOT_PASSWORD: your_root_password
      # 可选：创建一个额外的数据库
      MYSQL_DATABASE: your_database_name
      # 可选：创建一个额外的用户并授权
      MYSQL_USER: your_username
      MYSQL_PASSWORD: your_user_password
    ports:
      # 将容器的 3306 端口映射到主机的 3306 端口
      - "3306:3306"
    volumes:
      # 数据卷挂载，确保数据持久化
      - mysql-data:/var/lib/mysql
      # 可选：挂载自定义配置文件
      # - ./my.cnf:/etc/mysql/conf.d/my.cnf
    networks:
      - mysql-network
    # 可选：设置 MySQL 字符集
    command: --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```