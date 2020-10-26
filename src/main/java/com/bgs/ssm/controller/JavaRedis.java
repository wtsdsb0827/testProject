package com.bgs.ssm.controller;

import redis.clients.jedis.Jedis;

import java.io.*;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/*
    Java关联redis
 */
public class JavaRedis {

   public static void Connection() throws Exception {
       //1.连接本地的redis服务
       Jedis jedis = new Jedis("localhost", 6379);

       jedis.auth("wts");

       System.out.println("redis连接成功！！！");

       //不使用序列化，直接存储
       jedis.set("1009", "woshizhu");


       //存储数组进去并遍历得到每一个value值
       jedis.lpush("JAMES", "111");
       jedis.lpush("JAMES", "222");
       jedis.lpush("JAMES", "333");
       jedis.lpush("JAMES", "444");

       List<String> james = jedis.lrange("JAMES", 0, -1);

       for (String ll : james) {
           System.out.println(ll);
       }


       //调用keys这个方法得到key
       Set<String> keys = jedis.keys("30");

      Iterator<String> iterator = keys.iterator();
      while (iterator.hasNext()){
          String next = iterator.next();
          System.out.println(next);
      }






      /*
            将数据序列化到redis中
      */
       ABC abc = new ABC("ceshiyixia");
      ByteArrayOutputStream bb =  new ByteArrayOutputStream();
       ObjectOutputStream out = new ObjectOutputStream(bb);
       out.writeObject(abc);

       byte[] bytes = bb.toByteArray();     //把内存中的对象转换成字节数组存储在ByteArrayOutputStream这个流中

       jedis.set("30".getBytes("UTF-8"),bytes);
       System.out.println("序列化到redis中");



       ObjectInputStream in = new ObjectInputStream(new ByteArrayInputStream(bytes));   //反序列化
       ABC abc1 = (ABC)in.readObject();
       System.out.println(abc1.name);

   }

    public static void main(String[] args) throws Exception {
        Connection();
    }


    /*
        静态内部类
     */
    private static class ABC implements Serializable {
       private String name;
        public ABC(String name) {
            this.name = name;
        }
    }
}
