package com.bgs.ssm.controller;

import com.bgs.ssm.pojo.FuLei;
import org.springframework.boot.context.properties.ConfigurationProperties;

/*
    字符串常量池
 */
public class StringConstantpool {



    public static void main(String[] args) {


        //str1 和str2这两个局部变量存在于常量池中
        String str1 = "abc";
        String str2 = "abc";

        System.out.println(str1==str2);

        //s1和s2存在于堆内存中，原因是new出来的是一个新的对象，这两个对象在内存堆中，并且内存地址不相同
        String s1 = new String();
        String s2 = new String();

        FuLei f = new FuLei(10);
        FuLei f1 = new FuLei(10);

        System.out.println();
        //对象的比较要用到equals方法来比较
        System.out.println(s1.equals(s2));  //因为String这个类在内部重写了equals方法
        System.out.println(f.equals(f1));

        //如果要f和f1显示为true，就需要在当前类中重写equals和HashCode

        String str = "1";
        System.out.println(str.hashCode());


    }
}
