package com.bgs.ssm.config;
/*
    自定义redisComplate
 */

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.connection.RedisConnectionFactory;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;

@Configuration
public class RedisConfig {



    //序列化存进redis的内容
    @Bean
    RedisTemplate<Object,Object> redisTemplate(RedisConnectionFactory redisConnectionFactory){
        RedisTemplate<Object, Object> ObjectRedisTemplate = new RedisTemplate<>();
        ObjectRedisTemplate.setConnectionFactory(redisConnectionFactory);
        ObjectRedisTemplate.setKeySerializer(RedisSerializer.string());
        ObjectRedisTemplate.setValueSerializer(RedisSerializer.json());
        return ObjectRedisTemplate;
    }


    //redis消息实现队列,作为消息队列的发布者
    @Bean
    public StringRedisTemplate getRedisTemplate(RedisConnectionFactory redisConnectionFactory){
        return new StringRedisTemplate(redisConnectionFactory);
    }
}
