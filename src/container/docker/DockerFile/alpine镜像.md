`alpine` 启动没有`/bin/bash`
docker


`alpine`软件安装
```
apk add python3
```

修改成aliyun源
  > 1. `vi /etc/apk/repositories`
  > 2. https://mirrors.aliyun.com/alpine/

  or

**sed** 命令修改 仓库文件
```
  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
```

```
  阿里云镜像源地址：
  https://developer.aliyun.com/mirror/
```
