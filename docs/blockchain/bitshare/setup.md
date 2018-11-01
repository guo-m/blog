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

## cli_wallet 链接 witness_node 的 ws 服务接口 (macOS)

<p>
  错误： `-s ws://127.0.0.1:20181`
  正确： `--server-rpc-endpoint=ws://127.0.0.1:20181`
</p>

  ```
  $ ./cli_wallet --chain-id="9ece9a7e079f7e3ca5d5cfa3c8cf0b0fbbaad6f4b745b70c558c4de97a6bf64a" -s ws://127.0.0.1:20181 -w my-wallet.json
  Logging RPC to file: logs/rpc/rpc.log
  2995349ms th_a       main.cpp:143                  main                 ] key_to_wif( committee_private_key ): 5KCBDTcyDqzsqehcb52tW5nU6pXife6V2rX9Yf7c3saYSzbDZ5W
  2995349ms th_a       main.cpp:147                  main                 ] nathan_pub_key: BTS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV
  2995349ms th_a       main.cpp:148                  main                 ] key_to_wif( nathan_private_key ): 5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3
  Starting a new wallet with chain ID 9ece9a7e079f7e3ca5d5cfa3c8cf0b0fbbaad6f4b745b70c558c4de97a6bf64a (from CLI)
  2995349ms th_a       main.cpp:195                  main                 ] wdata.ws_server: ws://127.0.0.1:8090
  0 exception: unspecified
  Underlying Transport Error
      {"message":"Underlying Transport Error"}
      asio  websocket.cpp:450 operator()
  
      {"uri":"ws://127.0.0.1:8090"}
      th_a  websocket.cpp:679 connect
  ```
  
  [https://github.com/bitshares/bitshares-core/issues/313](https://github.com/bitshares/bitshares-core/issues/313)
  > I have noticed, that sometimed, -s doesn't work and i needed to use the full length parameter --server-rpc-endpoint
  > @xeroc afaik boost 1.60 has that command line issue. boost 1.57 and 1.58 are OK.
  mac 下用的 boost 版本正是 1.60

ref: [Building-on-macOS](https://github.com/bitshares/bitshares-core/wiki/Building-on-OS-X)
