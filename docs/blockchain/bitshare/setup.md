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
```
cd bitshares-core && cd .. 
mkdir bitshares-core-xcode && cd bitshares-core-xcode
cmake -DBOOST_ROOT=/usr/local/opt/boost@1.60 -DOPENSSL_ROOT_DIR=/usr/local/opt/openssl -GXcode ../bitshares-core
open BitShares.xcodeproj/
```

## Android

## 可执行文件

1. 全节点：program/witness_node/witness_node
2. 延时节点：program/delayed_node/deplayed_node
3. 命令行钱包：program/cli_wallet/cli_wallet
4. 创世区块助手：program/genesis_util/get_dev_key

## cli_wallet 链接 witness_node 的 ws 服务接口 (macOS)

错误： `-s ws://127.0.0.1:20181`

正确： `--server-rpc-endpoint=ws://127.0.0.1:20181`

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

# 查看 websocket 发送内容

<details>
<summary>启动私链</summary>

```
~/repos/bitshares-core-xcode/programs/
./witness_node --genesis-json genesis.json --enable-stale-production
```
</details>

<details>
<summary>bitshare-ws</summary>

修改 websocket_api.cpp send_** 函数：

```log
unlocked >>> import_key nathan "5KQwrPbwdL6PhXujxW37FSSQZ1JiwsST4cqQzDeyXtP79zkvFD3"
XXXX:{"id":8,"method":"call","params":[2,"lookup_account_names",[["nathan"]]]}

unlocked >>> upgrade_account nathan true
XXXX:{"id":9,"method":"call","params":[2,"lookup_account_names",[["nathan"]]]}
XXXX:{"id":10,"method":"call","params":[2,"get_global_properties",[]]}
XXXX:{"id":11,"method":"call","params":[2,"get_potential_signatures",[{"ref_block_num":0,"ref_block_prefix":0,"expiration":"1970-01-01T00:00:00","operations":[[8,{"fee":{"amount":1000000000,"asset_id":"1.3.0"},"account_to_upgrade":"1.2.17","upgrade_to_lifetime_member":true,"extensions":[]}]],"extensions":[],"signatures":[]}]]}
XXXX:{"id":12,"method":"call","params":[2,"get_required_signatures",[{"ref_block_num":0,"ref_block_prefix":0,"expiration":"1970-01-01T00:00:00","operations":[[8,{"fee":{"amount":1000000000,"asset_id":"1.3.0"},"account_to_upgrade":"1.2.17","upgrade_to_lifetime_member":true,"extensions":[]}]],"extensions":[],"signatures":[]},["BTS6MRyAjQq8ud7hVNYcfnVPJqcVpscN5So8BhtHuGYqET5GDW5CV"]]]}
XXXX:{"id":13,"method":"call","params":[2,"get_dynamic_global_properties",[]]}
XXXX:{"id":14,"method":"call","params":[3,"broadcast_transaction",[{"ref_block_num":0,"ref_block_prefix":0,"expiration":"2018-11-06T15:59:30","operations":[[8,{"fee":{"amount":1000000000,"asset_id":"1.3.0"},"account_to_upgrade":"1.2.17","upgrade_to_lifetime_member":true,"extensions":[]}]],"extensions":[],"signatures":["1f6b872d028fa1b8a6668f5e091c3d2dbba3b8d8a737b886e8750fb233f19835d044b9b406eb4c33c524b6eaa4b820db4fe8a7b9084b7dc1efd9e59e8b51e6c88a"]}]]}
```
</details>


<details>
<summary>调试接口</summary>
    
选择 cli_wallet -> Edit Scheme -> Run -> Arguments

增加两行 
-w
wallet.json

把 `genesis.json` & `wallet.json` 拷贝到 `~/repos/bitshares-core-xcode/programs/cli_wallet/Debug`
</details>
