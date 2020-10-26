package com.bgs.ssm.controller;
/*
            算法的练习
 */
import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;

public class LianXi3 {
    public static void main(String[] args) throws IOException{


        YaSuo();


    }





    /*    得到某个文件夹下面的所有目录(递归方法)      */
    public static void  PPP(File file){
        File[] files = file.listFiles();
        for (File ff:files){
            System.out.println(ff);
            if(ff.isDirectory()){
                PPP(ff);
            }
        }
       /* File file = new File("E:/练习读文件");
        PPP(file);*/
    }



    /*       流的读取和写入       */
    public static void ReadAndWrite() throws IOException {
        /*         File file = new File(LianXi3.class.getResource("E:/练习读文件/abc2/hello.txt").getFile());*/
        File file2 = new File("E:/练习读文件/abc2/hello.txt");
        File file3 = new File("E:/练习读文件/abc2/hello10.txt");
        FileInputStream filein = new FileInputStream(file2);
        FileOutputStream ou = new FileOutputStream(file3);

        byte[] bb = new byte[filein.available()];
        int data=-1;
        int i=0;
        while ((data=filein.read())!=-1){
            bb[i++]=(byte)data;
            ou.write(data);
        }
      /*  File absoluteFile = file2.getAbsoluteFile();    //文件的全路径名:E:\练习读文件\abc2\hello.txt
        String path = file2.getPath();       //文件的全路径名:E:\练习读文件\abc2\hello.txt
        String absolutePath = file2.getAbsolutePath();     //文件的全路径名:E:\练习读文件\abc2\hello.txt
        File canonicalFile = file2.getCanonicalFile();    //文件的全路径名:E:\练习读文件\abc2\hello.txt
        String absolutePath1 = file2.getAbsolutePath();   //文件的全路径名:E:\练习读文件\abc2\hello.txt
        String parent = file2.getParent();      //文件的父目录（上一级目录）
        System.out.println(parent);*/
        filein.close();

        String str = new String(bb);
        System.out.println(str);

      /*  while (file.exists()){          //exists():检查文件或目录是否存在如果指定的文件或目录存在则返回 true，否则返回 false。
            System.out.println(file.isFile());
        }*/
    }

        /*顺序的调换*/
        public static void arrayDiaoHuan () {
            int[] a = {1, 5, 3, 4, 2};
            int[] b = new int[5];
            int j = b.length;
            for (int i = 0; i < a.length; i++) {
                b[j - i - 1] = a[i];
            }
            for (int k = 0; k < b.length; k++) {
                System.out.println(b[k]);
            }
        }


        /*字符串顺序的调换(使用charAt方法取出单个字符进行追加，追加到当前字符的后面)*/
        public static void strDiaoHuan () {
            String str = "abcde";
            String str2 = "";
            for (int i = 0; i < str.length(); i++) {
                str2 = str.charAt(i) + str2;
            }
        }


        /*回文串*/
        public static boolean HuiWen () {
            boolean bo = false;
            String s1 = "sabba";
            int j = 0;
            for (int i = s1.length() - 1; i < s1.length() && i > -1; i--) {   //从最后一个元素开始循环，i不能等于负数，但是可以等于0，所以是--操作
                if (s1.charAt(i) == s1.charAt(j)) {
                    bo = true;
                    j++;
                } else {
                    bo = false;
                }
            }
            return bo;
        }


        /*冒泡（初始）*/
        public static void MaoPao(){
            int[] str = {10,50,2,1,8,9,25,24,23,3};
            for (int j=0;j<str.length;j++) {
                for (int i = 0; i < str.length-j-1; i++) {
                    if (str[i] > str[i + 1]) {
                        int temp = str[i];
                        str[i]=str[i + 1];
                        str[i + 1] = temp;
                    }
                }
            }
            System.out.println(Arrays.toString(str));
        }



