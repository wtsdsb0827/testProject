package com.bgs.ssm.controller;

public class LianXi2 {

    static  int count = 0;
    {
        count++;        //这个代码块就相当于是构造代码块，会在静态的东西调用完后在调用。所以在我们计算new多少对象时就无需使用构造了。
    }

    public int count(){
        count++;
        return count;
    }


    public boolean login(){
        return true;
    }

    public static void main(String[] args) {

    new LianXi2();
        new LianXi2(); new LianXi2(); new LianXi2();
        new LianXi2();
        new LianXi2();


        System.out.println(LianXi2.count);  //计算创建对象的次数
    }


  /*  public LianXi2(){
        count++;
    }
*/

}
