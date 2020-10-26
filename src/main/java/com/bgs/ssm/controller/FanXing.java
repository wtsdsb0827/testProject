package com.bgs.ssm.controller;
/*
    泛型的练习
 */
public class FanXing<T> {


    private T t;

    public T getT() {
        return t;
    }

    public void add(T t){
        this.t=t;       //调用add方法存储到当前对象的t中
    }

    //1.定义在方法声明中
    public static <E> void FanXing(E[] shuzu){
        for(E ee:shuzu){
            System.out.printf("%s",ee);     //%表示进行格式化输出，后面的内容就是格式的定义，在这里的s表示输出字符串。
       }
        System.out.println();
    }


    //1.定义在方法声明中
    /*public static void main(String[] args) {
        Integer[] integers = {1,2,3};
        Double[] doubles = {1.1,1.2,1.3};

        FanXing(integers);
        FanXing(doubles);
    }*/


    //2.定义在类上
    public static void main(String[] args) {
        FanXing<String> str = new FanXing<>();
        FanXing<String> str1 = new FanXing<>();
        FanXing<String> str2 = new FanXing<>();

        str2.add("送给19岁的自己");
        str.add("，告诉自己，我一定可以");

        System.out.println(str2.getT()+str.getT()+""+str1.getT());
    }
}
