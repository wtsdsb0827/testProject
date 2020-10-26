package com.bgs.ssm.util;

import com.bgs.ssm.controller.Dog;
import com.bgs.ssm.controller.ZhuJie2.AnimalColor;

import java.lang.reflect.Field;

/*
    自定义注解的工具类
 */
public class ZhujieUtil {



    public static void getAnimalInfo(Class<?> cl){

        String sAnimalName = "动物名称:";

        String sAnimalColor = "动物颜色:";

        Field[] declaredFields = cl.getDeclaredFields();

        for(Field ff:declaredFields){
            if(ff.isAnnotationPresent(Dog.AnimalName.class)){
                Dog.AnimalName annotation = ff.getAnnotation(Dog.AnimalName.class);
                sAnimalName = sAnimalName+annotation.value();
                System.out.println(sAnimalName);
            }else if(ff.isAnnotationPresent(AnimalColor.class)){
                AnimalColor annotation2 = ff.getAnnotation(AnimalColor.class);
                sAnimalColor =sAnimalColor+annotation2.AnimalColor().toString();
                System.out.println(sAnimalColor);
            }
        }
    }


    public static void main(String[] args) {
        ZhujieUtil.getAnimalInfo(Dog.class);
    }



}
