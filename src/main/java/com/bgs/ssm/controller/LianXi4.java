package com.bgs.ssm.controller;

import java.util.SortedSet;
import java.util.TreeSet;

public class LianXi4 {

    public static void main(String[] args) {
        SortedSet set = new TreeSet();
        set.add(new User1(15,"a张三"));
        set.add(new User1(20,"c张三"));
        set.add(new User1(5,"b张三"));

        for (Object ss:set){
            System.out.println(ss);
        }

    }





   public static class User1 implements Comparable<User1>{
        int age;
        String name;

        public User1(int age, String name) {
            this.age = age;
            this.name = name;
        }

        @Override
        public String toString() {
            return "User{" +
                    "age=" + age +
                    ", name='" + name + '\'' +
                    '}';
        }

        @Override
        public int compareTo(User1 o) {
           /* return this.name.compareTo(o.name);*/
            return this.age-o.age;
        }
    }
}
