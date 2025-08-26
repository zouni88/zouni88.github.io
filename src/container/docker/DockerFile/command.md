DockerFile 分为四部分：基础镜像、维护者、镜像操作指令、容器启动时执行指令

`WORKDIR` 指定工作目录，类似于 cd,定位到某一个目录

```Shell
WORKDIR /usr/local/nginx
```

`RUN` 构建镜像时运行指令
```shell
RUN apk add nginx && mkdir /run/nginx/
```

构建指令：
```Shell
docker build -f dockerfile-path .
```
