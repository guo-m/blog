## iOS IAP流程简述



1.  内购账户税务协议、银行卡绑定相关
2.  在 App Store Content -> 我的APP 添加内购项目商品
3.  沙盒环境测试账号
    -   虚拟邮箱，未绑定过 Apple Account 的账号 `iaptester@test.com`
    -   符合要求的密码，`Qq123456*`
4.  写代码测试
  1.  成功获取产品列表
  2.  购买成功



## 沙盒注意事项

1.  iOS 真机测试
2.  iap 测试不需要发布 `testflight` 或者正式发布
3.  需要沙盒测试测试账号
4.  切换沙盒账号：`"设置" -> "iTunes Store与App Store" -> "沙盒账户" -> 点击邮箱`，就可以切换了。



~EOF~

