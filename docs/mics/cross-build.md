# Cross build

## iOS

```
#!/bin/sh

# 作者：yyzhangyang
# 链接：https://www.jianshu.com/p/015c9c377d66
# 來源：简书
# 简书著作权归作者所有，任何形式的转载都请联系作者获得授权并注明出处。

make distclean

set -e

# CONFIGURE_FLAGS="--disable-shared --disable-frontend"
CONFIGURE_FLAGS="--disable-shared"

ARCHS="arm64 armv7s armv7 x86_64 i386"

# directories
# SOURCE是下载的第三方库源码包，解压后的目录，可以把sh脚本放到这个目录，source改为""
SOURCE=""
# FAT是所有指令集build后，输出的目录，所有静态库被合并成一个静态库
FAT="fat-libtool"

# SCRATCH是下载源码包，解压后的目录
SCRATCH="./"
# must be an absolute path
# THIN 各自指令集build后输出的静态库所在的目录，每个指令集为一个静态库
THIN=`pwd`/"thin-libtool"

COMPILE="y"
LIPO="y"

if test "$*"
then
    if test "$*" = "lipo"
    then
        # skip compile
        COMPILE=
    else
        ARCHS="$*"
        if test $# -eq 1
        then
            # skip lipo
            LIPO=
        fi
    fi
fi

if test "$COMPILE"
then
    CWD=`pwd`
    echo "$CWD/$SOURCE........."
    for ARCH in $ARCHS
    do
        echo "building $ARCH..."
        mkdir -p "$SCRATCH/$ARCH"
        cd "$SCRATCH/$ARCH"

        if test "$ARCH" = "i386" -o "$ARCH" = "x86_64"
        then
            PLATFORM="iPhoneSimulator"
            if test "$ARCH" = "x86_64"
            then
                SIMULATOR="-mios-simulator-version-min=7.0"
                HOST=x86_64-apple-darwin
            else
                SIMULATOR="-mios-simulator-version-min=7.0"
                HOST=i386-apple-darwin
            fi
        else
            PLATFORM="iPhoneOS"
            SIMULATOR=
            HOST=arm-apple-darwin
        fi

        XCRUN_SDK=`echo $PLATFORM | tr '[:upper:]' '[:lower:]'`
        CC="xcrun -sdk $XCRUN_SDK clang -arch $ARCH"
        #AS="$CWD/$SOURCE/extras/gas-preprocessor.pl $CC"
        CFLAGS="-arch $ARCH $SIMULATOR"
        CXXFLAGS="$CFLAGS"
        LDFLAGS="$CFLAGS"

        CC=$CC $CWD/$SOURCE/configure \
        $CONFIGURE_FLAGS \
        --host=$HOST \
        --prefix="$THIN/$ARCH" \
        CC="$CC" CFLAGS="$CFLAGS" LDFLAGS="$LDFLAGS"

        make -j4 install
        cd $CWD
    done
fi

if test "$LIPO"
then
    echo "building fat binaries..."
    mkdir -p $FAT/lib
    set - $ARCHS
    CWD=`pwd`
    cd $THIN/$1/lib
    for LIB in *.a
    do
        cd $CWD
        lipo -create `find $THIN -name $LIB` -output $FAT/lib/$LIB
    done

    cd $CWD
    cp -rf $THIN/$1/include $FAT
fi
```
