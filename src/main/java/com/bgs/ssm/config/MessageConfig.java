package com.bgs.ssm.config;

import com.bgs.ssm.controller.Receiver;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.listener.PatternTopic;
import org.springframework.data.redis.listener.RedisMessageListenerContainer;
import org.springframework.data.redis.listener.adapter.MessageListenerAdapter;

/*
    消息订阅者配置类
 */
@Configuration
@AutoConfigureAfter({Receiver.class})
public class MessageConfig {


    /*
        接收消息的适配器，可以理解为通过适配器来反射Receiver类的方法，然后利用监听容器进行消息的接收
     */
    @Bean
    public MessageListenerAdapter getMessage(Receiver receiver){
        return new MessageListenerAdapter(receiver,"receiveMessage");
    }


    /*
        用于接收消息的监听容器
     */
    @Bean
    public RedisMessageListenerContainer getRedisMessageListenerContainer(RedisConnectionFactory redisConnectionFactory,MessageListenerAdapter messageListenerAdapter){
        RedisMessageListenerContainer redisMessageListenerContainer = new RedisMessageListenerContainer();
        redisMessageListenerContainer.setConnectionFactory(redisConnectionFactory);
        redisMessageListenerContainer.addMessageListener(messageListenerAdapter,new PatternTopic("redisChat"));
        return redisMessageListenerContainer;
    }
}
