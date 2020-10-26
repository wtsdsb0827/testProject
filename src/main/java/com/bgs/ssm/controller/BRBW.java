package com.bgs.ssm.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;

/*
    BufferReader 和BufferWriter
 */
public class BRBW {

    //使用BufferedReader读取文件中的数据
    public static void Br() throws Exception{
        //缓冲区为了提高流的操作效率，所以创建缓冲区之前必须先有流对象
        BufferedReader br = new BufferedReader(new FileReader("E://lianxi3.txt"));
        String line = null;
        /*
        * java封装的方法，方便程序员统一使用的换行命令
        * 可以读取一行字符串，不含任何终止符
        * 当读到文件末尾行后，返回null，可以作为循环的控制条件
         */
        while ((line=br.readLine())!=null){
            System.out.println(line);
        }
        //缓冲区关闭，流对象也就关闭了
        br.close();
    }

    //使用BufferedReader读取文件中的数据
    public static void Bw() throws Exception{
        BufferedWriter bw = new BufferedWriter(new FileWriter("E://lianxi3.txt"));
        bw.write("abc");
        //换行写入
        bw.newLine();
        bw.write("ABC");

        //flush方法，将存在于系统缓冲区中的数据刷新到文件中
        bw.flush();
        //缓冲区关闭，流对象也就关闭了
        bw.close();
    }

    public static void main(String[] args) throws Exception{
        /*Bw();*/
        Br();
    }
}
