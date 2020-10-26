package com.bgs.ssm.controller;
/*
    二进制与十进制之间的相互转换
 */
public class Test {
    public static void main(String[] args) {

        System.out.println(ZhuangHuan1("00110010",2));


        System.out.println(~50);


        System.out.println(ZhuanHuan(8));
    }

    //十进制数转二进制
    public static String ZhuanHuan(int num){
        String str = "";
        while (num!=0){
            str =str+ num % 2;  //str = str+ num % 2:得到的结果不一样
            num = num/2;
        }
        return str;
    }

    //二进制转十进制
    public static int ZhuangHuan1(String s,int i){
        int i1 = Integer.parseInt(s, i);
        return i1;
    }
}
