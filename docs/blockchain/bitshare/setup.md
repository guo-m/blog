# 环境搭建

2018.10.11

## macOS

```bash
brew doctor
brew update

brew install cmake git openssl autoconf automake libtool # boost
brew install boost@1.60
brew link --force openssl

git clone https://github.com/bitshares/bitshares-core.git
cd bitshares-core
git submodule update --init --recursive
cmake -DBOOST_ROOT=/usr/local/opt/boost@1.60 -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl .
make
```

## Windows

## iOS

## Android

ref: [Building-on-macOS](https://github.com/bitshares/bitshares-core/wiki/Building-on-OS-X)
