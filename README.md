# 仿微信的一套微信小程序聊天DEMO

#### 作者介绍
个人开发者，只因找不到比较完美的小程序聊天程序，只能自己写。

### 关注个人微信公众号"程序员无名"，给个支持吧。

### 感谢支持，给予点个"Star吧"


![430430.jpg](http://www.wmbyte.com/img/wechat_qrcode_mp.jpg)

#### 项目介绍
基于SpringBoot+小程序的一套小程序源码，（欢迎一起改进、学习，欢迎提建议）
目前已经实现的核心功能点如下：

## 通讯录-聊天

获取通过该系统进行授权得到的用户列表，可进行发起通话。
1. 消息内容支持：文字、表情、图片、视频
2. 下拉加载历史消息（仿微信）
3. 点击图片可进行图片预览（仿微信）
4. 消息发送时，消息气泡旁边有菊花转动，发送成功后菊花消失（仿微信）
5. 消息发送后，消息自动往上滚动，保持滚动条一直在最下方（仿微信）

## 个人中心

授权得到用户OPENID，可进行补全头像及昵称（因新版本小程序，无法在通过授权得到用户头像与昵称，故而需要手动补全）


#### 软件架构
基于SpringBoot、MySQL、Mybatis-Plus，微信小程序实现的一套试试聊天的DEMO代码。

#### 安装教程

##### 1.创建数据库
将message.sql导入到数据库，数据库名称为message
##### 2.在开发者工具打开小程序代码
导入小程序代码:chat-message-miniprogram 为小程序代码，导入开发者工具需要导入该目录。
##### 3.修改小程序代码中的接口地址
小程序代码里的app.js里配置后台服务的接口地址前缀[baseAPI、wsBaseAPI]
##### 4.修改后端application-dev.yml
- 在application-dev.yml进行配置,图片上传存储位置（头像、聊天图片）支持OSS与本地，如果配置了local.filePath则会使用本地存储，否则使用OSS 
- 在application-dev.yml中,修改数据库链接信息，
- 在application-dev.yml中,小程序APPID与APPSecret


#### 使用说明

1.  后台服务连上数据库直接启动，端口目前是9999
2.  使用微信开发者工具打开chat-message-miniprogram小程序源码，编译即可看到效果

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request

### 演示截图

![输入图片说明](https://www.wmbyte.com/img/chat_message_minip/address-book1.jpeg)
![输入图片说明](https://images.gitee.com/uploads/images/2021/1103/141820_d7ffe8e7_601463.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1103/142034_05ff162c_601463.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1103/142045_6b045ecf_601463.png "屏幕截图.png")
![输入图片说明](https://www.wmbyte.com/img/chat_message_minip/person-center.jpeg)
