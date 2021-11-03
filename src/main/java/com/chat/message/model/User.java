package com.chat.message.model;

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.io.Serializable;

/**
 * @author lisw
 * @program message
 * @description 用户信息表
 * @createDate 2021-08-18 17:02:41
 * @slogan 长风破浪会有时，直挂云帆济沧海。
 **/
@Data
@TableName(value = "user")
public class User implements Serializable {

    private Long id;

    private String name;

    private String avatar;

    private String openId;
}
