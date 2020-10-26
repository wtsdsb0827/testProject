package com.bgs.ssm.controller;

import com.bgs.ssm.pojo.User;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

/*
    递归练习
            1.汉诺塔,现在有三座高塔分别名为x y z ,并且在高塔x上按从小到大的顺序依次放上三个珠子，要求根据y塔，将x塔的棋子移动到z塔，
                要求一次只能移动一次，并且大的珠子不能放在小的珠子上面
            2.一般而言，兔子在出生两个月后，就有繁殖能力，一对兔子每个月能生出一对小兔子来。如果所有兔子都不死，那么一年以后可以繁殖多少对兔子？
 */
public class DiGui {

    static int count = 0;   //count 代表了移动的总次数

    public static void Hanoi(int n,char x,char y,char z){    //x y z 表示三个塔的位置
      count++;
      if(n==1){
          Move(n,x,z);
      }else{
          Hanoi(n-1,x,z,y);
          Move(n,x,z);
          Hanoi(n-1,y,x,z);
      }
    }

    private static void Move(int n, char x, char z) {
        System.out.println("移动"+n+"从"+x+"到"+z);
       /* System.out.println("Move"+n+"From"+x+"To"+y);*/
    }


    public static void main(String[] args){
       /* Hanoi(3,'x','y','z');
        System.out.println(count);*/

        System.out.println( fun(12));
    }


/*
    个人感觉是固定的
 */
    public static int fun(int m){
        if(m<2){
            return 1;
        }else{
            return fun(m - 1)+fun(m-2);
        }
    }






}
