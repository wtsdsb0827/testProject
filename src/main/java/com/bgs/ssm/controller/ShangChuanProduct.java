package com.bgs.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;

/*
    练习上传文件
 */
@Controller
public class ShangChuanProduct {

    @RequestMapping("/ShangChuan")
    public String ShangChuan(@RequestParam("fileName") MultipartFile files,Model model) throws Exception{
        String originalFilename = files.getOriginalFilename();
        String s = UUID.randomUUID().toString() + originalFilename.substring(originalFilename.lastIndexOf("."));
        files.transferTo(new File("D://IDEAPROJECT//XiangMuDaLiPu//src//main//webapp//static//img//"+s));
        model.addAttribute("s",s);
        return "success1";
    }
}