        /*冒泡（难度2）*/
        public static void MaoPao2(){
            /*截取字符串拿到后六位；把后六位放到数组中；遍历数组，进行冒泡排序*/
            String[] shu = {"cba312456", "abc123455", "bbb213456", "sdf654321"};
            int[] arr = new int[4];
            String[] arr2 = new String[4];
            for (int i = 0; i < shu.length; i++) {
                String zi1 = shu[i].substring(3, 9);//截取后6位
                arr2[i]=zi1;
            }
            for (int s = 0;s<arr2.length;s++){
                int ww = Integer.parseInt(arr2[s]);
                arr[s]=ww;
            }
            for (int j = 1; j < arr.length; j++) {
                for (int k = 0; k < arr.length - j; k++) {
                    if(arr[k]>arr[k+1]) {
                        int temp = arr[k];
                        arr[k]=arr[k+1];
                        arr[k+1]=temp;
                    }
                }
            }
            System.out.println(Arrays.toString(arr));
        }


        /*压缩算法*/
        public static void YaSuo(){
            String[] ya = {"aaabbccdddffegg"};
            String yuansu = ya[0];
            int length1 = yuansu.length();
            String shu = "";
            for(int i=0;i<length1;i++){   //字符串遍历（也可以把字符串转换为char数组，然后再去遍历数组）
                char cc=ya[0].charAt(i);
                int count=1;
                for (int j=i+1;j<length1;j++){
                    if (cc==ya[0].charAt(j)){
                        count++;
                    } else{
                        shu=shu+count+cc;
                        break;
                    }
                }
                i=i+count-1;   //防止下标超界限
                if (i==length1-1){
                    shu=shu+count+cc;
                }
            }
            System.out.println(shu);
        }



        /*将两个数组进行合并*/
        public static void ShuZuHeBing(){
            int[] arr1 = {2,5,6,7};
            int[] arr2 ={1,3,4,8,9};
            int[] arr = new int[arr1.length+arr2.length];
            int k=0;
            int m=0;
            for (int i=0;i<arr.length;i++){
                if(k<arr1.length&&m<arr2.length){
                    if(arr1[k]>arr2[m]){
                        arr[i]=arr2[m];
                        m++;
                    }
                    if(arr1[k]<arr2[m]){
                        arr[i]=arr1[k];
                        k++;
                    }
                }
                else{   //如果两个数组没有循环完那么就走else。
                    if(k<arr1.length){
                        arr[i]=arr1[k];
                        k++;
                    }
                    if(m<arr2.length){
                        arr[i]=arr2[m];
                        m++;
                    }
                }
            }
        }


            static String sd = "1234567890";
            static int n=3;
            static String sb = "1234567890";
            static int c=4;
            static String sg = "1234567890";
            static int v=4;

        //找出字符串给定长度的子串
        public static void StringBianLiang(int n,int c,int v,String sd,String sb,String sg){
            //第一种方法
            for(int i=0;i<sd.length()-n+1;i++){
                String aa = sd.substring(i,i+n);
                System.out.println(aa);
            }
            //第二种方法
            for(int i=0;i<=sd.length()-n;i++){
                String aa = sd.substring(i,i+n);
                System.out.println(aa);
            }
            //第三种方法
            for(int i=0;i<sb.length();i++){
                String aa = sb.substring(i,i+c);
                System.out.println(aa);
                if(i==sb.length()-c){   //i=7  c=3  才能不超界
                    break;
                }
            }
            //第三种方法
            for(int i=0;i<sg.length();i++){
                String tt = "";
                for(int j=i;j<i+n;j++){ //i=0  j=0  sd.charAt:1    i=0  j=1 sd.charAt:2     i=0  j=2  sd.charAt:3    i=0  j=3  sd.charAt:4     i=0 j=4   sd.charAt:"跳出"
                    tt+= sg.charAt(j);
                }
                System.out.println(tt);
                if(i==sg.length()-v){
                    break;
                }
            }
        }


