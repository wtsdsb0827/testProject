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
                <td>性别</td>
            </tr>

            <tr v-for="s1 in stu">
                <td>{{s1.id}}</td>
                <td>{{s1.name}}</td>
                <td>{{s1.age}}</td>
                <td>{{s1.role.sex}}</td>
            </tr>
        </table>
    </div>


</body>
<script>
    var lianxi2=new Vue({
        el:"#app",
        data:{
           stu:[
               {id:1,name:'魏天松',age:88,role:{sex:'男'}},
               {id:2,name:'周杰伦',age:77,role:{sex:'男'}},
               {id:3,name:'李荣浩',age:99,role:{sex:'男'}},
               {id:4,name:'薛之谦',age:33,role:{sex:'男'}}
           ],
        }
    });
</script>
</html>
