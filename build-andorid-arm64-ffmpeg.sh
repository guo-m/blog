#!/bin/bash
# NDK=/opt/standalone-r16b-arm64/
# 2020-04-05
NDK=/opt/standalone-r16b-arm64-android-21/ # android-8 nexus 6p 加载时出现 找不到 "glob" 错误
NDK=/opt/standalone-r18b-arm64-android-21/ # 
ADDI_CFLAGS="-fPIE -pie"
ADDI_LDFLAGS="-fPIE -pie -shared"

configure()
{
    CPU=$1
    PREFIX=$(pwd)/android/$CPU
    HOST=""
    CROSS_PREFIX=""
    SYSROOT=""
    ARCH=""

    # arm64
    ARCH="aarch64"
    HOST=aarch64-linux
    SYSROOT=$NDK/sysroot/
    CROSS_PREFIX=$NDK/bin/aarch64-linux-android-

    echo $PREFIX

    mkdir -p $PREFIX

    ./configure \
    --prefix=$PREFIX \
    --enable-shared \
    --enable-static \
    --disable-doc \
    --disable-ffmpeg \
    --disable-ffplay \
    --disable-ffprobe \
    --disable-ffserver \
    --disable-avdevice \
    --disable-asm \
    --disable-swresample \
    --enable-avresample \
    --disable-doc \
    --disable-symver \
    --disable-network \
    --disable-pthreads \
    --enable-cross-compile \
    --cross-prefix=$CROSS_PREFIX \
    --target-os=linux \
    --arch=$ARCH \
    --sysroot=$SYSROOT \
    --extra-cflags="-fPIE -fPIC $ADDI_CFLAGS" \
    --extra-ldflags="$ADDI_LDFLAGS"
}

build()
{
    make clean
    cpu=$1
    echo "build $cpu"

    configure $cpu
    make && make install
}

build arm64
