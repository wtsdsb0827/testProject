<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
<body>

    <div id="app" align="center" style="margin-top: 200px;">
        <h3>高一三班学生信息</h3>
        <table style="border: 1px solid palevioletred;width: 400px;height: 400px;">
            <tr>
                <td>编号</td>
                <td>姓名</td>
                <td>年龄</td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</td>
            </tr>

            <tr v-for="s1 in stu">
                <td>{{s1.id}}</td>
                <td>{{s1.name}}</td>
                <td>{{s1.age}}</td>
                <td>
                    <a href="#">删除</a>
                    <a href="#">修改</a>
                </td>
            </tr>
        </table>

        <div style="margin-top: 50px;">
                编号：<input type="text" v-model="stu.id"><br><br>
                姓名：<input type="text" v-model="stu.name"><br><br>
                年龄：<input type="text" v-model="stu.age"><br><br>
                            <button v-on:click="addUser">提交</button>
        </div>
    </div>


</body>
<script>
    var lianxi2=new Vue({
        el:"#app",
       methods:{
            addUser:function(){
               this.stu.push({
                    id:this.stu.id,
                    name:this.stu.name,
                    age:this.stu.age,
                    })
            }
        },
        data:{
           stu:[
               {id:1,name:'魏天松',age:88},
               {id:2,name:'周杰伦',age:77},
               {id:3,name:'李荣浩',age:99},
               {id:4,name:'薛之谦',age:33}
           ],
        }
    });
</script>
</html>
