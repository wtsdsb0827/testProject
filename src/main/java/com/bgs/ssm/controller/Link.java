package com.bgs.ssm.controller;
/*
        LinkedList代码实现
 */
public class Link<Object> {



    private Node<Object> first;
    private Node<Object> last;
    private int size=0;
    public int getSize(){
        return size;
    }


    /*
       添加
    */
    public void add(int index,Object value){
        checkIndex1(index);
        if(index==size){    //比如说 下标为：  0 1 2
            addLast(value);  //对应就是：      1 2 3     那么1就等于2，所以index=size就成立。什么时候会不成立？走else时就不成立
        }else{
            addMiddle(value,node(index));   //按照上述，当我们再次添加时，当下标还是为1时，value变一个值为10，因为我们下标1已经有了元素，那么走这个方法就会在这个下标前添加一个元素  最后这个集合的数据就变为了： 1  10  2  3
        }
    }
    public void addBefore(Object value){
        Node<Object> f = first;
        Node newnode = new Node(null,value,f);
            first=newnode;
        if(f==null){
            last=newnode;
        }else{
            f.previous=newnode;
        }
        size++;
    }
    public void addMiddle(Object value,Node<Object> node){
        Node previous = node.previous;
        Node newnode = new Node(previous,value,node);
        node.previous=newnode;
        if(previous==null){
            first=newnode;
        }
        previous.next=newnode;
        size++;
    }
    public void addLast(Object value){
        Node<Object> f = last;
        Node newnode = new Node(f,value,null);  //创建一个新的节点对象
            last=newnode;
        if(f==null){
            first=newnode;
        }else{
          f.next=newnode;
        }
            size++;
    }



    /*
        删除
     */
    public void delete(int index){
        checkIndex(index);
        deleteAll(index);
    }
    private void deleteAll(int index) {
        Node fi = first;
        Node la = last;
        if(index==0&&fi.previous==null){      //删除第一个
            first=fi.next;
        }else if(index==size-1&&la.next==null){    //删除最后一个
            last=la.previous;
        }else{
            unLink(node(index));
        }
        size--;
    }
    //根据查询的下标删除某一个
    private void unLink(Node<Object> node) {
        Node<Object> pre = node.previous;
        Node<Object> ne = node.next;
        pre.next=ne;
        ne.previous=pre;
    }


    /*
        修改
     */
    public void set(int index,Object value){
        checkIndex1(index);
        Node<Object> n = node(index);
        Object oldvalue = n.value;
        n.value=value;
    }


    /*
      查询操作
   */
    public Node get(int index){
        checkIndex(index);
        return node(index);
    }


    /*
        判断下标是否超界(用于查询)
     */
    private boolean checkIndex(int index) {
        if(index<size&&index>=0){
            return true;
        }else{
            throw new IndexOutOfBoundsException();
        }
    }

    /*
        判断下标是否超界(用于添加)
     */
    private boolean checkIndex1(int index) {
        if(index>=0&&index<=size){
            return true;
        }else{
            throw new IndexOutOfBoundsException();
        }
    }


    /*
     判断查询的节点位置:从第一个往后开始查询还是从最后一个往前开始查询
  */
    private Node node(int index) {
        if(index<(size>>1)){
            Node fi = first;
            for(int i=0;i<index;i++){
                fi=fi.next;
            }
            return fi;
        }else{
            Node la = last;
            for(int i=size-1;i>index;i--){
                la=la.previous;
            }
            return la;
        }
    }


    /*
        Node内部类
     */
    public static class Node<Object>{
        public Object value;
        public Node<Object> previous =null;
        public Node<Object> next =null;



        public Node(Node<Object> previous, Object value, Node<Object> next) {
            this.previous = previous;
            this.value = value;
            this.next = next;
        }


        @Override
        public String toString() {
            return "{" +
                    "value=" + value +
                    '}';
        }
    }

}
