## 1. Android Studio 中看不见 release build 应用

app/build.gradle 中添加
```
buildTypes {
    release {
        debuggable true
        jniDebuggable true
```

## 2. 查看崩溃栈

https://developer.android.com/ndk/guides/ndk-stack

```
adb logcat > /tmp/foo.txt
$NDK/ndk-stack -sym $PROJECT_PATH/obj/local/armeabi-v7a -dump foo.txt
```

可以把崩溃栈看得更清楚。
