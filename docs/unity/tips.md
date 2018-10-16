# tips

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



