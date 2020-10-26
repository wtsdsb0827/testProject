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
<script type="text/javascript"
        src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap-table-zh-CN.min.js"></script>
<body>

<div>
    <button class="btn btn-default"
            style="width:80px; height:40px;background-color:#009688;color: white;margin-left: 50px;margin-top: 50px;"
            id="addClick">添加
    </button>
    <button class="btn btn-default"
            style="width:80px; height:40px;background-color:#FF5722;color: white; margin-top: 50px;" id="shanchuanniu">
        删除
    </button>
    <table id="BooStraptableId" style="margin-top: 100px;"></table>
</div>




<!-- 角色管理的添加模态框（Modal） -->
<div class="modal fade" id="addRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">添加角色</h4>
            </div>
            <div class="modal-body" align="left">
                角色名称<input name="roleName" type="text" class="btn btn-default"><br><br>
                排序<input value="1" type="text" name="roleSort" class="btn btn-default">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="quedingannniu">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<!-- 角色管理的删除模态框（Modal） -->
<div class="modal fade" id="deleteRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
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
                <button type="button" class="btn btn-primary" id="shanchudingannniu">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 角色管理的删除模态框2（Modal） -->
<div class="modal fade" id="deleteRoleModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel2">信息</h4>
            </div>
            <div class="modal-body" align="left">
                确定要删除吗？
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="shanchudingannniu2">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>

<!-- 角色管理的修改模态框（Modal） -->
<div class="modal fade" id="XiuGaiRoleModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelXiuGai">信息</h4>
            </div>
            <div class="modal-body">
                角色名称<input name="roleName" id="roleNameId" type="text" class="btn btn-default"><br><br>
                排序<input value="0" type="text" name="roleSort" id="roleSortId" class="btn btn-default">
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="xiugaidingannniu">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


<!-- 角色管理的权限设定模态框（Modal） -->
<div class="modal fade" id="QuaXianRoleManagerModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" style="width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabelXiuGai1">权限设定</h4>
            </div>
            <div class="modal-body">

                <table border="1"
                       style="width:898px;height:90px; border-color:#E5E5E5;margin-top: -15px; margin-left: -15px;margin-right: 400px;">
                    <tr>
                        <td style="width:180px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;角色名称：</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${user.allName}</td>
                    </tr>

                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;作：</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="checkbox" style="zoom:180%;vertical-align:-3px;" id="check1Id" onclick="checkboxOnclick(this)">&nbsp;&nbsp;全选/全不选
                        </td>
                    </tr>
                </table>

                <table id="appendtable1"></table>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="quanxianquedingannniu">确定</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
            </div>
        </div>
    </div>
</div>


</body>

