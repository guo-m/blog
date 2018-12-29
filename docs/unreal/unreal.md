入门往往是痛苦的

- [中文文档](https://docs.unrealengine.com/latest/CHN/index.html)
- [英文文档](https://docs.unrealengine.com/latest/INT/index.html)
- [unreal 中文社区](http://unrealchina.com/portal.php)

## iOS 打包

"Project Settings" -> "Platforms" -> "Build":
- [x] "Automatic Signing"
- [IOS Team ID](https://developer.apple.com/account/#/membership)

项目工程在 "Intermediate/ProjectFilesIOS/" 目录下

## 插件开发

1. 打包编译插件，如 https://github.com/gameDNAstudio/Crashlytics
    - 把插件放在 "Plugins" 目录下
    - 重启编辑器
    - 插件不兼容，选择不编译插件
    - "Settings" -> "Plugins" -> "Installed" 里找到 "Crashlytics" -> "Package" -> 选择 Crashlytics 插件所在目录 ("Plugins/Crashlytics")
    - 等待 unreal 编译插件
    
如果提高开发插件速度？
