package com.bgs.ssm.controller;
/*
    练习自定义注解的使用
 */
import com.bgs.ssm.controller.ZhuJie2.AnimalColor.Color;
import com.bgs.ssm.controller.ZhuJie2.AnimalColor;

import java.lang.annotation.*;

public class Dog {

    @AnimalName("hashiqi")
    private String dogName;

    @AnimalColor(AnimalColor=Color.RED)
    private String AnimalColor;


    public String getDogName() {
        return dogName;
    }

    public void setDogName(String dogName) {
        this.dogName = dogName;
    }

    public String getAnimalColor() {
        return AnimalColor;
    }

    public void setAnimalColor(String animalColor) {
        AnimalColor = animalColor;
    }




    /*
        动物名称
     */
    @Target(ElementType.FIELD)
    @Documented
    @Retention(RetentionPolicy.RUNTIME)

    public @interface AnimalName{
        String value() default "";  //int :类型  value():参数名称  default:默认访问修饰符
    }


}

