package com.bgs.ssm.controller;

import java.lang.annotation.*;

/*
    练习自定义注解的使用
            动物颜色
 */
public class ZhuJie2 {

    @Target(ElementType.FIELD)
    @Retention(RetentionPolicy.RUNTIME)
    @Documented
    public @interface AnimalColor{
        public enum Color{
            BLUE,RED,GREEN
        };
        Color AnimalColor() default Color.BLUE;
    }

}
