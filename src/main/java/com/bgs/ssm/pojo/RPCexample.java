package com.bgs.ssm.pojo;

import com.bgs.ssm.controller.DiGui;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

/*
    需求：老师打开他的服务器，然后我们去连接，有两种方式：
            1.直接在浏览器上输入地址访问
            2.通过服务器与服务器值之间的远程通信（RPC）去进行访问，所以我们就需要以代码的方式去实现。
 */
@Controller
public class RPCexample implements Serializable{
    /*private static HttpServletResponse response;
    private static HttpServletRequest request;*/


   /* static HttpServletResponse response;
    static HttpServletRequest request;
    static HttpSession session;*/


    public static void main(String[] args) throws Exception {
                    /*
                        计算由Java代码发起Http请求时的效率问题
                     */
      /* List<Thread> threadList = new ArrayList<>();
        for (int i = 0; i < 50; i++) {
            Thread t = new Thread(new Runnable() {
                @Override
                public void run() {
                    for (int i = 0; i < 100; i++) {
                        try {
                            User user = RPCexample.UUU(6);
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            });
            threadList.add(t);
        }

        long start = System.currentTimeMillis();
        for (int i = 0; i < threadList.size(); i++) {
            threadList.get(i).start();
        }

        for (Thread t : threadList) {
            t.join();
        }

        long end = System.currentTimeMillis();
        System.out.println((end - start)/1000.0);*/

        Test();

    }


    public static User UUU(Integer id) throws IOException, InterruptedException {
        String user = "http://192.168.137.1:8800/user/"+id;  //获取url地址
        URL url = new URL(user); //使用URL工具类将地址存储进去
        URLConnection urlConnection = url.openConnection();  //打开这个地址
        InputStream inputStream = urlConnection.getInputStream();    //将这个url使用输入流的方式进行存储
        int available = inputStream.available();     //获取长度
        byte[] by = new byte[available];     //转换成字节数组并计算长度
        inputStream.read(by);

        String content = new String(by,"UTF-8");//给定编码格式
        System.out.println(content);
        inputStream.close();

        ObjectMapper oo = new ObjectMapper();   //序列化

        User user1 = oo.readValue(content, User.class);     //序列化成对象
        System.out.println(user1);
        return user1;
    }






    /*
        序列化对象
     */
    public static void Test() throws Exception {
        String user = "http://www.ouchn.cn/";
        URL url = new URL(user);
        URLConnection urlConnection = url.openConnection();
        InputStream inputStream = urlConnection.getInputStream();   //使用输入流读出来

        ObjectOutputStream outputStream = new ObjectOutputStream(new FileOutputStream("E://练习缓存文件//wenben.txt"));   //用输出流写进去

        /*byte[] data = new byte[1024];
        int len = -1;
        while ( ( len = inputStream.read(data)) != -1){
            // 处理当前缓冲区的数据
            outputStream.write(data,0,len);
        }*/

        byte[] data = new byte[1024];
        int length = -1;
        ByteArrayOutputStream bout = new ByteArrayOutputStream();
        /*StringBuilder sb = new StringBuilder();*/

        while ((length = inputStream.read(data))!= -1){
            bout.write(data,0,length);
        }

        String s = new String(bout.toByteArray());
        outputStream.writeObject(s);


        System.out.println("走了这一步了吗？？？");
        outputStream.flush();
        inputStream.close();
        outputStream.close();
    }


    /*
        反序列化到页面上，利用转发到页面上并且序列化的对象
     */
    @RequestMapping(value = "/Test1",method = RequestMethod.GET)
    public static void Test1 (HttpServletRequest request,HttpServletResponse response) throws Exception {
        ObjectInputStream inputStream = new ObjectInputStream(new FileInputStream("E://练习缓存文件//wenben.txt"));

        Object o = inputStream.readObject();
        System.out.println(o);

        response.setCharacterEncoding("UTF-8");
        request.setAttribute("o",o);
        request.getRequestDispatcher("success.jsp").forward(request,response);
    }








}
