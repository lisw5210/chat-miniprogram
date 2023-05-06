package com.chat.message.web;

import cn.hutool.core.io.file.FileWriter;
import cn.hutool.core.util.IdUtil;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.chat.message.config.OSSFactory;
import com.chat.message.service.UserService;
import com.chat.message.util.MimeTypeEnum;
import com.chat.message.util.R;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.MimeType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.channels.Channels;

/**
 * @author lisw
 * @program ly-project
 * @description
 * @createDate 2021-05-30 22:04:23
 * @slogan 长风破浪会有时，直挂云帆济沧海。
 **/
@RestController
@RequestMapping("/mobile/media")
public class MobileMediaUploadController {

    @Value("${local.filePath}")
    private String filePath;


    @Autowired
    private UserService userService;


    /**
     * @param multipartFile 文件传输对象
     * @param source 来源 1：头像 2：聊天图片
     * @param openId 用户OPENID 更新头像时使用
     * @return
     */
    @RequestMapping(value = "/upload")
    public R upload(@RequestParam("file") MultipartFile multipartFile,Integer source,String openId
    ) {
        //上传文件
        String suffix = multipartFile.getOriginalFilename().substring(multipartFile.getOriginalFilename().lastIndexOf("."));
        try {
            String url = "";
            if(StringUtils.isBlank(filePath)){
                //没有配置本地存储路径，则上传到OSS
                url = OSSFactory.build().uploadSuffix(multipartFile.getBytes(), suffix);
            }else{
                String uuid = IdUtil.simpleUUID()+suffix;
                FileWriter writer = new FileWriter(filePath+uuid);
                writer.writeFromStream(multipartFile.getInputStream());
                url = uuid;
            }
            if(source!=null && source == 1){
                //头像，更新用户头像
                UpdateWrapper updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq("open_id",openId);
                updateWrapper.set("avatar",url);
                userService.update(updateWrapper);
            }
            return R.ok().put("url", url);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return R.error();
    }

    /**
     *
     */
    @GetMapping("/get/{name}")
    public void get(@PathVariable("name") String name, HttpServletRequest request, HttpServletResponse response){
        File file = new File(filePath+name);
        try (FileInputStream fis = new FileInputStream(file)) {
            response.setContentType(MimeTypeEnum.getContentType(name.split("\\.")[1]));
            fis.getChannel().transferTo(0,fis.available(), Channels.newChannel(response.getOutputStream()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
