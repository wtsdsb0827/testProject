package com.bgs.ssm.controller;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

public class Raf {

    //RandomAccessFile写入文件
    public static void write() throws IOException {
        //rw:以读写的方式来访问该文件
        RandomAccessFile raf = new RandomAccessFile("E:\\lianxi.txt", "rw");
        //添加数据到文件下标为10的位置
        raf.seek(10);
        //向文件中写入String类型的数据
        raf.writeBytes("Hello World!");
        //关闭流
        raf.close();
    }

    //RandomAccessFile读取文件
    public static void read() throws IOException {
        RandomAccessFile raf = new RandomAccessFile("E:\\lianxi.txt", "r");
        //读取下标为100的位置的数据
        raf.seek(100);
        //设置数组长度100
        byte[] bytes = new byte[100];
        for (int i=0; i<bytes.length; i++)
            //每次读一个字节，并把它赋值给字节bytes[i]
            bytes[i] = raf.readByte();
        //将byte转成String
        String stringValue = new String(bytes);
        raf.skipBytes(1);//指针跳过一个字节
        raf.close();
        System.out.println(stringValue);
    }

    //RandomAccessFile写入文件
    public static void write2() throws Exception {
        RandomAccessFile raf = new RandomAccessFile("E://lianxi3.txt","rw");
        String str = "我是1";
        byte[] bytes = str.getBytes("utf-8");
        raf.write(bytes);
        str = "我是2";
        bytes = str.getBytes("utf-8");
        raf.write(bytes);
        raf.close();
    }


    //RandomAccessFile读取文件
    public static void read2() throws Exception {
        RandomAccessFile raf = new RandomAccessFile("E://lianxi.txt","rw");
        byte[] bytes = new byte[(int)raf.length()];
        raf.read(bytes);
        //将byte转成String
        String line = new String(bytes,"utf-8");
        System.out.println(line);
        raf.close();
    }




    //RandomAccessFile类可以读写基本类型的数据。以及基于指针的操作
    public static void WR() throws Exception{
        RandomAccessFile randomAccessFile = new RandomAccessFile("E://lianxi.txt","rw");
        long pp = randomAccessFile.getFilePointer();//返回此文件中的当前指针的偏移量。
        System.out.println("pp:"+pp);   //pp:0


        int max = Integer.MAX_VALUE;
        randomAccessFile.write(max>>>24);
        System.out.println("pp:"+randomAccessFile.getFilePointer());

        randomAccessFile.write(max>>>16);
        randomAccessFile.write(max>>>8);
        randomAccessFile.write(max);
        System.out.println("pp:"+randomAccessFile.getFilePointer());

        randomAccessFile.writeInt(max);
        System.out.println("pp:"+randomAccessFile.getFilePointer());

        randomAccessFile.writeLong(123L);
        System.out.println("pp:"+randomAccessFile.getFilePointer());

        randomAccessFile.writeDouble(123.123);
        System.out.println("pp:"+randomAccessFile.getFilePointer());
        System.out.println("写出完毕");


        randomAccessFile.seek(0);//设置文件指针偏移量
        System.out.println("pp:"+randomAccessFile.getFilePointer());

        int i = randomAccessFile.readInt();
        System.out.println(i);
        System.out.println("pp:"+randomAccessFile.getFilePointer());

        randomAccessFile.seek(8);
        long l = randomAccessFile.readLong();
        System.out.println(l);
        System.out.println("pp:"+randomAccessFile.getFilePointer());

        double v = randomAccessFile.readDouble();
        System.out.println(v);
        System.out.println("pp:"+randomAccessFile.getFilePointer());

        randomAccessFile.seek(8);

        randomAccessFile.writeLong(456L);
        randomAccessFile.seek(8);
        long ll = randomAccessFile.readLong();
        System.out.println(ll);

        randomAccessFile.close();
    }








}
