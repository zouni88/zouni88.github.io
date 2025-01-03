#!/bin/bash -v

echo "ffmpeg start"
NDK_ROOT=/root/android-ndk-r26b/toolchains/llvm/prebuilt/linux-x86_64
SYSROOT=$NDK_ROOT/sysroot


function build {
        ./configure  \
    --prefix=$PREFIX \
    --arch=$ARCH \
    --cpu=$CPU \
    --target-os=android \
    --sysroot=$SYSROOT \
    --cross-prefix=$CROSS_PREFIX \
    --extra-cflags="-I$SYSROOT/usr/include -fPIC -DANDROID -mfpu=neon -mfloat-abi=softfp --target=aarch64-linux-android34 " \
    --extra-ldflags="-L$SYSROOT/usr/lib --target=aarch64-linux-android34" \
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
    --disable-doc \
    --disable-htmlpages \
    --disable-manpages \
    --disable-podpages \
    --disable-txtpages \
    --disable-stripping

    make -j8
    make install
    make clean
    echo "ffmpeg complete!!!"
}

echo "ffmpeg armv7 start"
PREFIX="/root/ffmpeg/armv7"
ARCH=aarch32
CPU=armeabiv7-a
CROSS_PREFIX=$NDK_ROOT/bin/armv7a-linux-android
CC=$NDK_ROOT/bin/armv7a-linux-androideabi34-clang \
NM=$NDK_ROOT/bin/llvm-nm \
CXX=$NDK_ROOT/bin/armv7a-linux-androideabi34-clang++ \
build

echo "ffmpeg armv8 start"
PREFIX="/root/ffmpeg/armv8"
ARCH=aarch64
CPU=armv8-a
CROSS_PREFIX=$NDK_ROOT/bin/aarch64-linux-android-
CC=$NDK_ROOT/bin/aarch64-linux-android34-clang
NM=$NDK_ROOT/bin/llvm-nm
CXX=$NDK_ROOT/bin/aarch64-linux-android34-clang++
build