package com.bgs.ssm.controller;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@PropertySource("classpath:/test.properties")
public class MyTest2 {

    @Value("${test.mytest.s1}")
     String s1;
    @Value("${test.mytest.s2}")
     int s2;

    public String getS1() {
        return s1;
    }

    public void setS1(String s1) {
        this.s1 = s1;
    }

    public int getS2() {
        return s2;
    }

    public void setS2(int s2) {
        this.s2 = s2;
    }

    @Override
    public String toString() {
        return "MyTest2{" +
                "s1='" + s1 + '\'' +
                ", s2=" + s2 +
                '}';
    }
}
