## iOS IAP流程简述



1.  [内购账户税务协议、银行卡绑定相关](https://appstoreconnect.apple.com/agreements/#/)（等几个小时以上，才会生效）
2.  在 [App Store Content](https://appstoreconnect.apple.com/) -> [我的APP](https://appstoreconnect.apple.com/apps) 添加内购项目商品，信息可以随便填，开发测试阶段不需要正规信息，唯一注意的是 `Product ID` 不能修改，其他信息后期都可以改
3.  [沙盒环境测试账号](https://appstoreconnect.apple.com/access/testers)
    -    `iaptester@test.com` 虚拟邮箱，**未绑定过 Apple Account 的账号，使用不存在的邮箱就好**
    -   `Qq123456*` 符合要求的密码（大小写数字特殊符号）
4.  写代码测试
  1.  `sdkbox import iap`
  2.  成功获取产品列表
  3.  购买成功



## 沙盒注意事项

1.  iOS 真机测试
2.  iap 开发测试时不需要发布 `testflight` 或者正式发布
3.  需要沙盒测试账号
4.  iOS 设备上切换沙盒账号：`"设置" -> "iTunes Store与App Store" -> "沙盒账户" -> 点击邮箱`，就可以切换了。
    -   当购买只需要输入密码，又想更换账号时；



~EOF~

