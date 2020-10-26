
    <%--
        出现问题：1.<script>标签应该放在body上面，先执行body里面的东西
                  2.


    --%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
<script src="${pageContext.request.contextPath}/static/element/index.js"></script>


<body>
<div id="vue">

    <p v-bind:title="hh">{{myTtitle}}</p>

    <p>{{message}}</p>
    <input v-model="message">


    <p v-if="look">fdsfs</p>

    <table>
        <tr v-for="ss in stu">
            <td>{{ss.id}}</td>
            <td>{{ss.name}}</td>
            <td>{{ss.age}}</td>
        </tr>
    </table>

</div>
</body>

<script>
    new Vue({
        el:"#vue",
        data:{
            hh:"Time:"+new Date().toLocaleString(),
            myTtitle:'信不信我知道当前时间？',
            message:'我打！！！！呕吼====',
            look:false,
            stu:[
                {id:1,name:'张三',age:100},
                {id:2,name:'李四',age:110},
                {id:3,name:'王五',age:120},
            ]
        }
    })
</script>

</html>
