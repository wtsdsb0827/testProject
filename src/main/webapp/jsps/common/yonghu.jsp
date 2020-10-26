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


<%--将模糊查询中下拉框的值赋值到隐藏域--%><input id="mohuYinCangId" type="hidden">


<%--页面头部--%>
<div style="margin-top: 50px;margin-left: 60px;">
    用户名&nbsp;&nbsp;<input name="userName" id="userName22" class="btn btn-default" placeholder="请输入" type="text" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
    真实姓名&nbsp;&nbsp;<input name="allName" id="allName22" class="btn btn-default" placeholder="请输入" type="text" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
    联系电话&nbsp;&nbsp;<input name="telphone" id="telphone22" class="btn btn-default" placeholder="请输入" type="text" style="border-color: #E5E5E5;width:160px;height: 35px;margin-right: 60px;">
    所属部门&nbsp;&nbsp;<select id="selectId1" name="deptId" class="btn btn-default" style="border-color: #E5E5E5;width:160px;height: 35px;"></select>
    <button style="background-color: #009688;margin-left: 20px;" class="btn btn-default" id="mohuclick">
        <img src="/static/images/9.png"></button>
</div>
<div>
    <button class="btn btn-default"
            style="width:80px; height:40px;background-color:#009688;color: white; margin-left: 20px;margin-top: 30px;"
            id="yhtj">添加
    </button>&nbsp;&nbsp;&nbsp;
    <button class="btn btn-default"
            style="width:80px; height:40px;background-color:#FF5722;color: white;margin-top: 30px;" id="yhsc"> 删除
    </button>&nbsp;&nbsp;&nbsp;
    <button class="btn btn-default"
            style="width:120px; height:40px;background-color:#009688;color: white;margin-top: 30px;">同步ERP员工
    </button>
    <table id="BooStraptableYonghuId" style="margin-top: 100px;"></table>
</div>


<!-- 用户管理添加模态框（Modal） -->
<div class="modal fade" id="yhtjModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:450px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加用户</h4>
            </div>
            <div class="modal-body" align="center">
                <form method="post" id="formId">
                    用户名&nbsp;&nbsp;&nbsp;<input placeholder="请输入用户名" type="text" name="userName" class="btn btn-default"
                                                style="width: 300px;margin-bottom: 15px;height: 40px;"><br>
                    真实姓名<input placeholder="请输入真实姓名" type="text" name="allName" class="btn btn-default"
                               style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    密码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="请输入密码" type="password"
                                                                       name="password" class="btn btn-default"
                                                                       style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    手机号码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="请输入手机号码" type="text"
                                                                         name="telphone" class="btn btn-default"
                                                                         style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="请输入邮箱" type="text" name="email"
                                                                       class="btn btn-default"
                                                                       style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    所属部门<select class="btn btn-default" style="width: 300px;margin-bottom:15px;height:40px"
                                id="selectId2" name="deptId"></select><br>
                    所属角色<select class="btn btn-default" style="width: 300px;margin-bottom:15px;height:40px"
                                id="selectId3" name="roleId"></select><br>
                    简介&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="introduce" class="btn btn-default"
                                                                 style="width: 300px;margin-bottom: 15px;height: 100px;"><br>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="yonghuTianjia">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
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
                <button type="button" class="btn btn-primary" id="shanchuanniu">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<!-- 用户管理修改模态框（Modal） -->
<div class="modal fade" id="xgModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:450px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabe2">修改用户</h4>
            </div>
            <div class="modal-body" align="center">
                <form method="post" id="formId2">


                    <%--用户id存到隐藏域--%><input id="yhId" name="id" type="hidden">

                    用户名&nbsp;&nbsp;&nbsp;<input placeholder="请输入用户名" id="userName" type="text" name="userName"
                                                class="btn btn-default"
                                                style="width: 300px;margin-bottom: 15px;height: 40px;"><br>
                    真实姓名<input placeholder="请输入真实姓名" type="text" id="allName" name="allName" class="btn btn-default"
                               style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    手机号码&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="请输入手机号码" id="telphone" type="text"
                                                                         name="telphone" class="btn btn-default"
                                                                         style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input placeholder="请输入邮箱" type="text" id="email"
                                                                       name="email" class="btn btn-default"
                                                                       style="width: 300px;margin-bottom: 15px;height: 40px"><br>
                    所属部门<select class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"
                                id="selectId22" name="deptId"></select><br>
                    所属角色<select class="btn btn-default" style="width: 300px;margin-bottom: 15px;height: 40px"
                                id="selectId33" name="roleId"></select><br>
                    简介&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="introduce" id="introduce"
                                                                 class="btn btn-default"
                                                                 style="width: 300px;margin-bottom: 15px;height: 100px;"><br>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="yonghuXiuGai">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<!-- 用户管理的删除模态框2（Modal） -->
