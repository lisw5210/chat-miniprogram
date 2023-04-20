# 仿微信的一套微信小程序聊天DEMO

#### 作者介绍
个人开发者，只因找不到比较完美的小程序聊天程序，只能自己写。
关注微信公众号"程序员无名"，一起学习与交流

![430430.jpg](https://wmbyte.oss-cn-shanghai.aliyuncs.com/%E5%85%AC%E4%BC%97%E5%8F%B7%E4%BA%8C%E7%BB%B4%E7%A0%81.jpg)

#### 项目介绍
基于SpringBoot+小程序的一套小程序源码，（欢迎一起改进、学习，欢迎提建议）
目前已经实现的核心功能点如下：

1. 消息内容支持：文字、表情、图片、视频 
2. 下拉加载历史消息（仿微信） 
3. 点击图片可进行图片预览（仿微信） 
4. 消息发送时，消息气泡旁边有菊花转动，发送成功后菊花消失（仿微信） 
5. 消息发送后，消息自动往上滚动，保持滚动条一直在最下方（仿微信） 

#### 软件架构
基于SpringBoot、MySQL、Mybatis-Plus，微信小程序实现的一套试试聊天的DEMO代码。



#### 安装教程

1.  创建数据库(message.sql)
2.  图片及视频存储的是阿里云OSS，配置文件里可配置。
3.  小程序代码里的app.js里配置后台服务的接口地址前缀[baseAPI、wsBaseAPI]

#### 使用说明

1.  后台服务连上数据库直接启动，端口目前是9999
2.  使用微信开发者工具打开chat-message-miniprogram小程序源码，编译即可看到效果

#### 参与贡献

1.  Fork 本仓库
2.  新建 Feat_xxx 分支
3.  提交代码
4.  新建 Pull Request

### 演示截图

![输入图片说明](https://images.gitee.com/uploads/images/2021/1103/141242_2d335279_601463.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1103/141820_d7ffe8e7_601463.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1103/142034_05ff162c_601463.png "屏幕截图.png")
![输入图片说明](https://images.gitee.com/uploads/images/2021/1103/142045_6b045ecf_601463.png "屏幕截图.png")
