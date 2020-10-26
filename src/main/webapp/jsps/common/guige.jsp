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

<input type="hidden" id="ssss">

<div style="margin-top: 50px;margin-left: 60px;">
    产品编号&nbsp;&nbsp;<input name ="bianma" class="btn btn-default" placeholder="请输入" type = "text" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
    产品名称&nbsp;&nbsp;<input name ="productName" class="btn btn-default" placeholder="请输入" type = "text" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
    产品型号&nbsp;&nbsp;<input name ="productSize" class="btn btn-default" placeholder="请输入" type = "text" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
    状态&nbsp;&nbsp;<select name ="productStatus" id = "productStatus" class="btn btn-default" style="border-color: #E5E5E5;width:160px;height: 35px;">
                        <option>未审</option>
                        <option>已审</option>
                     </select>
    <button style="background-color: #009688;margin-left: 20px;" class="btn btn-default" id="guigeMoHu"><img src="/static/images/9.png"></button>
</div>
<div>
    <button class="btn btn-default" style="width:80px; height:40px;background-color:#009688;color: white; margin-left: 20px;margin-top: 30px;" id = "ggtj">添加</button>&nbsp;&nbsp;&nbsp;
    <button class="btn btn-default" style="width:80px; height:40px;background-color:#FF5722;color: white;margin-top: 30px;" id = "plsc">批量删除</button>&nbsp;&nbsp;&nbsp;
    <button class="btn btn-default" style="width:120px; height:40px;background-color:#009688;color: white;margin-top: 30px;" id="guigedaoru">导入</button>
    <button class="btn btn-default" style="width:120px; height:40px;background-color:#009688;color: white;margin-top: 30px;" id="guigedaochu">导出</button>
    <button class="btn btn-default" style="width:120px; height:40px;background-color:#009688;color: white;margin-top: 30px;" id="guigexiazai">下载模板</button>
    <button class="btn btn-default" style="width:120px; height:40px;background-color:#009688;color: white;margin-top: 30px;" id="guigeshenge">审核</button>
    <table id = "BooStraptableGuiGeId" style="margin-top: 100px;"></table>
</div>




<!-- 规格管理添加模态框（Modal） -->
<div class="modal fade" id="ggglModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width:450px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body" align="center">
                <form method="post" id = "ggtjformId">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品编号<input placeholder="请输入产品编号" type="text"  name="bianma" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px;"><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 产品名称<input placeholder="请输入产品名称" type="text"  name="productName" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品型号<input placeholder="产品型号" type="text" name="productSize" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    油田产品名称<input placeholder="请输入油田产品名称" type = "text" name = "oilproductName" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    油田产品型号<input placeholder="请输入油田产品型号" type="text"  name="oilproductSize" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    物科计量单位<input placeholder="请输入物科计量单位" type="text"  name="testunit" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计量方式<input placeholder="请输入计量方式" type="text"  name="testway" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id = "yonghuTianjia">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 规格管理的删除模态框（Modal） -->
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



<!-- 规格管理修改模态框（Modal） -->
<div class="modal fade" id="ggxgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog"style="width:450px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">修改用户</h4>
            </div>
            <div class="modal-body" align="center">
                <form method="post" id = "ggtjformIdxg">


                    <input name = "id" type="hidden" id="xgIdYingCangYu">


                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品编号<input placeholder="请输入产品编号" type="text" id="xgbianma"  name="bianma" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px;"><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 产品名称<input placeholder="请输入产品名称" type="text" id="xgproductName"  name="productName" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品型号<input placeholder="产品型号" type="text" id="xgproductSize" name="productSize" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    油田产品名称<input placeholder="请输入油田产品名称" type = "text" name = "oilproductName" id="xgoilproductName" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    油田产品型号<input placeholder="请输入油田产品型号" type="text"  name="oilproductSize" id="xgoilproductSize" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    物科计量单位<input placeholder="请输入物科计量单位" type="text"  name="testunit" id="xgtestunit" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;计量方式<input placeholder="请输入计量方式" id="xgtestway" type="text"  name="testway" class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id = "yonghuXiuGai">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<!-- 规格管理的删除模态框（Modal） -->
<div class="modal fade" id="shenheModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                确定要审核吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id = "shenheanniu">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


