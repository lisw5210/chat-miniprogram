// pages/userinfo/index.js
const App = getApp();
const defaultAvatarUrl = 'https://mmbiz.qpic.cn/mmbiz/icTdbqWNOwNRna42FI242Lcia07jQodd2FJGIYQfG0LAJGFxM4FbnQP6yfMxBgJ0F3YRqJCJ1aPAK2dQagdusBZg/0'
const defaultNickName = '微信用户'
Page({

  /**
   * 页面的初始数据
   */
  data: {
      userInfo:App.globalData.userInfo,
      avatarUrl: defaultAvatarUrl,
      nickName:defaultNickName
  },
  onChooseAvatar(e) {
    const { avatarUrl } = e.detail 
    let _this = this;
    wx.uploadFile({
      url: App.globalData.baseAPI+'mobile/media/upload',
      filePath: avatarUrl,
      name: 'file',
      formData: {
        'source': '1',
        'openId':App.globalData.userInfo.openId
      },
      success (res){
        if(res.statusCode===200){
          console.log("文件上传成功"+JSON.stringify(res));
          const data = JSON.parse(res.data);
          //修改全局用户对象中的头像地址
          App.globalData.userInfo.avatar = data.url
          //修改缓存中的信息
          wx.setStorageSync("chat-mini-program-userInfo",JSON.stringify(App.globalData.userInfo))
          _this.setData({
            avatarUrl:App.getMediaURL(data.url),
          })
          wx.showToast({
            title: '头像修改成功',
            icon: 'success',
            mask: true,
          });
        }
      }
    })
    
  },
  updateNickName(e){
    let value = e.detail.value;
    let that = this;
    wx.request({
      url: App.globalData.baseAPI+"mobile/register/updateMember",
      data: {openId:App.globalData.userInfo.openId,name:value},
      method:"post",
      header: { 
        'content-type': 'application/json'
      },   
      success: function (res) {
        if(res.data.code == 0){
          //修改全局用户对象中的头像地址
          App.globalData.userInfo.nickName = value
          //修改缓存中的信息
          wx.setStorageSync("chat-mini-program-userInfo",JSON.stringify(App.globalData.userInfo))
          that.setData({
            nickName:value,
          })
          wx.showToast({
            title: '昵称修改成功',
            icon: 'success',
            mask: true,
          });
        }
      }
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    let userInfo = wx.getStorageSync("chat-mini-program-userInfo");

    let that = this;
    if(userInfo){
      userInfo = JSON.parse(userInfo);
      App.globalData.userInfo = userInfo
      this.setData({
        avatarUrl:App.getMediaURL(userInfo.avatar),
        nickName:userInfo.nickName
      })
    }else{
      wx.login({
        //获取code
        success: function (res) {
          var code = res.code; //返回code
          wx.request({
            url: App.globalData.baseAPI+"mobile/wxlogin/getOpenIdByCode?code="+code,
            data: {},
            header: { 
              'content-type': 'json'
            },   
            success: function (res) {
              var uopenid = res.data.openid //返回openid
              var uavatar = res.data.avatar // 返回头像
              var unickname = res.data.nickname //返回昵称
              var umemberId = res.data.memberId // 返回用户ID
              console.log(uopenid)//控制台打印openid
              let userInfo = {
                "openId":uopenid,
                "avatar":uavatar,
                "nickName":unickname,
                "memberId":umemberId
              }
              that.setData({
                avatarUrl:userInfo.avatar?App.getMediaURL(userInfo.avatar):defaultAvatarUrl,
                nickName:userInfo.nickName?userInfo.nickName:defaultNickName
              })
              App.globalData.userInfo = userInfo;
              wx.setStorageSync("chat-mini-program-userInfo",JSON.stringify(App.globalData.userInfo))
            }
          })
        }
      })
    }
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {
    
  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})