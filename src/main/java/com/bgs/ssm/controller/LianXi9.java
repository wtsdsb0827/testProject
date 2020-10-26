package com.bgs.ssm.controller;

import java.util.Arrays;

public class LianXi9 {

    public static void main(String[] args) {



        }

    //1.有一个数组 String[] a = {“aa”,”bb”,”cc”,”dd”}, 新建一个数组b，将数组a内容拷贝到数组 b 中
    public void First(){
        String[] a = {"aa","bb","cc","dd"};
        String ss = Arrays.toString(a);
        String b = "";
        for (int i=0;i<ss.length();i++){
            b = ss;      //先将数组中的数据存放到b这个字符串中
        }
        char[] arr = b.toCharArray();      //将b转成数组
        System.out.println(arr);
    }


    //2.有一个数组：{“aa”,”bb”,”cc”,”dd”}，写一个循环，找到“cc”，并打印它的下标
    public void Second(){
        String[] d={"aa","bb","cc","dd"};
        int k=0;
        for(int i=0;i<d.length;i++){
            if(d[i].equals("cc")){
                k=i;
                System.out.println("当前元素为："+d[k]);
                System.out.println("下标为："+k);
            }
        }
    }

        //3.循环输出以下格式：
        /*
            2 + 5 = 7
            4 + 10 = 14
            6 + 15 = 21
              ……
            ? + 100 = ?
        */
    public void Third(){            //先运行第一个，再循环后面的结果
        int x = 2;
        int y = 5;
        for(int i=0;i<20;i++){  //只循环20次
            System.out.print(x + " + " + y + " = " ); // 2+5      (2+2) +(5+5)
            System.out.println(x + y);                  //   7            14
            x+=2;                   //x+2
            y+=5;                   //y+5
        }
    }

    //4.循环输出1到100中所有能被4整除但不能被8整除的数
    public void Forth(){
        for (int i=0;i<100;i++){
            if(i%4==0&&i%8!=0){
                System.out.println(i);
            }
        }
    }

    //5.使用循环计算1 + 1/2 + 1/4 + 1/8 + 1/16 + … + 1/128的值
    public void Fifth(){
        double d = 1.0;
        for(int i=2;i<65;i*=2){
            d+=1.0/i;
        }
        System.out.println(d);
    }

    //6.求  1 -  1/2  + 1/3+  1/4 +  ... +  1/49  -  1/50 的值          1-1/2=1/2       这个式子就变成  1/2 + 1/3+  1/4 +  ... +  1/49   -1/50
    public void Sixth(){
        int dd = 1;
        for(int i=1;i<51;i++){
            dd+=1/i-1/50;
        }
        System.out.println(dd);
    }

    //7.已知数组int[] a={10,20,30,40,50,60}; 使用交换反序使数组变成a={60,50,40,30,20,10}
    public void Seventh(){
        int[] a ={10,20,30,40,50,60};
        int [] b=new int[6];
        int j=0;
        for(int i=a.length-1;i<a.length&&i>-1;i--){
            b[j]=a[i];           // a[5]=60   b[j]=60
            j++;
            if(j==b.length){
                break;
            }
        }
        System.out.println(Arrays.toString(b));
    }
}
