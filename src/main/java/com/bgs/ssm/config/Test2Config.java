package com.bgs.ssm.config;

import com.bgs.ssm.controller.MyTest2;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

@Configuration
@PropertySource("classpath:/test.properties")
public class Test2Config {
    @Bean
    public MyTest2 myTest234(){
        return new MyTest2();
    }
}
