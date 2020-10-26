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


    <div style="margin-top: 30px;margin-left: 50px;">
        状态&nbsp;&nbsp;<select class="btn btn-default" name="orderStatus" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 70px;" id="SelectzhuangtaiId"  >
                            <option selected="selected" value="">全部</option>
                            <option value="待确认">待确认</option>
                            <option value="已确认">已确认</option>
                            <option value="待生产">待生产</option>
                            <option value="已生产">已生产</option>
                            <option value="已结束">已结束</option>
                        </select>
        客户&nbsp;&nbsp;<select class="btn btn-default" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 70px;" id="SelectkehuId" name="customerId"></select>
        销售部门&nbsp;&nbsp;<select class="btn btn-default" style="border-color: #E5E5E5;width:160px;height: 35px; margin-right: 70px; " id="SelectbumenId" name="deptId"></select>
        销售员&nbsp;&nbsp;<select class="btn btn-default" style="border-color: #E5E5E5;width:160px;height: 35px; margin-right: 70px; " id="SelectxiaoshouyuanId" name="userId"></select><br><br>
        订单信息关键字&nbsp;&nbsp;<input name="orderName" class="btn btn-default" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
        订单编号&nbsp;&nbsp;<input name="orderEmpno" class="btn btn-default" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
        交货日期&nbsp;&nbsp;<input name="orderDate" type="date" class="btn btn-default" style="border-color: #E5E5E5;width:160px;height: 35px;">至<input type="date" class="btn btn-default" style="border-color: #E5E5E5;width:160px;height: 35px;">
        <button style="background-color: #009688;margin-left: 30px;" class="btn btn-default" id="mohuSelect"><img src="/static/images/9.png"></button>
    </div>
    <table id="BooStraptableDingDanId" style="margin-top: 100px;"></table>


    <!-- 订单信息查看模态框（Modal） -->
    <div class="modal fade" id="dingdanCHakan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width: 70%;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">订单信息查看</h4>
                </div>
                <div class="modal-body">
                    <table border="1" id="ddcktable" style="width:960px;height:150px;border-color: #E6E6E6;"align="center">
                        <tr style="border-color: #E6E6E6;background-color: #F3F3F3;"align="center" >
                            <td style="border-color: #E6E6E6;">产品名称</td>
                            <td style="border-color: #E6E6E6;">型号规格</td>
                            <td style="border-color: #E6E6E6;">单位</td>
                            <td style="border-color: #E6E6E6;">日期</td>
                            <td style="border-color: #E6E6E6;">数量</td>
                            <td style="border-color: #E6E6E6;">确认数量</td>
                            <td style="border-color: #E6E6E6;">代储代销库存</td>
                            <td style="border-color: #E6E6E6;">ERP库存</td>
                        </tr>
                       <tr style="border-color: #E6E6E6;"align="center">
                           <td style="border-color: #E6E6E6;" id="shuju1"></td>
                           <td style="border-color: #E6E6E6;" id="shuju2"></td>
                           <td style="border-color: #E6E6E6;" id="shuju3"></td>
                           <td style="border-color: #E6E6E6;" id="shuju4"></td>
                           <td style="border-color: #E6E6E6;" id="shuju5"></td>
                           <td style="border-color: #E6E6E6;" id="shuju6"></td>
                           <td style="border-color: #E6E6E6;" id="shuju7"></td>
                           <td style="border-color: #E6E6E6;" id="shuju8"></td>
                        </tr>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>


    <!-- 订单详情模态框（Modal） -->
    <div class="modal fade" id="DingDanXiangQingModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel1">订单查看</h4>
                </div>
                <div class="modal-body">在这里添加一些文本</div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>






</body>

