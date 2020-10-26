<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/js/jquery.js"></script>
<body>
    <h1>学生信息录入</h1>

    学生编号：<input id = "bianhao" type="text"><br>
    学生姓名：<input id = "xingming" type="text"><br>
    学生性别：<input id = "xingbie" type="text"><br>
    学生年龄：<input id = "nianling" type="text"><br>
    学生班级：<input id = "banji" type="text"><br>
    学生地址：<input id = "dizhi" type="text"><br>
    <button id = "tijiaoanniu">提交</button>
</body>

<script type="text/javascript">
    $("#tijiaoanniu").click(function(){
        var bianhao = $("#bianhao").val();
        var xingming = $("#xingming").val();
        var xingbie = $("#xingbie").val();
        var nianling = $("#nianling").val();
        var banji = $("#banji").val();
        var dizhi = $("#dizhi").val();
        $.ajax({
            data:{
                bianhao:bianhao,
                xingming:xingming,
                xingbie:xingbie,
                nianling:nianling,
                banji:banji,
                dizhi:dizhi
            },
            dataType:"json",
            url:"${pageContext.request.contextPath}/student/add",
            type:"post",
            success:function (data) {
                alert("添加成功！！！");
            }
        })
    })
</script>
</html>
