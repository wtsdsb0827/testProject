package com.bgs.ssm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/*
    用来接收消息
 */
@Component
public class Receiver {
   /* 打印日志
    static Logger logger = LoggerFactory.getLogger(Receiver.class);*/


    public void receiveMessage(String name){
        /*logger.info("收到的消息"+ message);*/
        System.out.println("我接收到的消息是："+name);
    }
}
