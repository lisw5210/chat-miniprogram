// pages/list/list.js
const App = getApp();
Page({
 
  /**
   * 页面的初始数据
   */
  data: {
    title: '加载中...', // 状态
    list: [], // 数据列表
    type: '', // 数据类型
    loading: true // 显示等待框
  },
  chat(event){
    let openId = event.currentTarget.dataset.openid;
    let memberId = event.currentTarget.dataset.memberId;
    wx.navigateTo({
      url: `/pages/chat/chat?receiveOpenId=`+openId+`&memberId=`+memberId,
    })
    console.log(openId);
  },
  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) { // options 为 board页传来的参数
    const openId = App.globalData.userInfo.openId;
    const _this = this;
    // 拼接请求url
    const url =  App.globalData.baseAPI + 'mobile/register/getMemberList/' + openId;
    // 请求数据
    wx.request({
      url: url,
      data: {},
      header: {
        'content-type': 'json' // 默认值
      },
      success: function(res) {
        console.log(res.data);
        for (var index in res.data.data) {
          res.data.data[index].avatar = App.getMediaURL(res.data.data[index].avatar)
       }
        // 赋值
        _this.setData({
          list: res.data.data,
          loading: false // 关闭等待框
        })
      }
    })
  }
})