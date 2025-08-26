### 配置环境
第一次打开Clion,首先配置Toolchains,这里使用了Mingw

![toolchains](/res/CXX/toolchain.png)

![设置](/res/CXX/clion1.png)

配置Cmake options,增加以下参数：
```
-DCMAKE_SYSTEM_NAME=Android
-DANDROID_NDK="E:\WorkRoom\android\sdk_root\ndk\22.1.7171670"
-DANDROID_TOOLCHAIN_NAME=aarch64-linux-android-clang3.5
-DCMAKE_TOOLCHAIN_FILE="E:\WorkRoom\android\sdk_root\ndk\22.1.7171670\build\cmake\android.toolchain.cmake"
-DANDROID_PLATFORM="android-21"
-DANDROID_TOOLCHAIN="clang"
-DCMAKE_C_FLAGS="-fpic -fexceptions -frtti"
-DCMAKE_CXX_FLAGS="-fpic -fexceptions -frtti"
-DANDROID_STL="c++_static"
```


