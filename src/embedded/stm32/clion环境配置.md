# clion+ stm32 开发环境搭建
[参考jetbrains官方指导](https://www.jetbrains.com/help/clion/2021.2/embedded-development.html)
# 准备 

## 1. clion
## 2. gcc-arm-none-eabi
[下载 gcc-arm-none-eabi-10.3-2021.10-win32.exe](https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads)
一键安装：最后一步勾选（path添加到环境变量，否则编译程序找不到编译器）
## 3. mingw-get-setup.exe
安装之后，配置clion Toolchains 环境就可以了
## 4. stm32cubemx-win.zip
这一步没什么特殊 一键安装
## 5. OpenOCD  
### 5.1 openOCD 配置
配置ST-link烧写器配置文件
stm32f103_stlink.cfg

```config
source [find interface/stlink.cfg]
transport select hla_swd
source [find target/stm32f1x.cfg]
adapter speed 2000  // adapter_khz 2000
```

保存到openOCD脚本目录下：    
D:\WorkRoom\embedded\stm32\OpenOCD-20210729-0.11.0\share\openocd\scripts\board