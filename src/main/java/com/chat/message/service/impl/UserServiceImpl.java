package com.chat.message.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.chat.message.dao.UserDao;
import com.chat.message.model.User;
import com.chat.message.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * @author lisw
 * @program message
 * @description
 * @createDate 2021-08-18 17:10:38
 * @slogan 长风破浪会有时，直挂云帆济沧海。
 **/
@Service
@Slf4j
public class UserServiceImpl extends ServiceImpl<UserDao, User> implements UserService {
}
