package com.bgs.ssm.pojo;

public class ZiLei extends  FuLei{

    public static void main(String[] args) {
        ZiLei ziLei = new ZiLei(10);
       /* Class<? extends FuLei> aClass = fu.getClass();
        FuLei zi = (FuLei) new ZiLei();
        Class<? extends FuLei> aClass1 = zi.getClass();
        boolean equals = aClass.equals(aClass1);
        System.out.println(equals);*/
        /*int eat = ziLei.getEat();
        System.out.println(eat);*/

    }

    public ZiLei(int eat) {
        super(eat);
    }
}
