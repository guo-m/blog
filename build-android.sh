#!/bin/sh

# 2019.05.05 很多年、很多年后对交叉编译的总结

# 以下链接非常重要
## https://developer.android.com/ndk/guides/standalone_toolchain.html
## https://developer.android.com/ndk/guides/other_build_systems
## https://stackoverflow.com/questions/41439513/compile-automake-configure-based-project-using-android-ndk


##  先创建 toolchain
## build standalone toolchain
# $NDK/build/tools/make_standalone_toolchain.py \
#   --arch arm64 \
#   --api 26 \
#   --install-dir=/opt/standalone-r16b-arm64

# $NDK/build/tools/make_standalone_toolchain.py \
#   --arch x86 \
#   --api 26 \
#   --install-dir=/opt/standalone-r16b-x86

## 编译
COMPILER_PREFIX=i686-linux-android
export TOOLCHAIN=/opt/standalone-r16b-x86
export AR=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-ar
export AS=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-as
export CC=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-clang
export CXX=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-clang++
export LD=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-ld
export RANLIB=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-ranlib
export STRIP=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-strip

INSTALL_PREFIX=`pwd`/android/x86
mkdir -p ${INSTALL_PREFIX}
./configure --prefix=${INSTALL_PREFIX} --host i686-linux-android --disable-shared
make clean && make && make install


TOOLCHAIN=/opt/standalone-r16b-arm64
# Tell configure what tools to use.
COMPILER_PREFIX=aarch64-linux-android
export AR=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-ar
export AS=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-clang
export CC=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-clang
export CXX=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-clang++
export LD=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-ld
export RANLIB=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-ranlib
export STRIP=${TOOLCHAIN}/bin/${COMPILER_PREFIX}-strip

# Tell configure what flags Android requires.
# export CFLAGS="-fPIE -fPIC"
# export LDFLAGS="-pie"

export CFLAGS="${CFLAGS} -D__ANDROID_API__=21"  # https://blog.csdn.net/crazyquhezheng/article/details/79034765
export CXXFLAGS="${CXXFLAGS} -D__ANDROID_API__=21"
INSTALL_PREFIX=`pwd`/android/arm64-v8a
mkdir -p ${INSTALL_PREFIX}
./configure --prefix=${INSTALL_PREFIX} --host aarch64-linux-android --disable-shared
make clean && make && make install


