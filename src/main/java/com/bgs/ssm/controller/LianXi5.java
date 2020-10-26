package com.bgs.ssm.controller;

import java.util.Comparator;
import java.util.SortedSet;
import java.util.TreeSet;

public class LianXi5 {
    /*
        集合类的排序：我们在使用集合类set时知道：set是无序不可重复的，在set集合类中有一个特殊的接口：SortedSet，
        我们使用Integer类中实现的comparable接口
        和Comparator接口来对集合中的元素进行比较。
        */


           /* SortedSet set =new TreeSet<User>((User user1,User user2) ->{  //   JAVA8语法  ->前的是方法声明 后的是方法体
                return user1.age=user2.age;
            });*/
           public static void main(String[] args) {
               SortedSet set1 = new TreeSet(new Comparator<User2>() {        //new Comparator<User>()实际上就是先new对象，比如说对象为new  ABC（）,然后实现  Comparator接口，最后简写成new Comparator接口.
                   @Override
                   public int compare(User2 o1, User2 o2) {
                       /*return o1.age-o2.age;*/
                       return o1.name.compareTo(o2.name);
                   }
               });

               set1.add(new User2(15,"b张三"));
               set1.add(new User2(30,"a张三"));
               set1.add(new User2(2,"z张三"));


               for (Object ss:set1){
                   System.out.println(ss);
               }
           }
}


class User2{
    int age;
    String name;


    public User2(int age,String name){
        this.age=age;
        this.name=name;
    }

    @Override
    public String toString() {
        return "User{" + "age=" + age + ", name='" + name + '\'' + '}';
    }
}
