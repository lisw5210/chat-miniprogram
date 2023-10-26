package com.chat.message.web;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.chat.message.model.User;
import com.chat.message.service.UserService;
import com.chat.message.util.R;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

/**
 * @author lisw
 * @program wuming-SpringBoot+Mybatis仿微信聊天小程序
 * @description
 * @createDate 2023-05-05 13:55:08
 **/
@RestController
@RequestMapping("/mobile/wxlogin")
public class MobileWxLoginController {

    @Value("${miniprogram.appId}")
    private String appId;

    @Value("${miniprogram.appSecret}")
    private String appSecret;

    @Autowired
    private UserService userService;

    @GetMapping("/getOpenIdByCode")
    public R getOpenIdByCode(String code){
        String url = "https://api.weixin.qq.com/sns/jscode2session?appid="+appId+"&secret="+appSecret+"&js_code="+code+"&grant_type=authorization_code";
        String result = HttpUtil.get(url);
        JSONObject rtnJson = new JSONObject();
        if(StringUtils.isNotBlank(result)){
            JSONObject jsonObject = JSON.parseObject(result);
            if(jsonObject.containsKey("openid")){
                String openid = jsonObject.getString("openid");
                //获取是否已经在库中
                LambdaQueryWrapper<User> queryWrapper = new LambdaQueryWrapper<>();
                queryWrapper.eq(User::getOpenId,openid);
                User one = userService.getOne(queryWrapper, false);
                if(one==null){
                    //插入一个用户
                    one = new User();
                    one.setOpenId(openid);
                    one.setAvatar("https://mmbiz.qpic.cn/mmbiz/icTdbqWNOwNRna42FI242Lcia07jQodd2FJGIYQfG0LAJGFxM4FbnQP6yfMxBgJ0F3YRqJCJ1aPAK2dQagdusBZg/0");
                    one.setName("微信用户");
                    one.setCreateTime(new Date());
                    userService.save(one);
                }
                rtnJson.put("memberId",one.getId());
                rtnJson.put("avatar",one.getAvatar());
                rtnJson.put("nickname",one.getName());
                rtnJson.put("openid",openid);
            }
        }
        System.out.println(result);
        return R.ok(rtnJson);
    }

}
