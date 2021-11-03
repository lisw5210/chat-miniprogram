package com.chat.message.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.chat.message.model.BusinessMessageEntity;
import com.chat.message.model.User;

public interface MessageService extends IService<BusinessMessageEntity> {

    int sendMessage(BusinessMessageEntity businessMessageEntity);
}
