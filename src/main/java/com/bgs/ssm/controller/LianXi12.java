package com.bgs.ssm.controller;

import com.bgs.ssm.pojo.Batch;
import com.bgs.ssm.pojo.User;

import java.lang.reflect.Constructor;
import java.util.ArrayList;
import java.util.List;


public class LianXi12 {


    public static void main(String[] args) throws Exception {

        //反射
        Batch batch = new Batch();


        Class<? extends Batch> aClass = batch.getClass();


        Constructor<? extends Batch> declaredConstructor = aClass.getDeclaredConstructor(int.class);
        Constructor<? extends Batch> declaredConstructor1 = aClass.getDeclaredConstructor(int.class, String.class);
        //获取单个或者多个私有的或者公共的构造函数,如果要获取多个就使用getDeclaresConstructors(数据类型.c参数名1，数据类型.参数名2)，
        //记住，如果要访问私有的就一定开启暴力访问。
        declaredConstructor.setAccessible(true);
        declaredConstructor1.setAccessible(true);

        Batch batch1 = declaredConstructor.newInstance(10);
        Batch batch2 = declaredConstructor1.newInstance(10, "dsfsdf");

        System.out.println(batch1);
        System.out.println(batch2);


    }


    //枚举
     enum Day {
        One(4234), Two(2), Three(3);

        private final int sss;

        private Day(int sss) {
            this.sss = sss;
        }

        public static void Day(int s) {
            switch (s) {
                case 1:
                    System.out.println(Day.One);
                    break;

                case 2:
                    System.out.println(Day.Two);
                    break;
                case 3:
                    System.out.println(Day.Three);
                    break;
                default:
                    System.out.println("你是猪！！！");
                    break;
            }
        }

        public static void main(String[] args) {
            /*Day(1);*/
        }

    }
}

