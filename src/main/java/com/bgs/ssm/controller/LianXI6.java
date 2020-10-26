package com.bgs.ssm.controller;

import java.util.*;

class LianXi6 {

    public static void main(String[] args) {

        List<User3> list = new ArrayList<>();
        list.add(new User3("z张三",17));
        list.add(new User3("b张三",16));
        list.add(new User3("a张三",15));

        User3[] arr = new User3[list.size()];
        list.toArray(arr);


        //将list集合中的元素进行排序（使用 Collections.sort方法）
        Collections.sort(list, new Comparator<User3>() {
            @Override
            public int compare(User3 o1, User3 o2) {
                return o1.name.compareTo(o2.name);
            }
        });

        //将list集合转换成数组（toArray），然后使用Arrays.sort方法对集合中的元素进行排序
        Arrays.sort(arr, new Comparator<User3>() {
            @Override
            public int compare(User3 o1, User3 o2) {
                return o1.age-o2.age;
            }
        });

        for (Object ss:arr){
            System.out.println(ss);
        }

    }

    static class User3 {
        String name;
        int age;

        public User3(String name, int age) {
            this.name = name;
            this.age = age;
        }

        @Override
        public String toString() {
            return "User{" +
                    "name='" + name + '\'' +
                    ", age=" + age +
                    '}';
        }
    }
}
