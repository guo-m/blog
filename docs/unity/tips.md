# tips

Date: 2018-10-16

## 1. [Facebook Unity 使用原生 FB APP分享图片](https://github.com/facebook/facebook-sdk-for-unity/issues/120)

```c#
    public void SetDialogMode(int mode)
    {
        if (mode == 0){
            FB.Mobile.ShareDialogMode = ShareDialogMode.AUTOMATIC;
        }
        else if (mode == 1){
            FB.Mobile.ShareDialogMode = ShareDialogMode.FEED;
        }
        else if (mode == 2){
            FB.Mobile.ShareDialogMode = ShareDialogMode.NATIVE;
        }
        else if (mode == 3){
            FB.Mobile.ShareDialogMode = ShareDialogMode.WEB;
        }
    }
```



## 2. LuaException: non enough memory

解决办法：把 android 工具链安装上。