<script>
    $(function(){
        guigeModal();
        HUiXianShuju();
    });

    //客户、销售部门、销售员
    function HUiXianShuju() {
        $.ajax({
            data:[],
            dataType:"json",
            type:"post",
            url:"${pageContext.request.contextPath}/login/HuiXianDingDanManager2",
            success:function(data){
                var kk = "";
                kk+="<option value='' selected=’selected'>请选择</option>";
                for(var i=0;i<data.length;i++){
                    kk+="<option  value='"+data[i].id+"'>"+data[i].customerName+"</option>";
                }
                $("#SelectkehuId").append(kk);  //客户
            }
        });
        $.ajax({
            data:[],
            dataType:"json",
            type:"post",
            url:"${pageContext.request.contextPath}/login/HuiXianDingDanManager3",
            success:function(data){
                var xx = "";
                xx+="<option value='' selected=’selected'>请选择</option>";
                for(var i=0;i<data.length;i++){
                    xx+="<option value='"+data[i].id+"'>"+data[i].deptName+"</option>";
                }
                $("#SelectbumenId").append(xx);  //部门
            }
        });
        $.ajax({
            data:[],
            dataType:"json",
            type:"post",
            url:"${pageContext.request.contextPath}/login/HuiXianDingDanManager4",
            success:function(data){
                var xs = "";
                xs+="<option value='' selected=’selected'>请选择</option>";
                for(var i=0;i<data.length;i++){
                    xs+="<option value='"+data[i].id+"'>"+data[i].allName+"</option>";
                }
                $("#SelectxiaoshouyuanId").append(xs);  //销售员
            }
        })
    }



    function guigeModal(){
        $("#BooStraptableDingDanId").bootstrapTable({
            url:"${pageContext.request.contextPath}/login/DingDanQuanXian",
            contentType:"application/x-www-form-urlencoded;charset=UTF-8",
            method:"post",
            cache:false,
            queryParams:function(params){
                return{
                    orderStatus:$("#SelectzhuangtaiId :selected").val(),
                    customerId:$("#SelectkehuId :selected").val(),
                    deptId:$("#SelectbumenId :selected").val(),
                    userId:$("#SelectxiaoshouyuanId :selected").val(),
                    orderName:$("input[name=orderName]").val(),
                    orderEmpno:$("input[name=orderEmpno]").val(),
                    orderDate:$("input[name=orderDate]").val(),
                }
            },
            columns:[
                {
                    field:"checkbox",
                    checkbox:true,
                },
                {
                    title:"序号",
                    field:"id",
                },
                {
                    title:"订单编号",
                    field:"orderEmpno",
                },
                {
                    title:"客户",
                    field:"customerName",
                },
                {
                    title:"订单信息",
                    field:"infoName"+"infoSize"+"infoNumber"+"infoDanwei",
                    formatter:function(value,row,index) {
                        var hh = "";
                        hh += "<a href ='javascript:DdxxInfo("+row.id+")' style='text-decoration:none;'>"+row.infoName+'&nbsp;&nbsp;'+row.infoSize+'&nbsp;&nbsp;'+row.infoNumber+row.infoDanwei+"</a>";
                        return hh;
                    }
                },
                {
                    title:"状态",
                    field:"orderStatus",
                },
                {
                    title:"操作",
                    width:"400px",
                    formatter:function(value,row,index) {
                        var aa = "";
                        aa +="<a href ='javascript:DingDanXiangQiang("+row.id+")'  style='text-decoration:none;'><button class=\"btn btn-default\" style='background-color:#009688;color: white;margin-right: 15px;'>详情</button>&nbsp;&nbsp;&nbsp;</a>";
                        return aa;
                    }
                },
            ]
        })
    }

    $("#mohuSelect").click(function(){
        guigeModal();
        $("#BooStraptableDingDanId").bootstrapTable("refresh");
    })


    function DdxxInfo(id){
        $("#dingdanCHakan").modal("show");
        $.ajax({
            data:{id:id},
            dataType:"json",
            url:"${pageContext.request.contextPath}/login/selectDingDanCha",
            type:"post",
            success:function(data){
                var pp="";
                if(data){
                    $("#shuju1").html(data.infoName);
                    $("#shuju2").html(data.infoSize);
                    $("#shuju3").html(data.infoDanwei);
                    $("#shuju4").html(data.infoTime);
                    $("#shuju5").html(data.infoNumber);
                    $("#shuju6").html(data.infoRenumber);
                    $("#shuju7").html(data.kucun);
                    $("#shuju8").html(data.erpkucun);
                }
            }
        })
    }

    //点击详情查看具体信息
    function DingDanXiangQiang(id) {
        $("#DingDanXiangQingModal").modal("show");
    }

</script>



</html>
