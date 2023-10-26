package com.chat.message.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.message.model.User;

import java.util.List;
import java.util.Map;

public interface UserService extends IService<User> {

    List<User> getMyFriends(Long userId);
}
