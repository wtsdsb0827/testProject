<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-table.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-tab.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
</head>
<body>


<div class="col-sm-12" style="marin-top:-10px;margin-left:-20px;">
	<img src="/static//imags/12.jpg">
</div>

<div class="row" style="background-color: #FEFEF2;">
	<div class = "col-sm-2" id="divyyy" style="width:300px;height:1340px;background-color:#1E5C90; ">
	</div>
	<div class = "col-sm-10" style="width: 1500px;height: 1300px;">
		<iframe id="iframepage" name="iframepage" frameBorder=0 scrolling=auto width="100%" height="100%" src="/jsps/common/firstPage.jsp"></iframe>
		<%--<div style="width: 1206px;margin-left: 135px;margin-top: -120px;border: solid;border-color: #DDDDDD;">
			<h4>达力普石油专用管有限公司（以下简称 ‘公司’）成立于1998年,是以废旧金属为原料的节能、环保、循环经济型企业、
				是从管坯，其他石油管和石油专用管制造到技术服务为一体的、专业化、全产业链智能高端制造企业，公司
				建有河北石油管工程技术研究中心，公司占地2000余亩，共有四个厂区，两条铁路专线，具备生产API和非API的各种
				钢级和螺纹的23/8"-41/2"油管和41/2"-20"套管，现已具备成熟的管道生产技术。 </h4>
		</div>--%>
	</div>
</div>



</body>

<script type="text/javascript">


	//页面加载时
    function JiaZaiHanShu(){
        var id= ${user.roleId};
        $.ajax({
			data:{id:id},
			dataType:"json",
			url:"${pageContext.request.contextPath}/login/selectUseQuanXian",
			type:"post",
			success:function (data) {
                var ii = "";
                ii+="<div>";
                ii+="<table>";
                ii+="<tr>";
                ii+="<ul style=\"list-style-type:none;font-size:30px;color:#FFFFFF;\">";
                ii+="<td style=\"font-size:19px;color:#FFFFFF;padding-left: 15px;\">";
                ii+="<img src=\"${pageContext.request.contextPath}/static/imags/8.jpg\"><div style=\"float: right;margin-top: 15px;\"><a target = \"iframepage\" href = \"/jsps/common/firstPage.jsp\" style = \"color:#FFFFFF;text-decoration:none;\">首页</a></div>";
                ii+="</td>";
                ii+="<td style=\"padding-left: 100px;\">";
                ii+="<img src=\"${pageContext.request.contextPath}/static/imags/5.jpg\" onclick=\"LookLi()\" id = \"tupiancaozuo\">";
                ii+="</td>";
                ii+="</ul>";
                ii+="</tr>";
                ii+="</table>";
                ii+="</div>";
                ii+="<hr style=\"border-color:pink\"/>";


			   for(var i=0;i<data.length;i++){
					if(data[i].pId==0){
					    ii+="<div>";
                        ii+="<table>";
                        ii+="<tr>";
                        ii+="<ul style=\"list-style-type:none;font-size:30px;color:#FFFFFF;\">";
                        ii+="<td style=\"font-size:19px;color:#FFFFFF;padding-left: 15px;\">";
                        ii+="<a style='color:#FFFFFF;'  href = \"javascript:LookLi1("+data[i].id+")\">";
                        ii+="<img src=\"${pageContext.request.contextPath}/static/imags/9.jpg\"><div style=\"float: right\">"+data[i].menuName+"</div>";
                        ii+="</td>";
                        ii+="<td style=\"padding-left: 60px;\">";
                        ii+="<img src=\"${pageContext.request.contextPath}/static/imags/5.jpg\" id = \"tupiancaozuo1\">";
                        ii+="</a>";
                        ii+="</td>";
                        ii+="</ul>";
                        ii+="</tr>";
                        ii+="<tr id = \"d"+data[i].id+"\">";
                        ii+="</tr>";
                        ii+="</table>";
                        ii+="</div>";
                        ii+="<hr style=\"border-color:pink\"/>";
					}
				}
				$("#divyyy").append(ii);
            }
		})
	};




	$(function(){
        JiaZaiHanShu();
	})

	//首页点击事件
	   function LookLi(){
           var imgObj = document.getElementById("tupiancaozuo");
           if(imgObj.getAttribute("src",2)=="${pageContext.request.contextPath}/static/imags/5.jpg"){
               imgObj.src="${pageContext.request.contextPath}/static/imags/6.jpg";
           }else{
               imgObj.src="${pageContext.request.contextPath}/static/imags/5.jpg";
           }
	   }

	   function LookLi1(id){
           var imgObj = document.getElementById("tupiancaozuo1");
           if(imgObj.getAttribute("src",2)=="${pageContext.request.contextPath}/static/imags/5.jpg"){
               imgObj.src="${pageContext.request.contextPath}/static/imags/6.jpg";
           }else{
               imgObj.src="${pageContext.request.contextPath}/static/imags/5.jpg";
           }
	    var pId="#d"+id;
           var iii = $(pId).html();
           if(iii.length==0){
           $.ajax({
               data:{pId:id},
               dataType:"json",
               url:"${pageContext.request.contextPath}/login/selectUseQuanXian1",
               type:"post",
               success:function (data) {
                   var ii = "";
                   for(var i=0;i<data.length;i++){
                       ii+="<tr id = \"d"+data[i].id+"\">";
                       ii+="<td>";
                       ii+="<ul style=\"font-size:17px;color:#FFFFFF;\">";
                       ii+="<div style=\"padding-left: 10px;\">";
                       ii+="<li>";
                       ii+="<a href ='${pageContext.request.contextPath}/"+data[i].url+"' target='iframepage' style='color:#FFFFFF;text-decoration:none;'>"+data[i].menuName+"</a>";
                       ii+="</li>";
                       ii+="</div>";
                       ii+="</ul>";
                       ii+="</td>";
                       ii+="</tr>";
				   }
					$(pId).append(ii);
               }
           })
           }else{
               $(pId).html(null);
		   }
	   }



</script>
</html>