<div class="modal fade" id="shanchuModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">信息</h4>
            </div>
            <div class="modal-body">
                确定要删除吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="shanchuanniu1">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


</body>


<script>


    $(function () {
        yonghuModal();
        MoHu();
    })

    function yonghuModal() {
        $("#BooStraptableYonghuId").bootstrapTable({
            url: "${pageContext.request.contextPath}/login/YongHuQuanXian",
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            method: "post",
            cache: false,
            queryParams: function (params) {
                return {
                    userName: $("#userName22").val(),
                    allName: $("#allName22").val(),
                    telphone: $("#telphone22").val(),
                    deptId: $("#mohuYinCangId").val(),
                }
            },
            columns: [
                {
                    field: "checkbox",
                    checkbox: true,
                },
                {
                    title: "ID",
                    field: "id",
                },
                {
                    title: "用户名",
                    field: "userName",
                },
                {
                    title: "真实姓名",
                    field: "allName",
                },
                {
                    title: "手机号码",
                    field: "telphone",
                },
                {
                    title: "所属部门",
                    field: "deptName",
                },
                {
                    title: "所属角色",
                    field: "roleName",
                },
                {
                    title: "操作",
                    width: "400px",
                    formatter: function (value, row, index) {
                        var aa = "";
                        aa += "<a href ='javascript:XiuGaiYongHu(\"" + row.id + "\")'  style='text-decoration:none;'><button class=\"btn btn-default\" style='background-color:#009688;color: white;margin-right: 15px;'>编辑</button>&nbsp;&nbsp;&nbsp;</a>";
                        aa += "<a href ='javascript:ShanChuRoleManager(\"" + row.id + "\")' style='text-decoration:none;'><button class=\"btn btn-default\" style='background-color:#FF5722;color: white;'>删除</button>&nbsp;&nbsp;&nbsp;</a>";
                        return aa;
                    }
                },
            ]
        })
    }


    //模糊查询
    function MoHu() {
        //部门数据回显
        $.ajax({
            url: "${pageContext.request.contextPath}/login/4",
            data: [],
            type: "post",
            dataType: "json",
            success: function (data) {
                var ss = "";
                for (var i = 0; i < data.length; i++) {
                    ss += "<option value='" + data[i].id + "'>" + data[i].deptName + "</option>";
                }
                $("#selectId1").append(ss);
            }
        })
    }

    $("#mohuclick").click(function(){
        var selectId = $("#selectId1").val();
        alert(selectId);
        $("#mohuYinCangId").val(selectId);
        yonghuModal();
        $("#BooStraptableYonghuId").bootstrapTable("refresh");
    })


    //点击添加按钮要执行的操作
    $("#yhtj").click(function () {
        //部门数据回显
        $.ajax({
            url: "${pageContext.request.contextPath}/login/selectDept",
            data: [],
            type: "post",
            dataType: "json",
            success: function (data) {
                var ss = "";
                for (var i = 0; i < data.length; i++) {
                    ss += "<option value='" + data[i].id + "'>" + data[i].deptName + "</option>";
                }
                $("#selectId2").append(ss);
            }
        })
        //角色数据回显
        $.ajax({
            url: "${pageContext.request.contextPath}/login/selectRole",
            data: [],
            type: "post",
            dataType: "json",
            success: function (data) {
                var dd = "";
                for (var i = 0; i < data.length; i++) {
                    dd += "<option value='" + data[i].id + "'>" + data[i].roleName + "</option>";
                }
                $("#selectId3").append(dd);
            }
        })
        //展示添加的模态框
        $("#yhtjModal").modal("show");
    })

    $("#yonghuTianjia").click(function () {
        var data = new FormData($("#formId")[0]);
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/login/addYongHu",
            data: data,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (data) {
                if (data) {
                    alert("添加成功！！！");
                    $("#yhtjModal").modal("hide");
                    $("#BooStraptableYonghuId").bootstrapTable("refresh");
                } else {
                    alert("添加失败！！！");
                }
            }
        })
    })


    //点击删除需要做的操作(需要选中节点再删除)
    $("#yhsc").click(function () {
        var dx = $("#BooStraptableYonghuId").bootstrapTable("getSelections");
        var id = dx[0].id;
        ShanChu(id);
        $("#shanchuModal").modal("show");
    })

    function ShanChu(id) {
        $("#shanchuanniu").click(function () {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/login/deleteYongHu",
                data: {id: id},
                dataType: "json",
                success: function (data) {
                    if (data) {
                        alert("删除成功！！！");
                        $("#shanchuModal").modal("hide");
                        $("#BooStraptableYonghuId").bootstrapTable("refresh");
                    }
                }
            })
        })
    }

    //点击修改按钮展示回显信息（单查）
    function XiuGaiYongHu(id) {
        $("#yhId").val(id);
        var id = $("#yhId").val();
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/login/DanChaYongHu",
            data: {id: id},
            dataType: "json",
            success: function (data) {
                for (var i = 0; i < data.length; i++) {
                    $("#userName").val(data[i].userName);
                    $("#allName").val(data[i].allName);
                    $("#telphone").val(data[i].telphone);
                    $("#email").val(data[i].email);
                    $("#introduce").val(data[i].introduce);
                    var deptId = data[i].deptId;
                    var roleId = data[i].roleId;

                    $.ajax({
                        url: "${pageContext.request.contextPath}/login/selectDept",
                        data: [],
                        type: "post",
                        dataType: "json",
                        success: function (data) {
                            var ss = "";
                            for (var i = 0; i < data.length; i++) {
                                if (deptId == data[i].id) {
                                    ss += "<option selected='selected' value='" + data[i].id + "'>" + data[i].deptName + "</option>";
                                } else {
                                    ss += "<option value='" + data[i].id + "'>" + data[i].deptName + "</option>"
                                }
                            }
                            $("#selectId22").append(ss);
                        }
                    })


                    $.ajax({
                        url: "${pageContext.request.contextPath}/login/selectRole",
                        data: [],
                        type: "post",
                        dataType: "json",
                        success: function (data) {
                            var dd = "";
                            for (var i = 0; i < data.length; i++) {
                                if (roleId == data[i].id) {
                                    dd += "<option selected='selected' value='" + data[i].id + "'>" + data[i].roleName + "</option>";
                                } else {
                                    dd += "<option value='" + data[i].id + "'>" + data[i].roleName + "</option>"
                                }     //如果回显的是当前的信息，那就在select中加入一个默认值，然后回显也可以显示其它的数据，那么就走else再查询一次其它数据即可。
                            }
                            $("#selectId33").append(dd);
                        }
                    })
                }
                $("#xgModal").modal("show");
            }
        })
    };
    $("#yonghuXiuGai").click(function () {
        var id = $("#yhId").val();
        var data = new FormData($("#formId2")[0]);
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/login/updateYongHu",
            data: data,
            dataType: "json",
            processData: false,
            contentType: false,
            success: function (data) {
                if (data) {
                    alert("修改成功！！！");
                    $("#xgModal").modal("hide");
                    $("#BooStraptableYonghuId").bootstrapTable("refresh");
                } else {
                    alert("修改失败！！！");
                }
            }
        })
    })

    //删除
    function ShanChuRoleManager(id) {
        $("#shanchuModal1").modal("show");
        $("#shanchuanniu1").click(function () {
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/login/deleteYongHu",
                data: {id: id},
                dataType: "json",
                success: function (data) {
                    if (data) {
                        alert("删除成功！！！");
                        $("#shanchuModal1").modal("hide");
                        $("#BooStraptableYonghuId").bootstrapTable("refresh");
                    }
                }
            })
        })
    }


</script>


</html>
