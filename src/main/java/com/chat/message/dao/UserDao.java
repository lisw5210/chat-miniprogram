package com.chat.message.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.chat.message.model.User;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserDao extends BaseMapper<User> {

    List<User> getMyFriends(Map<String,Object> params);
}
