package com.bgs.ssm.controller;

import com.bgs.ssm.pojo.User;

import java.text.SimpleDateFormat;
import java.util.*;

public class LianXi {
    String name;
    int id;
    static String name1;

    /* 无参构造函数： */
    public LianXi() {

    }

    /*  有参构造函数：
              构造方法的特点：  1.函数名就是类名，没有返回值
                                2.如果没有指定调用具体函数，那么调用的就是默认无参构造函数
                                3.在一个类中，构造方法可以调用构造方法，但必须位于其第一行，构造方法也只能调用一个且仅一次构造器；但是在这个类中构造方法不能调用普通方法*/
    public LianXi(String name, Integer id) {
        this.id = id;
        this.name = name;
    }


    /* 静态方法
            静态方法的特点：1：用static修饰一个变量是静态变量
                            2：静态变量，直接使用类名，静态变量名赋值
                            3：静态变量在内存中只有一份
                            4：静态的方法就是不需要将类实例化就可以直接使用类名调用到方法或者属性。
                            5：如果静态方法需要调用普通方法的属性，那么可以通过在静态方法中创建对象来调用普通方法的属性和内容。*/
   /* public static void main(String[] args) {
        LianXi lianxi = new LianXi();
        lianxi.wer();
        LianXi.abc();
    }*/
    public static void abc() {
        asd();
    }


    /* 静态方法 */
    public static void asd() {
        System.out.println("我是静态变量直接使用类名调用的输出");
    }


    /* 普通方法*/
    public void wer() {
        System.out.println("wqqwwqwq");
    }

    String s = "Hello";

    public LianXi(String s) {
        System.out.println("s = " + s);
        System.out.println("1 -> this.s = " + this.s);
        this.s = s;
        System.out.println("2 -> this.s = " + this.s);
    }

    public void LianXi1(String s) {
        System.out.println("s = " + s);
        System.out.println("1 -> this.s = " + this.s);
        this.s = s;
        System.out.println("2 -> this.s = " + this.s);
    }


   /* public static void main(String[] args) {
        LianXi x=new LianXi("HelloWorld!!!");
        x.LianXi1("HelloWorld111");
    }*/


    public static void main(String[] args) {
       /*
删除arrayList中相同的数据
       List<String> list = new ArrayList<>();
        list.add("5");
        list.add("5");
        list.add("6");
        list.add("5");
        list.add("4");
        list.add("4");

      for (int i=0;i<list.size();i++){        //第一个循环下标为0，第一个元素为5     从前往后删除
           for(int f=i+1;f<list.size();f++){
               if(list.get(i).equals(list.get(f))){
                    list.remove(f);
                    f--;
               }
           }
        }
            System.out.println(list);





       for (int i=0;i<list.size();i++){ //    从后往前删除
            String s = list.get(i);
            for(int f=list.size()-1;f>i;f--){
                String s1 = list.get(f);
                if(s.equals(s1)){
                        list.remove(f);
                    System.out.println(list);
                    }

            }
        }
        System.out.println(list);

        */






       /*
                双色球
       List<Integer> hongse =new ArrayList<>();
        List<String> lanse =new ArrayList<>();
        while (hongse.size()<2){
            Random random = new Random();
            int aa = random.nextInt(5);
            if(aa>0){
                if(!hongse.contains(aa)){
                    hongse.add(aa);
                    System.out.println("红色："+aa);

                }
            }
        }
        while (lanse.size()<2){
            Random random = new Random();
            int aa = random.nextInt(5);
            if(aa>0){
                if(!hongse.contains(aa)){
                    hongse.add(aa);
                    System.out.println("蓝色："+aa);
                }
            }
        }*/
        /*int str1[] = {1,2,3,4,5};
        int str2[] = new int[10];*/

        /*
                                        数组的array Copy方法
                public static void arraycopy(Object src,int srcPos,Object dest,int destPos,int length)
                src:源数组；
                srcPos:源数组要复制的起始位置；
                dest:目的数组；
                destPos:目的数组放置的起始位置；
                length:复制的长度。
                注意：src and dest都必须是同类型或者可以进行转换类型的数组．


                   String str[] = new String[]{"hello","李","盈","霏"};
                   String str2[] = new String[7];
                   System.arraycopy(str,0,str2,0,4);
                   for (String shuzu1:str2){
                       System.out.println(shuzu1);
                   }

        */

      /*  int a=5;
        int b=10;


        String str[] = new String[10];  //大括号里面放长度
        String str1[] = {"李盈霏","大","母","猪"};    //花括号里放元素
        for(String shuzu1:str){
            System.out.println(shuzu1);         //数组的增强for循环
        }

        for (String shuzu2:str1){
            System.out.println(shuzu2);
        }*/




      /*  String aa ="asd";		//存在于常量池中
        String bb = new String("bsd");	//存在于堆内存中
        bb=aa;	//bb的值确实是变了，在内存中bb改变的其实是
        System.out.println(aa);*/

       /*LianXi ll = new LianXi();
       ll.id=13232;
       ll.fangfa();*/

/*
      HashMap<String,Object> map = new HashMap<>();
      map.put("11",111);
        map.put("22",122);
        map.put("33",331);
      for (String mm:map.keySet()){
          System.out.println("key:"+mm+"value:"+map.get(mm));
      }*/

       /* long currentTime = System.currentTimeMillis();
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy年-MM月dd日-HH时mm分ss秒");
        Date date = new Date(currentTime);
        System.out.println(formatter.format(date));*/



      /*  LianXi ll = new LianXi();
        for (int i=0;i<20;i++){
            System.out.println(ll.count);
        }*/


    }


    private void fangfa() {
        fangfa2(this);
    }

    private void fangfa2(LianXi lianXi) {
        System.out.println(id);
    }





}







