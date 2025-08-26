#!/bin/bash -v

echo "ffmpeg start"
NDK_ROOT=/mnt/e/WorkRoom/ubuntu/android-ndk-r22b/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$NDK_ROOT/sysroot


function build {
        ./configure  \
    --prefix=$PREFIX \
    --arch=$ARCH \
    --cpu=$CPU \
    --target-os=android \
    --sysroot=$SYSROOT \
    --cross-prefix=$CROSS_PREFIX \
    --extra-cflags="-I$SYSROOT/usr/include -fPIC -DANDROID -mfpu=neon -mfloat-abi=softfp " \
    --extra-ldflags="-L$SYSROOT/usr/lib" \
    --cc=$CC \
    --nm=$NM \
    --cxx=$CXX \
    --enable-runtime-cpudetect \
    --enable-neon \
    --enable-shared \
    --enable-asm \
    --disable-static \
    --enable-cross-compile \
    --enable-small \
    --enable-jni \
    --enable-mediacodec \
    --enable-gpl \
    --enable-decoder=h264_mediacodec \
    --disable-doc \
    --disable-debug \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-postproc \
    --disable-avdevice \
    --disable-symver \
    --disable-stripping
    make -j8
    make install
    make clean
    echo "ffmpeg complete!!!"
}

echo "ffmpeg armv7 start"
PREFIX="/mnt/e/WorkRoom/ffmpeg/armv7"
ARCH=arm
CPU=armv7-a
CROSS_PREFIX=$NDK_ROOT/bin/arm-linux-android-
CC=$NDK_ROOT/bin/armv7a-linux-androideabi21-clang \
NM=$NDK_ROOT/bin/arm-linux-androideabi-nm \
CXX=$NDK_ROOT/bin/armv7a-linux-androideabi21-clang++ \
build

echo "ffmpeg armv8 start"
PREFIX="/mnt/e/WorkRoom/ffmpeg/armv8"
ARCH=aarch64
CPU=armv8
CROSS_PREFIX=$NDK_ROOT/bin/aarch64-linux-android-
CC=$NDK_ROOT/bin/aarch64-linux-android21-clang
NM=$NDK_ROOT/bin/aarch64-linux-android-nm
CXX=$NDK_ROOT/bin/aarch64-linux-android21-clang++
build

