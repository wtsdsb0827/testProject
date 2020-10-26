package com.bgs.ssm.controller;

import com.bgs.ssm.pojo.XiaoShuo;
import com.bgs.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/*
    将数据库的数据展示到页面上
 */
@Controller
@RequestMapping(value = "Thebigdata")
public class TheBigData {


    @Autowired
    private UserService u;


    @ResponseBody
    @RequestMapping(value = "selectZongTuiJian",method = RequestMethod.POST)
    public List<XiaoShuo> selectZongTuiJian(XiaoShuo xiaoShuo){
        List<XiaoShuo> list = u.selectZongTuiJian(xiaoShuo);
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "FirstClassify",method = RequestMethod.POST)
    public List<XiaoShuo> FirstClassify(XiaoShuo xiaoShuo){
            List<XiaoShuo> list = u.FirstClassify(xiaoShuo);
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "SecondClassify",method = RequestMethod.POST)
    public List<XiaoShuo> SecondClassify(XiaoShuo xiaoShuo){
        List<XiaoShuo> list = u.SecondClassify(xiaoShuo);
        return list;
    }

    @ResponseBody
    @RequestMapping(value = "ThirdClassify",method = RequestMethod.POST)
    public List<XiaoShuo> ThirdClassify(XiaoShuo xiaoShuo){
        List<XiaoShuo> list = u.ThirdClassify(xiaoShuo);
        return list;
    }





}


