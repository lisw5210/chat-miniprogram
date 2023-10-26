package com.chat.message.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.util.Date;

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

    private Date createTime;

    @TableField(exist = false)
    private Integer nums;
    @TableField(exist = false)
    private Date maxContentTime;
    @TableField(exist = false)
    private String content;
    @TableField(exist = false)
    private Integer contentType;
}
