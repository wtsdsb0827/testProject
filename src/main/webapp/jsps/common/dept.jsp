<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap-table.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/static/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-table.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>

<body>
<div style="margin-top: 50px;margin-left: 60px;">
    部门名称&nbsp;&nbsp;<input name ="deptName" class="btn btn-default" placeholder="请输入" type = "text" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
    联系人&nbsp;&nbsp;<input name ="contact" class="btn btn-default" placeholder="请输入" type = "text" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
    联系电话&nbsp;&nbsp;<input name ="contactphone" class="btn btn-default" placeholder="请输入" type = "text" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
    <button style="background-color: #009688;margin-left: 20px;" class="btn btn-default" id="mhcxclick"><img src="/static/images/9.png"></button>
</div>
<div>
    <button class="btn btn-default" style="width:80px; height:40px;background-color:#009688;color: white; margin-left: 20px;margin-top: 30px;" id = "bmtj">添加</button>&nbsp;&nbsp;&nbsp;
    <button class="btn btn-default" style="width:80px; height:40px;background-color:#FF5722;color: white;margin-top: 30px;" id = "bmsc"> 删除</button>&nbsp;&nbsp;&nbsp;
    <button class="btn btn-default" style="width:120px; height:40px;background-color:#009688;color: white;margin-top: 30px;">导入</button>
    <button class="btn btn-default" style="width:120px; height:40px;background-color:#009688;color: white;margin-top: 30px;">下载模板</button>
    <table id = "BooStraptableBuMenId" style="margin-top: 100px;"></table>
</div>


<!-- 用户管理的删除模态框（Modal） -->
<div class="modal fade" id="shanchuModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel1">信息</h4>
            </div>
            <div class="modal-body">
                确定要删除吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id = "shanchuanniu">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>



<!-- 部门管理添加模态框（Modal） -->
<div class="modal fade" id="bmtjModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width:450px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body" align="center">
                <form method="post" id = "formIdtj">
                    所属部门<select class="btn btn-default" id="Deptselect" style="width: 300px;margin-bottom:15px;height:40px" name="pid"><option value="0">根部门</option></select><br>
                    部门名称<input placeholder="请输入部门名称" type="text"  name="deptName" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    联系人&nbsp;&nbsp;&nbsp;<input placeholder="请输入联系人" type="text" name="contact" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    联系电话<input placeholder="请输入联系电话" type = "text" name = "contactphone" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    部门简介<input placeholder="请输入部门简介" type="text"  name="introduce" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    排序<input name = "paixu" type = "text"  class="btn btn-default" style="width: 300px;margin-left: 30px;height: 40px" value="1">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id = "bumenTianjia">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>




<!-- 部门管理修改模态框（Modal） -->
<div class="modal fade" id="bmxgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width:450px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelxg">添加用户</h4>
            </div>
            <div class="modal-body" align="center">
                <form method="post" id = "formIdxg">


                    <input id="xgYingCangYuId" type="hidden" name="id">

                    所属部门<select class="btn btn-default" id="Deptselect1" style="width: 300px;margin-bottom:15px;height:40px" name="pid"><option value="0">根部门</option></select><br>
                    部门名称<input placeholder="请输入部门名称" type="text" id ="deptName"  name="deptName" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    联系人&nbsp;&nbsp;&nbsp;<input placeholder="请输入联系人" type="text" id="contact" name="contact" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    联系电话<input placeholder="请输入联系电话" type = "text" name = "contactphone" id="contactphone" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    部门简介<input placeholder="请输入部门简介" type="text"  name="introduce" id="introduce" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    排序<input name = "paixu" type = "text"  class="btn btn-default" id="paixu" style="width: 300px;margin-left: 30px;height: 40px" value="1">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id = "bumenXiuGai">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>








</body>


