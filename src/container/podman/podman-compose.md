### 安装
```shell
pip3 install podman-compose
```
1. 创建卷
> podman volume create data

2. 启动容器
podman-compose up


```yaml
version: 3.7
 
services:
  reverse-proxy:
    image: docker.io/library/caddy:alpine
    container_name: caddy-vishwambhar
    command: caddy run --config /etc/caddy/Caddyfile
    restart: always
    ports:
      - "8080:80"
      - "8443:443"
    volumes:
      - /docker-volumes/caddy/Caddyfile:/etc/caddy/Caddyfile:Z
      - /docker-volumes/caddy/site:/srv:Z
      - /docker-volumes/caddy/caddy_data:/data:Z
      - /docker-volumes/caddy/caddy_config:/config:Z
      - /docker-volumes/caddy/ssl:/etc/ssl:Z
    labels:
      - io.containers.autoupdate=registry
      - pratham.container.category=proxy
    environment:
      - TZ=Asia/Kolkata
    depends_on:
      - gitea-web
 
  gitea-web:
    image: docker.io/gitea/gitea:latest
    container_name: gitea-govinda
    restart: always
    ports:
      - "8010:3000"
      - "8011:22"
    volumes:
      - /docker-volumes/gitea/web:/data:Z
      - /docker-volumes/gitea/ssh:/data/git/.ssh:Z
      - /etc/localtime:/etc/localtime:ro
    labels:
      - io.containers.autoupdate=registry
      - pratham.container.category=gitea
    environment:
      - RUN_MODE=prod
      - DISABLE_SSH=false
      - START_SSH_SERVER=true
      - SSH_PORT=22
      - SSH_LISTEN_PORT=22
      - ROOT_URL=https://git.mydomain.com
      - DOMAIN=git.mydomain.com
      - SSH_DOMAIN=git.mydomain.com
      - GITEA__database__DB_TYPE=postgres
      - GITEA__database__HOST=gitea-db:5432
      - GITEA__database__NAME=gitea
      - GITEA__database__USER=gitea
      - GITEA__database__PASSWD=/run/secrets/gitea_database_user_password
      - GITEA__service__DISABLE_REGISTRATION=true
      - TZ=Asia/Kolkata
    depends_on:
      - gitea-db
    secrets:
      - gitea_database_user_password
 
  gitea-db:
    image: docker.io/library/postgres:14-alpine
    container_name: gitea-chitragupta
    restart: always
    volumes:
      - /docker-volumes/gitea/database:/var/lib/postgresql/data:Z
    labels:
      - io.containers.autoupdate=registry
      - pratham.container.category=gitea
    environment:
      - POSTGRES_USER=gitea
      - POSTGRES_PASSWORD=/run/secrets/gitea_database_user_password
      - POSTGRES_DB=gitea
      - TZ=Asia/Kolkata
    secrets:
      - gitea_database_user_password
 
secrets:
gitea_database_user_password:
external: true
```