# 初始化
1. 下载hugo已发布版本

2. 配置环境变量：   
    2.1. 创建 `bin` 文件夹，将`hugo.exe` 放在`bin`文件夹下；  
    2.2. 配置换进变量：将`hugo/bin/`目录添加到 `path` 中；
3. 创建站点：
    > hugo new site path/project_name
4. 运行站点：
    > cd path/project_name  //定位到当前站点目录

    > hugo server //运行服务

5. 部署：
    > hugo   //hugo 命令构建站点
    build完后的站点文件夹下 `public` 目录

# 设置主题
> cd themes
> git clone git@github.com:setsevireon/photophobia.git
> git submodule add https://github.com/alex-shpak/hugo-book themes/book
# 启动本地调试
> hugo server --theme=photophobia --buildDrafts --watch





