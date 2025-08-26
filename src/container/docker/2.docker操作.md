### 镜像操作：
1. 从仓库搜索镜像：`docker search image-name`  
	搜索结果过滤:
```Shell
	#是否是官方提供：  
	docker search --filter "is-official=true" image_name
	# 是否是自动化构建：  
	docker search --filter "is-automated=true" image_name
	# 大于多少个`star`  
	docker search --filter stars=3 image_name
```
	下载镜像：
```Shell
docker pull image_name
```

2. 本地镜像的查看：
```Shell
docker images
```

3. 删除：
```Shell
docker rmi image_name
```
4. 修改镜像名字：
```Shell
docker tag images_id 要推送的主机地址/镜像名：版本号
```
5. push到docker仓库
```Shell
# 前提是已经在docker服务注册并创建了仓库
docker push 刚刚修改的镜像名字（要推送的主机地址/镜像名：版本号）这一长串
```

### 容器基本操作：
1. 查看容器：
```shell
docker ps
```
2. 创建容器:
```Shell
docker run -itd --name=container_name images_name
```
> **-i**: 以交互模式运行容器;	 
> **-d**: 后台运行;  
> **-t**: 为容器重新分配一个伪输入终端;  
> **--name**: 容器名字;	  

3. 查看所有容器:
```Shell
docker ps -a
```
4. 停止容器：
```Shell
docker stop container_name
```
5. 重启容器:
```Shell
docker restart container_name
```
6. 删除容器: # 删除之前要先停止
```Shell
docker rm container_name
```

### 容器修改与保存
1. 进入容器
```Shell
docker exec -it container_name /bin/bash
```
2. 修改容器提交:
```Shell
docker commit -a "author" -m "modify" container_name/container_id new_image_name:tag_name
```

### 端口映射
```Shell
docker run -itd --name=container_name -p 8888:80 images_name
```

> `-p` 8888 指的是 宿主机端口->端口映射到容器80端口  访问：127.0.0.1:8888
>
> `注意:` 命令顺序不能反，`image_name` 在最后  

![oper](/res/docker/docker_2.png)
