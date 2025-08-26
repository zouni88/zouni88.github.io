### 安装uwsgi  报各种 致命错误
1. 缺少c编译器
 ```Shell
 File "uwsgiconfig.py", line 742, in __init__
     raise Exception("you need a C compiler to build uWSGI")
 Exception: you need a C compiler to build uWSGI
 ```
 首次安装软件，需要先更新源。
```Shell
apk update
apk add gcc
```
2. 执行`pip3 install uWSGI`
```python
In file included from core/socket.c:1:0:
./uwsgi.h:165:19: fatal error: stdio.h: No such file or directory
compilation terminated.
In file included from core/logging.c:2:0:
./uwsgi.h:165:19: fatal error: stdio.h: No such file or directory
compilation terminated.
In file included from core/utils.c:1:0:
./uwsgi.h:165:19: fatal error: stdio.h: No such file or directory
compilation terminated.
In file included from core/protocol.c:1:0:
./uwsgi.h:165:19: fatal error: stdio.h: No such file or directory
compilation terminated.
```
缺乏C语言的标准库
```Shell
apk add libc-dev
```
3. 继续安装 `pip3 install uwsgi`
```python
In file included from core/logging.c:2:0:
    ./uwsgi.h:238:26: fatal error: linux/limits.h: No such file or directory
    compilation terminated.
    In file included from core/utils.c:1:0:
    ./uwsgi.h:238:26: fatal error: linux/limits.h: No such file or directory
    compilation terminated.
    In file included from core/protocol.c:1:0:
    ./uwsgi.h:238:26: fatal error: linux/limits.h: No such file or directory
    compilation terminated.
    In file included from core/socket.c:1:0:
    ./uwsgi.h:238:26: fatal error: linux/limits.h: No such file or directory
    compilation terminated.
```
缺乏Linux相关的头文件
```Shell
apk add linux-headers
```

4. 由于uWSGI功能众多，所以，使用的参数不同，需要的功能也会有差异。
在使用--static-map等参数时，可能会有额外的编译依赖，否则会有运行时报错。
```
!!! no internal routing support, rebuild with pcre support !!!
```
PCRE（Perl Compatible Regular Expressions）是一个Perl库，包括 perl 兼容的正则表达式库。
编译依赖为pcre-dev，运行依赖为pcre。

5. 运行时，某些功能需要访问/etc/mime.types文件。
```
!!! no /etc/mime.types file found !!!
```
MIME（Multipurpose Internet Mail Extensions）多用途互联网邮件扩展类型。 是设定某种扩展名的文件用一种应用程序来打开的方式类型，当该扩展名文件被访问的时候，浏览器会自动使用指定应用程序来打开。

  这个东西对应的Alpine库是mailcap。

> 最终通过以下命令安装成功
```Shell
RUN apk update && apk add \
        libuuid \
        pcre \
        mailcap \
        gcc \
        libc-dev \
        linux-headers \
        pcre-dev \
    && pip install --no-cache-dir uWSGI>=2.0.15 \
    && apk del \
        gcc \
        libc-dev \
        linux-headers \
    && rm -rf /tmp/*
```

### 虽然成功了，但是由于有部分Python库，无法在Alpine上使用，比如opencv-python。 原因是，Alpine的libc不是GNU的，而是musl libc。 详见：Cannot install opencv-contrib-python from Alpine Linux · Issue #75 · skvark/opencv-python。
> I completely forgot that Alpine Linux is based on musl libc and not on GNU libc and thus it's not a GNU/Linux distribution. Manylinux supports only GNU/Linux.

# 所以放弃使用`alpine`