<script>

    $(function(){
        bumenModal();
    });

    function bumenModal(){
        $("#BooStraptableBuMenId").bootstrapTable({
            url:"${pageContext.request.contextPath}/login/BuMenQuanXian",
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            method:"post",
            cache:false,
            queryParams:function(params){
                return{
                    deptName:$("input[name=deptName]").val(),
                    contact:$("input[name=contact]").val(),
                    contactphone:$("input[name=contactphone]").val(),
                }
            },
            columns:[
                {
                    field:"checkbox",
                    checkbox:true,
                },
                {
                    title:"ID",
                    field:"id",
                },
                {
                    title:"部门名称",
                    field:"deptName",
                },
                {
                    title:"联系人",
                    field:"contact",
                },
                {
                    title:"联系电话",
                    field:"contactphone",
                },
                {
                    title:"简介",
                    field:"introduce",
                },
                {
                    title:"排序",
                    field:"paixu",
                },
                {
                    title:"操作",
                    width:"400px",
                    formatter:function(value,row,index) {
                        var aa = "";
                        aa += "<a href ='javascript:XiuGaiBuMen(\""+row.id+"\")'  style='text-decoration:none;'><button class=\"btn btn-default\" style='background-color:#009688;color: white;margin-right: 15px;'>编辑</button>&nbsp;&nbsp;&nbsp;</a>";
                        aa += "<a href ='javascript:ShanChuBuMen(\""+row.id+"\")' style='text-decoration:none;'><button class=\"btn btn-default\" style='background-color:#FF5722;color: white;'>删除</button>&nbsp;&nbsp;&nbsp;</a>";
                        return aa;
                    }
                },
            ]
        })
    }


    //模糊查询
    $("#mhcxclick").click(function(){
        bumenModal();
        $("#BooStraptableBuMenId").bootstrapTable("refresh");
    })

    //删除
    $("#bmsc").click(function(){
        var dx = $("#BooStraptableBuMenId").bootstrapTable("getSelections");
        var id=dx[0].id;
        $("#shanchuModal").modal("show");
        $("#shanchuanniu").click(function(){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/login/deleteBuMen",
                data:{id:id},
                dataType:"json",
                success:function(data){
                    if(data){
                        alert("删除成功！！！");
                        $("#shanchuModal").modal("hide");
                        $("#BooStraptableBuMenId").bootstrapTable("refresh");
                    }
                }
            })
        })
    })

    //删除
    function ShanChuBuMen(id){
        $("#shanchuModal").modal("show");
        $("#shanchuanniu").click(function(){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/login/deleteBuMen",
                data:{id:id},
                dataType:"json",
                success:function(data){
                    if(data){
                        alert("删除成功！！！");
                        $("#shanchuModal").modal("hide");
                        $("#BooStraptableBuMenId").bootstrapTable("refresh");
                    }
                }
            })
        })
    }



    //添加
    $("#bmtj").click(function(){
        //查询部门信息目的是回显
        $.ajax({
            data:[],
            dataType:"json",
            url:"${pageContext.request.contextPath}/login/selectDeptHuiXian",
            type:"post",
            success:function(data){
                var yf = "";
                    for(var i=0;i<data.length;i++){
                        yf+="<option value='"+data[i].id+"'>"+data[i].deptName;
                        yf+="</option>";
                       for(var j=0;j<data[i].childList.length;j++){
                            var jj = data[i].childList[j];
                            yf+="<option value='"+jj.id+"'>"+jj.deptName;
                            yf+="</option>";
                        }
                    }
                    $("#Deptselect").append(yf);
                    $("#bmtjModal").modal("show");
                $("#BooStraptableBuMenId").bootstrapTable("refresh");
            }
        })
    })

   $("#bumenTianjia").click(function(){
        var data = new FormData($("#formIdtj")[0]);
        alert(data);
        $.ajax({
            url:"${pageContext.request.contextPath}/login/addDept",
            data:data,
            type:"post",
            dataType:"json",
            processData:false,
            contentType:false,
            success:function(data) {
                if(data){
                    alert("添加成功！！！");
                    $("#bmtjModal").modal("hide");

                }
            }
        })
    })


    //修改
    function XiuGaiBuMen(id){
        $("#xgYingCangYuId").val(id);
        //单查
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/login/DanChaBuMen",
            data:{id:id},
            dataType:"json",
            success:function(data){
                for(var i=0;i<data.length;i++){
                    $("#deptName").val(data[i].deptName);
                    $("#contact").val(data[i].contact);
                    $("#contactphone").val(data[i].contactphone);
                    $("#introduce").val(data[i].introduce);
                    $("#paixu").val(data[i].paixu);
                    var pid11 =data[i].pid;

                    $.ajax({
                        data:[],
                        dataType:"json",
                        url:"${pageContext.request.contextPath}/login/selectDeptHuiXian",
                        type:"post",
                        success:function(data){
                            var yf = "";
                            for(var i=0;i<data.length;i++){
                                if(pid11==data[i].id){
                                    yf+="<option selected='selected' value='"+data[i].id+"'>"+data[i].deptName;
                                    yf+="</option>";
                                    for(var j=0;j<data[i].childList.length;j++){
                                        var jj = data[i].childList[j];
                                        yf+="<option value='"+jj.id+"'>"+jj.deptName;
                                        yf+="</option>";
                                    }
                                }else{
                                    yf+="<option value='"+data[i].id+"'>"+data[i].deptName;
                                    yf+="</option>";
                                    for(var j=0;j<data[i].childList.length;j++){
                                        var jj = data[i].childList[j];
                                        yf+="<option value='"+jj.id+"'>"+jj.deptName;
                                        yf+="</option>";
                                    }
                                }
                            }
                            $("#Deptselect1").append(yf);
                            $("#bmxgModal").modal("show");
                        }
                    })
                }
            }
        })
    }

    $("#bumenXiuGai").click(function(){
        var id = $("#xgYingCangYuId").val();
        alert(id);
        var data = new FormData($("#formIdxg")[0]);
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/login/updateBuMen",
            data:data,
            dataType:"json",
            processData:false,
            contentType:false,
            success:function(data){
                if(data){
                    alert("修改成功！！！");
                    $("#bmxgModal").modal("hide");
                    $("#BooStraptableBuMenId").bootstrapTable("refresh");
                }else{
                    alert("修改失败！！！");
                }
            }
        })
    })

</script>

</html>
