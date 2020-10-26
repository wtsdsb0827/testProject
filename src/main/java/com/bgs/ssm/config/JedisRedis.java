package com.bgs.ssm.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/*
    通过这个类将redis交给Spring Boot管理
 */
@Configuration
public class JedisRedis {

    @Autowired
    Environment en;

    @Bean(name="sss")
    JedisPool createJedisPool2(){
        JedisPoolConfig config = new JedisPoolConfig();
        JedisPool pool = new JedisPool(

                config,
                en.getProperty("spring.redis.host"),
                en.getProperty("spring.redis.port",Integer.class),
                en.getProperty("spring.redis.timeout",Integer.class),
                en.getProperty("spring.redis.password")
        );
        return pool;
    }

/*
    @Bean
    JedisPool createJedisPool(){
        JedisPoolConfig config = new JedisPoolConfig();
        config.setMaxTotal(10);
        config.setMinIdle(3);
        config.setMaxIdle(6);
        JedisPool pool = new JedisPool(config,"localhost",6379,2000,"wts");
        return pool;
    }*/

    //@Primary       表示先走这个bean，防止两个Bean发生冲突，这是第一种解决方案，第二种解决方案就是再Bean中定义name，这个name就相当于是id。





    @Bean
    @ConfigurationProperties(prefix = "lianjiechi")
    JedisPoolConfig jedisPoolConfig(){
        JedisPoolConfig jedisPoolConfig2 = new JedisPoolConfig();
        System.out.println(jedisPoolConfig2.getMaxIdle());
        return jedisPoolConfig2;
    }

    @Bean
    JedisPool createJedisPool3(JedisPoolConfig jedisPoolConfig){
        System.out.println("maxIdle:" + jedisPoolConfig.getMaxIdle());
        return null;
    }

}
