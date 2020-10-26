package com.bgs.ssm.controller;
/*
    使用redis缓存
 */

import com.bgs.ssm.pojo.User;
import com.bgs.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.Duration;
import java.util.List;

@Controller
public class redisHuanCun {
    @Autowired
    RedisTemplate<Object,Object> redisTemplate;

    @Autowired
    UserService u;

    @ResponseBody
    @RequestMapping("/user22/{id}")
    public User findUser(@PathVariable(name="id") Integer id){
        User user = null;
        String key = createKey(id);
        user = (User)redisTemplate.opsForValue().get(key);
        if(user==null){
            user = (User)u.DanChaYongHu1(id);
            if(user!=null){
                redisTemplate.opsForValue().set(key,user,Duration.ofMinutes(1));
            }
        }
        return user;
    }

    private String createKey(Integer id) {
        return "findUser:"+id;
    }

}
