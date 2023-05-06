// app.js
App({
  onLaunch() {
    // 展示本地存储能力
    const logs = wx.getStorageSync('logs') || []
    logs.unshift(Date.now())
    wx.setStorageSync('logs', logs)

    // 登录
    wx.login({
      success: res => {
        // 发送 res.code 到后台换取 openId, sessionKey, unionId
      }
    })
    let menuButtonObject = wx.getMenuButtonBoundingClientRect();
    wx.getSystemInfo({
      success: res => {
        let statusBarHeight = res.statusBarHeight;
        //胶囊按钮与顶部的距离
        let navTop = menuButtonObject.top;
        //导航高度
        let navHeight = statusBarHeight + menuButtonObject.height + (menuButtonObject.top - statusBarHeight) * 2;
        this.globalData.navHeight = navHeight;
        this.globalData.navTop = navTop;
        this.globalData.windowHeight = res.windowHeight;
      },
      fail(err) {
        console.log(err);
      }
    })
  },
  globalData: {
    userInfo: null,
    navHeight:0,
    //后端api服务，该地址为作者的线上地址，如果连本地，则修改成本地服务即可
    baseAPI: 'https://www.wmbyte.com/message-server/',
    //baseAPI: 'http://192.168.50.131:9999/message-server/',
    //后端ws服务，该地址为作者的线上地址，如果连本地，则修改成本地服务即可
    wsBaseAPI: 'wss://www.wmbyte.com/message-server/',
    //wsBaseAPI: 'ws://192.168.50.131:9999/message-server/',
  },
  getMediaURL(obj){
    //如果以http开头，则直接返回，否则拼接baseAPI
    let prefix = obj.substring(0,4);
    if(prefix == 'http'){
      return obj;
    }else{
     return this.globalData.baseAPI+"mobile/media/get/"+obj;
    }
  }
})
