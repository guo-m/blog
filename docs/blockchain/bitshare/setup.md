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
cmake -DBOOST_ROOT=/usr/local/opt/boost@1.60 -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl -DCMAKE_BUILD_TYPE=Release .
make
```

## Windows

## iOS

## Android

## 可执行文件

1. 全节点：program/witness_node/witness_node
2. 延时节点：program/delayed_node/deplayed_node
3. 命令行钱包：program/cli_wallet/cli_wallet
4. 创世区块助手：program/genesis_util/get_dev_key

ref: [Building-on-macOS](https://github.com/bitshares/bitshares-core/wiki/Building-on-OS-X)
