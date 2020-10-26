package com.bgs.ssm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

/*@SpringBootApplication(scanBasePackages = {"com.bgs"})*/    //相当于是Spring中的自动扫描
@EnableAutoConfiguration
@Configuration
@ComponentScan
public class ChuShiController1 {
    public static void main(String[] args) {
        SpringApplication.run(ChuShiController1.class,args);
    }
}
