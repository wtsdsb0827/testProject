<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-table.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-tab.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-closable-tab.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-tab.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>

</head>
<body style=" background-image:url(${pageContext.request.contextPath}/static/imags/login.jpg); background-repeat:no-repeat; background-position:center top; overflow:hidden;">


	<div align="center" style="margin-top:400px;margin-left:680px;padding-top:40px;background-color: #DEE6F3 ;height: 300px; width: 500px;">
			<table>
				<tr>
					<td>
						<img src="${pageContext.request.contextPath}/static/imags/200.jpg" style="margin-bottom: 30px;">
					</td>

					<td>
						<input name = "userName" type="text" placeholder="用户名" style=" height: 55px; width: 220px; margin-bottom: 30px;border:none;font-size:20px;"><br>
					</td>
				</tr>


				<tr>
					<td>
						<img src="${pageContext.request.contextPath}/static/imags/201.jpg" >
					</td>

					<td>
						<input name = "passWord" type="password" placeholder="密码" style="height: 55px; width: 220px;border:none;font-size:20px;"><br>
					</td>
				</tr>
			</table>
			<button  type="button"  class="btn btn-primary" style=" font-size: 20px;color:white;height: 50px; width: 300px; margin-top: 25px;background-color: #2266C8;" onclick="LoginClick()" >登录</button>

	</div>
</body>

<script type="text/javascript">


	//登录
		function LoginClick(){
            var userName = $("input[name=userName]");
            var password = $("input[name=passWord]");

            if(!userName.val()){
                alert("用户名不可以为空");
                return false;
            }else if(!password.val()){
				alert("密码不可以为空");
            }


            var userName = $("input[name=userName]").val();
            var password = $("input[name=passWord]").val();

                $.ajax({
                url:"${pageContext.request.contextPath}/login/selectUser",
                data:{userName:userName,password:password},
                dataType:"json",
                type:"post",
                success:function(data){
                    if(data){
                        alert("登录成功!!");
                        location.href = "jsps/login/login4.jsp";
                    }
                }
            })
		};
</script>
</html>