package com.bgs.ssm.controller;

import com.bgs.ssm.config.RedisConfig;
import com.bgs.ssm.config.Test2Config;

import org.omg.CORBA.Environment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

import javax.annotation.Resource;
import java.util.Arrays;

/*
    使用连接池连接redis
 */
@Controller
@EnableConfigurationProperties(MyTest.class)
public class WebJavaRedis {


    @Autowired
    MyTest myTest;


    @Autowired
    @Qualifier("sss")
   /* @Resource(name = "sss")*/
    JedisPool jedisPool;

    @Autowired
    RedisTemplate<Object,Object> redisTemplate;


    @Autowired
    StringRedisTemplate stringRedisTemplate;



    @Autowired
    Test2Config test2Config;

    @RequestMapping("/aaa")
    public void OO(){
        MyTest2 myTest2 = test2Config.myTest234();
        System.out.println(myTest2);
    }


         //redis连接池
    @ResponseBody
    @RequestMapping("/test22")
    public String TestRedis(){
        Jedis resource = jedisPool.getResource();
        String s = resource.get("1008");
        String s1 = resource.get("1009");
        return s+"\t"+s1;
    }

   /*
        RedisTemplate工具类
    */
    @ResponseBody
    @RequestMapping("test33")
    public void RedisTemplate(){
      /* redisTemplate.opsForValue().set("34","woshizhuzhu");*/
       /*ValueOperations<Object, Object> valueOperations =  redisTemplate.opsForValue();
        valueOperations.set("456","quying666");
        Object o = valueOperations.get("456");
        System.out.println(o);*/

       /* redisTemplate.setKeySerializer(RedisSerializer.string());
        redisTemplate.setValueSerializer(RedisSerializer.json()); */    //使用KeySerializer这个序列化器

        /*
        如果不走RedisConfig,就需要自定义序列化
     */

        redisTemplate.opsForValue().set("55","qqqq");
        redisTemplate.opsForValue().set("56", Arrays.asList("1","2","3"));

        Object o = redisTemplate.opsForValue().get("55");
        Object o1 = redisTemplate.opsForValue().get("56");



        System.out.println(o);
        System.out.println(o1);
    }




    //SpringBoot注解的练习
    @ResponseBody
    @RequestMapping("/wwwq")
    public String LLL(){
        MyTest myTest = new MyTest();
        String jos = myTest.getJos();
        System.out.println(jos);
        return jos;
    }





    //使用redis进行消息队列的实现
    //消息生产者，使用converAndSend发送消息
    @ResponseBody
    @RequestMapping("/messager/{name}")
    public String sendMessage(@PathVariable("name") String name){
        stringRedisTemplate.convertAndSend("redisChat",name);
        return "消息发送成功！！！";
    }



}
