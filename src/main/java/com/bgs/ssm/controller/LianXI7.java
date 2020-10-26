package com.bgs.ssm.controller;
/*
    文件的读取和写入
 */
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

/*
    流的使用（读取和写入）
 */
public class LianXI7 {
    public static void main(String[] args) throws IOException {
        File file1 = new File("E:/练习读文件/abc2/hello.txt");
        /*file.mkdir(); */               //创建文件下的一级目录
        /* file.mkdirs(); */             //创建文件下的层级目录
       /* file.isDirectory();*/     //判断是否是目录
       /* file.isFile(); */     //判断是否是文件

      /*
            JDK8:使用Files工具类进行文件的读取和写入
       */
       try {
           byte[] array = Files.readAllBytes(Paths.get("E:/练习读文件/abc2/hello.txt")); //读取    返回数组，需要转换成字符串
           List<String> strings = Files.readAllLines(Paths.get("E:/练习读文件/abc2/hello.txt"));//读取     返回字符串，不需要转换

           Files.write(Paths.get("E:/练习读文件/abc2/hello2.txt"),array); //写入  array就代表读取的目标文件的字节数组
            String str = new String(array);
            System.out.println(str);
           System.out.println(strings);
        } catch (IOException e) {
            e.printStackTrace();
        }



        /*
            使用for循环进行读取和写入文件，场景应用在文件比较大的时候使用，比如说5G这样比较大的文件，你不能一个一个的调用read方法，所以我们就会使用到循环。
         */
        File file = new File("E:/练习读文件/abc2/hello.txt");
        File file2 = new File("E:/练习读文件/abc2/hello3.txt");
        FileInputStream fi = new FileInputStream(file);     //读取文件
        FileOutputStream fi2 = new FileOutputStream(file2,true);     //写入文件，        append可以实现文件写入之后的追加
        byte[] by = new byte[fi.available()];      //字节数组的长度就是文件字节码的长度
        int data = -1;
        int i=0;
        while ((data=fi.read())!=-1){     //先计算括号中的，data设置初始值为-1，然后data=fi.read()，fi.read读取流读出的按照for循环来一个一个读取的字节。他跟fi.available()不一样，后者是字节的长度。
            by[i++]=(byte)data;
            fi2.write(data);    //写入
        }
            fi.close();
        String s = new String(by);  //因为计算机中显示的都是字节，我们显示需要以字符串的形式，所以涉及到字符和字符串之间的转换问题。
        System.out.println(s);

    }
}
