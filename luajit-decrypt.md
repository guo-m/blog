1. [cocos2dx lua 反编译(20170417增加补充说明)](https://bbs.pediy.com/thread-216800.htm)
2. [Cocos2d-x与LuaJIT汇编的初步解密](https://bbs.pediy.com/thread-222825.htm)
3. [扒尽手游的底裤——Cocos2dx与LuaJIT完全解密](https://www.52pojie.cn/thread-664517-1-1.html)

其实2、3是同一片文章，但是第三条标题起的好啊，吸睛！！

## 测试
1. 使用 `ljd-master2.1.0` 测试某手游 luajit 文件，大部分都不能直接反编译。

```
~/Downloads/ljd-master2.1.0 $ python3 ./main.py /path/to/assets/src/cocos/framework/device.lua
err: unwarper.py assert isinstance(else_warp_out, nodes.EndWarp), Block indices are unreliable while you are mangling them! P.S. Probably they should not be named indices... But they ARE used as indices during other phases. Sometimes.
err: unwarper.py assert isinstance(else_warp_out, nodes.EndWarp), Block indices are unreliable while you are mangling them! P.S. Probably they should not be named indices... But they ARE used as indices during other phases. Sometimes.
err: unwarper.py assert isinstance(else_warp_out, nodes.EndWarp), Block indices are unreliable while you are mangling them! P.S. Probably they should not be named indices... But they ARE used as indices during other phases. Sometimes.
err: unwarper.py assert isinstance(else_warp_out, nodes.EndWarp), Block indices are unreliable while you are mangling them! P.S. Probably they should not be named indices... But they ARE used as indices during other phases. Sometimes.
err: unwarper.py assert isinstance(else_warp_out, nodes.EndWarp), Block indices are unreliable while you are mangling them! P.S. Probably they should not be named indices... But they ARE used as indices during other phases. Sometimes.
err: unwarper.py assert isinstance(else_warp_out, nodes.EndWarp), Block indices are unreliable while you are mangling them! P.S. Probably they should not be named indices... But they ARE used as indices during other phases. Sometimes.
err: unwarper.py assert isinstance(else_warp_out, nodes.EndWarp), Block indices are unreliable while you are mangling them! P.S. Probably they should not be named indices... But they ARE used as indices during other phases. Sometimes.
err: unwarper.py assert isinstance(else_warp_out, nodes.EndWarp), Block indices are unreliable while you are mangling them! P.S. Probably they should not be named indices... But they ARE used as indices during other phases. Sometimes.
err: unwarper.py assert isinstance(else_warp_out, nodes.EndWarp), Block indices are unreliable while you are mangling them! P.S. Probably they should not be named indices... But they ARE used as indices during other phases. Sometimes.
slot0 = {
	platform = "unknown",
	model = "unknown"
}

if cc.Application:getInstance().getTargetPlatform(slot1) == cc.PLATFORM_OS_WINDOWS then
	slot0.platform = "windows"
elseif slot2 == cc.PLATFORM_OS_MAC then
	slot0.platform = "mac"
elseif slot2 == cc.PLATFORM_OS_ANDROID then
	slot0.platform = "android"
elseif slot2 == cc.PLATFORM_OS_IPHONE or slot2 == cc.PLATFORM_OS_IPAD then
	slot0.platform = "ios"
	slot7 = cc.Director:getInstance().getOpenGLView(slot3).getFrameSize(slot4).height

	if cc.Director.getInstance().getOpenGLView(slot3).getFrameSize(slot4).width == 640 and slot7 == 960 then
		slot0.model = "iphone 4"
	elseif slot6 == 640 and slot7 == 1136 then
		slot0.model = "iphone 5"
	elseif slot6 == 750 and slot7 == 1334 then
		slot0.model = "iphone 6"
	elseif slot6 == 1242 and slot7 == 2208 then
		slot0.model = "iphone 6 plus"
	elseif slot6 == 768 and slot7 == 1024 then
		slot0.model = "ipad"
	elseif slot6 == 1536 and slot7 == 2048 then
		slot0.model = "ipad retina"
	end
elseif slot2 == cc.PLATFORM_OS_WINRT then
	slot0.platform = "winrt"
elseif slot2 == cc.PLATFORM_OS_WP8 then
	slot0.platform = "wp8"
end

slot0.language = (slot1.getCurrentLanguage(slot1) == cc.LANGUAGE_CHINESE and "cn") or (slot3 == cc.LANGUAGE_FRENCH and "fr") or (slot3 == cc.LANGUAGE_ITALIAN and "it") or (slot3 == cc.LANGUAGE_GERMAN and "gr") or (slot3 == cc.LANGUAGE_SPANISH and "sp") or (slot3 == cc.LANGUAGE_RUSSIAN and "ru") or (slot3 == cc.LANGUAGE_KOREAN and "kr") or (slot3 == cc.LANGUAGE_JAPANESE and "jp") or (slot3 == cc.LANGUAGE_HUNGARIAN and "hu") or (slot3 == cc.LANGUAGE_PORTUGUESE and "pt") or (slot3 == cc.LANGUAGE_ARABIC and "ar") or "en"
slot0.writablePath = cc.FileUtils:getInstance():getWritablePath()
slot0.directorySeparator = "/"
slot0.pathSeparator = ":"

if slot0.platform == "windows" then
	slot0.directorySeparator = "\\"
	slot0.pathSeparator = ";"
end

printInfo("# device.platform              = " .. slot0.platform)
printInfo("# device.model                 = " .. slot0.model)
printInfo("# device.language              = " .. slot0.language)
printInfo("# device.writablePath          = " .. slot0.writablePath)
printInfo("# device.directorySeparator    = " .. slot0.directorySeparator)
printInfo("# device.pathSeparator         = " .. slot0.pathSeparator)
printInfo("#")

return slot0
```

解 display.lua
```
~/Downloads/ljd-master2.1.0 $ python3 ./main.py assets/src/cocos/framework/display.lua
Traceback (most recent call last):
  File "./main.py", line 123, in <module>
    retval = main()
  File "./main.py", line 104, in main
    ljd.ast.unwarper.unwarp(ast)
  File "/Users/admin/Downloads/ljd-master2.1.0/ljd/ast/unwarper.py", line 35, in unwarp
    _run_step(_unwarp_expressions, node)
  File "/Users/admin/Downloads/ljd-master2.1.0/ljd/ast/unwarper.py", line 43, in _run_step
    statements.contents = step(statements.contents, **kargs)
  File "/Users/admin/Downloads/ljd-master2.1.0/ljd/ast/unwarper.py", line 126, in _unwarp_expressions
    return _unwarp_expressions_pack(blocks, pack)
  File "/Users/admin/Downloads/ljd-master2.1.0/ljd/ast/unwarper.py", line 203, in _unwarp_expressions_pack
    _unwarp_logical_expression(start, end, body)
  File "/Users/admin/Downloads/ljd-master2.1.0/ljd/ast/unwarper.py", line 493, in _unwarp_logical_expression
    expression = _compile_expression([start] + body, end, true, false)
  File "/Users/admin/Downloads/ljd-master2.1.0/ljd/ast/unwarper.py", line 505, in _compile_expression
    parts = _unwarp_expression(body, end, true, false)
  File "/Users/admin/Downloads/ljd-master2.1.0/ljd/ast/unwarper.py", line 651, in _unwarp_expression
    operator = _get_operator(last_block, true, end)
  File "/Users/admin/Downloads/ljd-master2.1.0/ljd/ast/unwarper.py", line 723, in _get_operator
    assert src is None
AssertionError
```
