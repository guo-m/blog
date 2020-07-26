## 以模块划分目录结构

模块紧内聚

```
├── base
│   └── Utils.lua
├── game
│   ├── lobby
│   │   ├── Lobby.lua
│   │   ├── LobbyCtrl.lua
│   │   └── LobbyView.lua
│   ├── shop
│   │   ├── Shop.lua
│   │   ├── ShopCtrl.lua
│   │   └── ShopView.lua
│   └── task
│       ├── Task.lua
│       ├── TaskCtrl.lua
│       └── TaskView.lua
├── platform
│   └── Ads.lua
```
