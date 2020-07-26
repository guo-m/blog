## 以 mvc 为分层的目录结构

模块分散在三个功能目录

```
├── base
│   └── Utils.lua
├── game
│   ├── control
│   │   ├── LobbyCtrl.lua
│   │   ├── ShopCtrl.lua
│   │   └── TaskCtrl.lua
│   ├── model
│   │   ├── Lobby.lua
│   │   ├── Shop.lua
│   │   └── Task.lua
│   └── view
│       ├── LobbyView.lua
│       ├── ShopView.lua
│       └── TaskView.lua
├── platform
│   └── Ads.lua
```
