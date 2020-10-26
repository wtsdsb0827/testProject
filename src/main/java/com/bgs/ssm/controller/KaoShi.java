package com.bgs.ssm.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;

@Controller
@RequestMapping("student")
public class KaoShi {


    @Autowired
    RedisTemplate<Object,Object> redisTemplate;

    @RequestMapping("in")
    public String in(String bianhao,String xingming,String xingbie,String nianling,String banji,String dizhi){
        return "forward:/kaoshi1.jsp";
    }

    //添加
    @RequestMapping("add")
    public String add(String bianhao,String xingming,String xingbie,String nianling,String banji,String dizhi){
        String b = "录入成功";
        Jedis jedis = new Jedis("localhost", 6379);

        jedis.auth("wts");

        jedis.lpush("2019001",bianhao);
        jedis.lpush("2019001",xingming);
        jedis.lpush("2019001",xingbie);
        jedis.lpush("2019001",nianling);
        jedis.lpush("2019001",banji);
        jedis.lpush("2019001",dizhi);
       /* String s = jedis.get("2019001");
        System.out.println(s);
        redisTemplate.opsForValue().set(2019001,s);*/
        return b;
    }

    //查询
    @ResponseBody
    @RequestMapping("{id}")
    public Object findUser(@PathVariable(name="id") String id){

        String o = (String)redisTemplate.opsForValue().get(id);
        System.out.println(o);

        return o;
    }

   @ResponseBody
    @RequestMapping("del")
    public int del(){
      int i = 1;
        Jedis jedis = new Jedis("localhost", 6379);
        jedis.auth("wts");
        Long del = jedis.del("2019001");
        return i;
    }


}
