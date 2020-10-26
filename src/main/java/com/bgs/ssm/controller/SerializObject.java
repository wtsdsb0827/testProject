package com.bgs.ssm.controller;

import java.io.*;

/*
    序列化
 */
public class SerializObject{

    private long serialVersionUID = 4234234231L;

    private int id;
    transient String name;  //transient表示不被序列化
    private String age;
    private String sex;

    public long getSerialVersionUID() {
        return serialVersionUID;
    }

    public void setSerialVersionUID(long serialVersionUID) {
        this.serialVersionUID = serialVersionUID;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }


    @Override
    public String toString() {
        return "SerializObject{" + "serialVersionUID=" + serialVersionUID + ", id=" + id + ", name='" + name + '\'' + ", age='" + age + '\'' + ", sex='" + sex + '\'' + '}';
    }

    /*
            序列化对象
     */
    public static void Serialize() throws Exception{
        SerializObject ser = new SerializObject();
        ser.id=1;
        ser.setAge("67");
        ser.setName("肯德基");
        ser.setSex("男生");
        ObjectOutputStream oout = new ObjectOutputStream( new FileOutputStream("E://序列化//symbol.txt"));
        oout.writeObject(ser);
        System.out.println("序列化走到这一步了！！！");

        oout.flush();
        oout.close();
    }

    /*
        反序列化对象
     */
    public static SerializObject Deserialize() throws Exception{
        ObjectInputStream oji = new ObjectInputStream(new FileInputStream("E://序列化//symbol.txt"));
        SerializObject ser = (SerializObject) oji.readObject();
        System.out.println("看看反序列到没到这一步！！！");
        oji.close();
        System.out.println(ser);
        return ser;
    }

    public static void main(String[] args) throws Exception {
        Serialize();
        Deserialize();
    }


    /*
        总结：
                1.序列化和反序列可以分开执行，也可以一起执行，只要保证文件中有二进制字节流数组
                2.序列化就是将对象实现Serializable接口后，然后把对象以流的方式转换为二进制字节流数组存储到磁盘中。
                3.反序列化就是将磁盘中的二进制字节流数组转换为对象的形式。
                4.对象的序列化和反序列化主要就是使用ObjectOutputStream 和 ObjectInputStream


                5.为什么需要进行序列化？
                    当两个进程进行远程通信时，可以相互发送各种类型的数据，包括文本、图片、音频、视频等，而这些数据都会以二进制序列的形式在网络上传送。
                    一方面，发送方需要把这个Java对象转换为字节序列，然后在网络上传送；另一方面，接收方需要从字节序列中恢复出Java对象。

                6.序列化实现了两个进程之间传递对象的过程。
                7.记住，对象流不序列化static或transient。我们的类要用writeObject()与readObject()方法以处理这些数据成员。

                8.使用writeObject()与readObject()方法时，还要注意按写入的顺序读取这些数据成员
                9.write Object*（）和Read Object（）这两个方法需要同时使用。

                10.序列化运行时使用一个称为 serialVersionUID 的版本号与每个可序列化类相关联，该序列号在反序列化过程中用于验证序列化对象的发送者和接收者是否为该对象加载了与序列化兼容的类。为它赋予明确的值。显式地定义serialVersionUID有两种用途：
                在某些场合，希望类的不同版本对序列化兼容，因此需要确保类的不同版本具有相同的serialVersionUID；
                在某些场合，不希望类的不同版本对序列化兼容，因此需要确保类的不同版本具有不同的serialVersionUID。

                11.如果一个对象的成员变量是一个对象，那么这个对象的数据成员也会被保存！这是能用序列化解决深拷贝的重要原因；
     */

}