<script type="text/javascript">

    $(function () {
        Juese();
    })

    function Juese() {
        $("#BooStraptableId").bootstrapTable({
            url: "${pageContext.request.contextPath}/login/JueSeQuanXian",
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            method: "post",
            cache: false,
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
                    title: "角色名称",
                    field: "roleName",
                },
                {
                    title: "排序",
                    field: "roleSort",
                },
                {
                    title: "操作",
                    width: "400px",
                    formatter: function (value, row, index) {
                        var aa = "";
                        aa += "<a href ='javascript:XiuGaiRoleManager(\"" + row.id + "\")'  style='text-decoration:none;'><button style='background-color:#009688;color: white;'>编辑</button>&nbsp;&nbsp;&nbsp;</a>";
                        aa += "<a href ='javascript:QuaXianRoleManager(\"" + row.id + "\")' style='text-decoration:none;'><button style='background-color:#009688;color: white;'>权限设定</button>&nbsp;&nbsp;&nbsp;</a>";
                        aa += "<a href ='javascript:ShanChuRoleManager(\"" + row.id + "\")' style='text-decoration:none;'><button style='background-color:#009688;color: white;'>删除</button>&nbsp;&nbsp;&nbsp;</a>";
                        return aa;
                    }
                },
            ]
        })
    };


    //添加角色
    $("#addClick").click(function () {
        $("#addRoleModal").modal("show");
    })


    $("#quedingannniu").click(function () {
        var roleName = $("input[name=roleName]").val();
        var roleSort = $("input[name=roleSort]").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/login/addRole",
            data: {roleName: roleName, roleSort: roleSort},
            type: "post",
            dataType: "json",
            success: function (data) {
                alert("添加成功！！！");
                $("#addRoleModal").modal("hide");
                $("#BooStraptableId").bootstrapTable("refresh");
            }
        })
    });


    //删除角色
    $("#shanchuanniu").click(function () {
        $("#deleteRoleModal").modal("show");
    })

    $("#shanchudingannniu").click(function () {
        var duixiang = $("#BooStraptableId").bootstrapTable("getSelections");
        var id = duixiang[0].id;
        $.ajax({
            url: "${pageContext.request.contextPath}/login/deleteRole",
            data: {id: id},
            type: "post",
            dataType: "json",
            success: function (data) {
                alert("删除成功！！！");
                $("#deleteRoleModal").modal("hide");
                $("#BooStraptableId").bootstrapTable("refresh");
            }
        })
    })


    //编辑角色
    function XiuGaiRoleManager(id) {
        var id = $("#roleRoleId1").val(id);
        $("#XiuGaiRoleModal").modal("show");
        var roleee = $("#BooStraptableId").bootstrapTable("getSelections");
        var name = roleee[0].roleName;
        $("#roleNameId").val(name);
    }

    $("#xiugaidingannniu").click(function () {
        var roleName = $("#roleNameId").val();
        var roleSort = $("#roleSortId").val();
        var id = $("#roleRoleId1").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/login/xiugaiRole",
            data: {id: id, roleName: roleName, roleSort: roleSort},
            type: "post",
            dataType: "json",
            success: function (data) {
                alert("修改成功！！！");
                $("#XiuGaiRoleModal").modal("hide");
                $("#BooStraptableId").bootstrapTable("refresh");
            }
        })
    })

    //权限设定
    function QuaXianRoleManager(id) {
        $("#QuaXianRoleManagerModal").modal("show");
        QuanXian();
    }

    function QuanXian() {
        var id = ${user.roleId};
        $.ajax({
            data: {id: id},
            dataType: "json",
            url: "${pageContext.request.contextPath}/login/selectUseQuanXian",
            type: "post",
            success: function (data) {
                var wts = "";
                //遍历所有的父节点
                for (var i = 0; i < data.length; i++) {
                    wts += "<table  border=\"1\" style=\"width:898px;height: 60px; border-color:#E5E5E5; margin-left: -15px;margin-top: 30px;\" >";
                    wts += "<tr>";
                    wts += "<td>";
                    if (data[i].quanxian == "true") {
                        wts += " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name = \"checkName\"  type = \"checkbox\" checked=\"checked\"; style=\"zoom:180%;vertical-align:-3px;\">&nbsp;&nbsp;" + data[i].menuName;
                    } else {
                        wts += " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name = \"checkName\" type = \"checkbox\" style=\"zoom:180%;vertical-align:-3px;\">&nbsp;&nbsp;" + data[i].menuName;
                    }
                    wts += "</td>";
                    wts += "</tr>";
                    wts += "</table>";

                    //遍历所有的子节点
                    for (var j = 0; j < data[i].childList.length; j++) {
                        var jj = data[i].childList[j];
                        wts += "<table  border=\"1\" style=\"width:800px;height: 100px; border-color:#E5E5E5;margin-top: 30px;margin-left: 34px;\">";
                        wts += "<tr>";
                        wts += "<td>";
                        if (jj.quanxian == "true") {
                            wts += " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name = \"checkName\"  type = \"checkbox\" checked=\"checked\"; style=\"zoom:180%;vertical-align:-3px;\">&nbsp;&nbsp;" + jj.menuName;
                        } else {
                            wts += " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name = \"checkName\"  type = \"checkbox\" style=\"zoom:180%;vertical-align:-3px;\">&nbsp;&nbsp;" + jj.menuName;
                        }
                        wts += "</td>";
                        wts += "</tr>";
                        wts += "<tr>";
                        wts += "<td>";
                        //遍历子节点下的所有功能
                        for (var h = 0; h < jj.childList.length; h++) {
                            var hh = jj.childList[h];
                            if (hh.quanxian == "true") {
                                wts += " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name = \"checkName\"  type = \"checkbox\" checked=\"checked\"; style=\"zoom:180%;vertical-align:-3px;\">&nbsp;&nbsp;" + hh.menuName;
                            } else {
                                wts += " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name = \"checkName\"  type = \"checkbox\" style=\"zoom:180%;vertical-align:-3px;\">&nbsp;&nbsp;" + hh.menuName;
                            }
                        }
                        wts += "</td>";
                        wts += "</tr>";
                        wts += "</table>";
                    }
                }
                $("#appendtable1").append(wts);
            }
        })
    }


    //点击权限设定中的确定按钮进行权限的设置
    $("#quanxianquedingannniu").click(function () {

    });


    //删除
    function ShanChuRoleManager(id) {
        $("#roleRoleId").val(id);
        $("#deleteRoleModal2").modal("show");
    }

    $("#shanchudingannniu2").click(function () {
        var id = $("#roleRoleId").val();
        $.ajax({
            url: "${pageContext.request.contextPath}/login/deleteRole",
            data: {id: id},
            type: "post",
            dataType: "json",
            success: function (data) {
                alert("删除成功！！！");
                $("#deleteRoleModal2").modal("hide");
                $("#BooStraptableId").bootstrapTable("refresh");
            }
        })
    })


    //点击全选全不选
    function checkboxOnclick(checkbox) {
        if (checkbox.checked == true) {
            var che = document.getElementsByName("checkName");
            for (var j = 0; j < che.length; j++) {
                che[j].checked = true;
            }
        } else if (checkbox.checked == false) {
            var che = document.getElementsByName("checkName");
            for (var j = 0; j < che.length; j++) {
                che[j].checked = false;
            }
        }
    }


</script>
<%--角色管理删除的隐藏域id--%><input id="roleRoleId" type="hidden">
<%--角色管理修改的隐藏域id--%><input id="roleRoleId1" type="hidden">

</html>
