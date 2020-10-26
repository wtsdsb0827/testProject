package com.bgs.ssm.controller;

import com.bgs.ssm.pojo.Batch;

import java.lang.invoke.ConstantCallSite;
import java.lang.reflect.Constructor;

/*
    反射
 */
public class FanShe {



    public static void main(String[] args) throws Exception {
        Batch batch = new Batch();

        Class cc = Batch.class;

        /*System.out.println(batch.getClass());
        System.out.println(Batch.class);
        System.out.println(Class.forName("com.bgs.ssm.pojo.Batch"));
        System.out.println(batch.getClass().equals(Batch.class));
        System.out.println(batch.getClass().equals(Class.forName("com.bgs.ssm.pojo.Batch")));*/


        Constructor con = cc.getConstructor();
                        System.out.println(con);
        Constructor declaredConstructor = cc.getDeclaredConstructor();
                        System.out.println(declaredConstructor);
        Constructor[] declaredConstructors = cc.getDeclaredConstructors();
        for(Constructor c1:declaredConstructors){
                        System.out.println(c1);
        }


        Constructor[] constructors = cc.getConstructors();
        for(Constructor c2:constructors){
            System.out.println(c2);
        }

        Constructor d1 = cc.getDeclaredConstructor(int.class);

        //开启暴力访问，可以访问私有的或者是公有的。
        d1.setAccessible(true);
        //实例化这个对象
        Object o = d1.newInstance(1);
        System.out.println("wwwwww==="+o);


    }

}