</body>
<script>
    $(function(){
        guigeModal();
    });

    function guigeModal(){
        $("#BooStraptableGuiGeId").bootstrapTable({
            url:"${pageContext.request.contextPath}/login/GuiGeQuanXian",
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            method:"post",
            cache:false,
            queryParams:function(params){
                return{
                    bianma:$("input[name=bianma]").val(),
                    productName:$("input[name=productName]").val(),
                    productSize:$("input[name=productSize]").val(),
                    productStatus:$("#ssss").val(),
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
                    title:"状态",
                    field:"productStatus",
                },
                {
                    title:"产品编码",
                    field:"bianma",
                },
                {
                    title:"产品名称",
                    field:"productName",
                },
                {
                    title:"产品型号",
                    field:"productSize",
                },
                {
                    title:"油田产品名称",
                    field:"oilproductName",
                },
                {
                    title:"油田产品型号",
                    field:"oilproductSize",
                },
                {
                    title:"物科计量单位",
                    field:"testunit",
                },

                {
                    title:"操作",
                    width:"400px",
                    formatter:function(value,row,index) {
                        var aa = "";
                        aa += "<a href ='javascript:ShenHeBuMen(\""+row.id+"\")'  style='text-decoration:none;'><button class=\"btn btn-default\" style='background-color:#FF5722;color: white;margin-right: 15px;'>审核</button>&nbsp;&nbsp;&nbsp;</a>";
                        aa += "<a href ='javascript:XiuGaiBuMen(\""+row.id+"\")'  style='text-decoration:none;'><button class=\"btn btn-default\" style='background-color:#009688;color: white;margin-right: 15px;'>编辑</button>&nbsp;&nbsp;&nbsp;</a>";
                        aa += "<a href ='javascript:ShanChuBuMen(\""+row.id+"\")' style='text-decoration:none;'><button class=\"btn btn-default\" style='background-color:#FF5722;color: white;'>删除</button>&nbsp;&nbsp;&nbsp;</a>";
                        return aa;
                    }
                },
            ]
        })
    }

 //模糊查询
     $("#guigeMoHu").click(function(){
         $("#ssss").val($("#productStatus").val());
         guigeModal();
         $("#BooStraptableGuiGeId").bootstrapTable("refresh");
     })

    //添加
    $("#ggtj").click(function(){
        $("#ggglModal").modal("show");
    })
    $("#yonghuTianjia").click(function(){
        var data = new FormData($("#ggtjformId")[0]);
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/login/addGuiGe",
            data:data,
            dataType:"json",
            processData:false,
            contentType:false,
            success:function(data){
                if(data){
                    alert("添加成功！！！");
                    $("#ggglModal").modal("hide");
                    $("#BooStraptableGuiGeId").bootstrapTable("refresh");
                }else{
                    alert("添加失败！！！");
                }
            }
        })
    });

    //批量删除
    $("#plsc").click(function () {
        var dx = $("#BooStraptableGuiGeId").bootstrapTable("getSelections");
        var id=dx[0].id;
        $("#shanchuModal").modal("show");
        $("#shanchuanniu").click(function(){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/login/deleteGuiGe",
                data:{id:id},
                dataType:"json",
                success:function(data){
                    if(data){
                        alert("删除成功！！！");
                        $("#shanchuModal").modal("hide");
                        $("#BooStraptableGuiGeId").bootstrapTable("refresh");
                    }
                }
            })
        })
    })

    //修改
   function XiuGaiBuMen(id) {
        $("#xgIdYingCangYu").val(id);
        var id = $("#xgIdYingCangYu").val();
       $.ajax({
           type:"post",
           url:"${pageContext.request.contextPath}/login/DanChaGuiGe",
           data:{id:id},
           dataType:"json",
           success:function(data){
               for(var i=0;i<data.length;i++){
                   $("#xgbianma").val(data[i].bianma);
                   $("#xgproductName").val(data[i].productName);
                   $("#xgproductSize").val(data[i].productSize);
                   $("#xgoilproductName").val(data[i].oilproductName);
                   $("#xgoilproductSize").val(data[i].oilproductSize);
                   $("#xgtestunit").val(data[i].testunit);
                   $("#xgtestway").val(data[i].testway);
               }
               $("#ggxgModal").modal("show");
           }
        })

   }

    $("#yonghuXiuGai").click(function() {
        var data = new FormData($("#ggtjformIdxg")[0]);
        var id = $("#xgIdYingCangYu").val();
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/login/updateGuiGe",
            data:data,
            dataType:"json",
            processData:false,
            contentType:false,
            success:function(data){
                if(data){
                    alert("修改成功！！！");
                    $("#ggxgModal").modal("hide");
                    $("#BooStraptableGuiGeId").bootstrapTable("refresh");
                }else{
                    alert("修改失败！！！");
                }
            }
        })
    })

    //删除
    function ShanChuBuMen(id){
        $("#shanchuModal").modal("show");
        $("#shanchuanniu").click(function(){
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/login/deleteGuiGe",
                data:{id:id},
                dataType:"json",
                success:function(data){
                    if(data){
                        alert("删除成功！！！");
                        $("#shanchuModal").modal("hide");
                        $("#BooStrlaptableGuiGeId").bootstrapTable("refresh");
                    }
                }
            })
        })
    }


    //审核
    $("#guigeshenge").click(function(){
        var dx = $("#BooStraptableGuiGeId").bootstrapTable("getSelections");
        var id=dx[0].id;
        $("#shenheYingCangId").val(id);
        $("#shenheModal").modal("show");
    })

    $("#shenheanniu").click(function(){
        $.ajax({
            data:[],
            dataType:"json",
            url:"${pageContext.request.contextPath}/login/selectStatus",
            type:"post",
            success:function(data){
                var productStatus='已审';
                var id=$("#shenheYingCangId").val();
                for(var i=0;i<data.length;i++){
                    if(data[i].productStatus=='未审'){
                        $.ajax({
                            data:{id:id,productStatus:productStatus},
                            dataType:"json",
                            url:"${pageContext.request.contextPath}/login/XiuGaiStatus",
                            type:"post",
                            success:function(data){
                                $("#shenheModal").modal("hide");
                                $("#BooStraptableGuiGeId").bootstrapTable("refresh");
                            }
                        })
                    }else{
                        $("#shenheModal").modal("hide");
                    }
                }
            }
        })
    })



</script>


<%--审核id--%><input type="hidden" id="shenheYingCangId">

</html>