        //机器人在坐标轴前行，如果回到（0，0）点，就返回true，否则返回false
        public static boolean XingZou(int a,int b) {
            boolean h = false;
            String str= "LURD";
            for (int i = 0; i < str.length(); i++) {
                int x = a;
                int y = b;
                if(x==str.charAt(i)){
                    a=x-1;
                }
                if(y==str.charAt(i+1)){
                    b=y-1;
                }
                if(x==str.charAt(i+1)){
                    a=y+1;
                }
                if(y==str.charAt(i+1)){
                    b=y-1;
                }
                if(a==b){
                    return true;
                } else{
                    return false;
                }
            }
            return h;
        }


        /*
                输入一段字符串，代表模板:
                Hello ${name}
                我来自 ${where}

                输入一个HashMap:
                “name” -> “Tom”, “where” -> “北京”

                输出：
                Hello Tom
                我来自 北京
        */
        public static void ZiFuChuanShuRu(){
            String name = "Tom";
            HashMap<String,Object> ty = new HashMap<>();
            ty.put("name",name);
            String str1 = "Hello ${name}";
            int s1 = str1.indexOf("${name}");
            int s2 = str1.indexOf("Hello ");
            String st1 = str1.substring(s1,str1.length());
            String st2 = str1.substring(s2,str1.length()-s1-1);
            String ss = st2+ty.values();  //Hello Tom
            System.out.println(ss);
        }




        /*
                输入qw**23
                输出**qw23
         */
        public static String ShuRuAndShuChu(){
           char sqw1[]={'1','w','*','*','1','*'};
            String ss="";
            String dd="";
            for(int i=0;i<sqw1.length;i++){
                if(sqw1[i]=='*'){
                    ss+=sqw1[i];
                }
                if(sqw1[i]!='*'){
                    dd+=sqw1[i];
                }
            }
            System.out.println(ss+dd);
            return ss+dd;
        }



         /*
            找到字符串数组中相同的元素并计算元素的个数，计算完后按照降序排列。
         */
            String str[] = {"hello","world","hello","java","hello","java","hello"};
    public static void ss(String str[]){
            LinkedHashMap<String,Integer> map = new LinkedHashMap<>();
            for(int i=0;i<str.length;i++){      //hello
                int ii = 0;
                String ss =null;
                for(int j=0;j<str.length;j++){  //hello world   hello  java  hello   HashMap  hello  拿第一次循环得到的hello与第二次循环的对比，如果相同就加一，如果不同，那就放入map中
                    if(str[i].equals(str[j])){
                        ii++;
                        ss=str[j];
                    }
                }
                map.put(ss,ii);
            }
            System.out.println(map);
        }


        /*
            Map集合的遍历
         */
        public void BianLi(){
            List<String> list = new ArrayList<>();
            list.add("张三");
            list.add("张三1");
            list.add("张三2");

            Set<String> set = new TreeSet<>();
            set.add("李四");
            set.add("李四1");
            set.add("李四2");



            Map<String,String> map = new HashMap<>();
            map.put("张三","123");
            map.put("李四","456");

            Iterator<Map.Entry<String,String>> iii =  map.entrySet().iterator();
            while (iii.hasNext()){
                Map.Entry<String,String> entry = iii.next();
                System.out.println("key:"+entry.getKey()+"value:"+entry.getValue());
            }

            for(String mm:map.keySet()){
                System.out.println("======="+mm+map.get(mm));
            }

            for(Map.Entry<String,String> enen:map.entrySet()){
                System.out.println("-------"+enen.getKey()+enen.getValue());
            }

            Iterator<String> ii = list.iterator();
            while (ii.hasNext()){
                System.out.println(ii.next());
            }

            Iterator<String> ii2 = set.iterator();
            while (ii2.hasNext()){
                System.out.println(ii2.next());
            }

        }


}
