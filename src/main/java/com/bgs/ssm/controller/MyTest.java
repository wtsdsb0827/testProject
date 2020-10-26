package com.bgs.ssm.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@ConfigurationProperties(prefix="oop")
public class MyTest {

    @Value("fdsfsdfsd")
    String jos;
    int pot;

    public String getJos() {
        return jos;
    }

    public void setJos(String jos) {
        this.jos = jos;
    }

    public int getPot() {
        return pot;
    }

    public void setPot(int pot) {
        this.pot = pot;
    }
}
