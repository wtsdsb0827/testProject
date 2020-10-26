<%@ page import="org.springframework.ui.Model" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>

<form method="post" action="${pageContext.request.contextPath}/ShangChuan" enctype="multipart/form-data">
    <input name = "fileName" type = "file"><br>
   <input type = "submit" value = "点击上传">
</form>



</html>
