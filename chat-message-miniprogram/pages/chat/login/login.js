// pages/chat/login/login.js
Page({

  /**
   * 页面的初始数据
   */
  data: {

  },
  getUserProfile:function(e){
    wx.getUserProfile({
      desc: '获取您的微信个人信息',
      success: (res) => {
        this.setData({
          hasUserInfo: true
        })
        var app = getApp()
        app.globalData.userInfo = res.userInfo; // 将用户信息存到globalData里面
        this.linkUserList();
      },
      fail: function (e) {
        wx.showToast({
          title: '你选择了取消',
          icon: "none",
          duration: 1500,
          mask: true
        })
      }
    })
  },
  linkUserList:function(){
    wx.navigateTo({
      url: `/pages/chat/userList`,
    })
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {
    var app = getApp()
      if(app.globalData.userInfo!=null){
        this.linkUserList();
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