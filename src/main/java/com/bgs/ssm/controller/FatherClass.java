package com.bgs.ssm.controller;

/*
    FatherClass
 */
public class FatherClass implements Cloneable{

    public int age;
    public ChildClass child;    //子类对象

    public Object clone() {
        try {
            return super.clone();
           /* FatherClass kaoBei = (FatherClass) super.clone();
            kaoBei.child = (ChildClass) this.child.clone();
            return kaoBei;*/
        } catch (CloneNotSupportedException e) {
            e.printStackTrace();
        }
        return null;
    }


    public static void main(String[] args) throws CloneNotSupportedException {
        FatherClass kaoBei = new FatherClass();

        kaoBei.child=new ChildClass();
        kaoBei.age=3232;

        FatherClass clone = (FatherClass) kaoBei.clone(); //调用clone就会创建一个新的对象


        System.out.println(kaoBei.equals(clone));
        System.out.println(kaoBei.child==clone.child);  //调用child可以看出，他们两个还是同一个对象

    }

    private static class  ChildClass implements Cloneable{

        public int age;

        public Object clone() {
            try {
                return super.clone();
            } catch (CloneNotSupportedException e) {
                e.printStackTrace();
            }
            return null;
        }
    }
}
