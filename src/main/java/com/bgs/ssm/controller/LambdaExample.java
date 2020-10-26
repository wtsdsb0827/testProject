package com.bgs.ssm.controller;
/*
    Lambda 表达式实例
 */
public class LambdaExample {

/* final static String lambda = "Hello";*/

    public static void main(String[] args) {


         String lambda = "Hello";
        LambdaExample lambdaExample = new LambdaExample();

        //使用类型声明(两种声明方式)
       /* First first1 = (int a,int b) -> {return a + b; };*/
        First first2 = (int a,int b) -> a+b;
        System.out.println("5+3="+lambdaExample.operate(5,3,first2));


        //不使用类型声明
        First first3 = (a,b) -> a-b;
        /*First first4 = (a,b) -> {return a-b;};*/
        System.out.println("5-3="+lambdaExample.operate(5,3,first3));


        //使用括号,不写参数
        Second second1 =(message) ->
        System.out.println(lambda+"\t"+message);
        second1.operation1("Windows");


        //不使用括号,不写参数
        Second second2 = message ->
        System.out.println(lambda+"\t"+message);
        second2.operation1("Linux");

    }

  public interface First{
      public int operation(int a, int b);       //接口中的方法
   }

   public interface Second{
        public void operation1(String message);
   }

   private int operate(int a,int b,First first){    //当前类中的私有方法
        return first.operation(a,b);
   }

}
