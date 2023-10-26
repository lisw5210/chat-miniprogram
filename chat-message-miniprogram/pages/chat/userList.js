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
    loading: true, // 显示等待框
    lineHeight: 24,//表情的大小
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
  onShow: function (options) { // options 为 board页传来的参数
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
          if(res.data.data[index].contentType == 0){
            res.data.data[index].content = JSON.parse(res.data.data[index].content);
          }
          if(res.data.data[index].maxContentTime){
            res.data.data[index].maxContentTime = _this.dateFormat(res.data.data[index].maxContentTime);
          }else{
            res.data.data[index].maxContentTime=""
          }
          console.log(res.data.data[index].maxContentTime)
       }
        // 赋值
        _this.setData({
          list: res.data.data,
          loading: false // 关闭等待框
        })
      }
    })
  },
  dateFormat(dateStr){

    const now = new Date();
  const date = new Date(dateStr);
  
  // 检查是否是同一天
  if (now.toDateString() === date.toDateString()) {
    const hours = date.getHours().toString().padStart(2, '0');
    const minutes = date.getMinutes().toString().padStart(2, '0');
    return `${hours}:${minutes}`;
  }
  
  // 检查是否是昨天
  const yesterday = new Date(now);
  yesterday.setDate(now.getDate() - 1);
  if (yesterday.toDateString() === date.toDateString()) {
    const hours = date.getHours().toString().padStart(2, '0');
    const minutes = date.getMinutes().toString().padStart(2, '0');
    return `昨天 ${hours}:${minutes}`;
  }
  
  // 检查是否是本周内
  if (now - date <= 6 * 24 * 60 * 60 * 1000) {
    const weekdays = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
    return weekdays[date.getDay()];
  }
  
  // 检查是否是同一年
  if (now.getFullYear() === date.getFullYear()) {
    const month = (date.getMonth() + 1).toString().padStart(2, '0');
    const day = date.getDate().toString().padStart(2, '0');
    return `${month}月${day}日`;
  }
  
  // 不在同一年
  const year = date.getFullYear();
  const month = (date.getMonth() + 1).toString().padStart(2, '0');
  const day = date.getDate().toString().padStart(2, '0');
  return `${year}年${month}月${day}日`;
  }
})