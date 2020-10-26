<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--<%@ page import="com.bgs.pojo.Menu" %>--%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <!-- import CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}\static\element\index.css">
    <style type="text/css">
        [v-cloak] {
            display: none;
        }
    </style>
</head>
<body>

<%--<style>





    body{
        /*background-color: #DCDFE6;*/
        margin: 0;

    }
    #app{

    }
    .form-div{
        background-color: #ffffff;
        border: 1px solid #eCeFE6;
        padding: 50px  80px;
    }
    .form-div div{
        margin-top: 20px;
    }

    .el-main{
        padding-left: 0;

    }
    .el-menu{
        border-right: none;
    }
</style>--%>

<%--<%
    List<Menu> list = new ArrayList<Menu>();
    list.add(new Menu(1,"父级菜单1",0));
    list.add(new Menu(2,"父级菜单2",0));
    list.add(new Menu(3,"父级菜单3",0));
    list.add(new Menu(4,"父级菜单4",0));
    list.add(new Menu(5,"父级菜单5",0));
    list.add(new Menu(6,"子菜单11",1));
    list.add(new Menu(7,"子菜单12",1));
    list.add(new Menu(8,"父级菜单13",1));
    list.add(new Menu(9,"子菜单21",2));
    list.add(new Menu(10,"子菜单22",2));
    list.add(new Menu(11,"子菜单31",3));
    list.add(new Menu(12,"子菜单32",3));
    list.add(new Menu(13,"子菜单41",4));
    list.add(new Menu(14,"子菜单51",5));
    list.add(new Menu(15,"子菜单52",5));


    // 第一步 找到 所有的一级菜单，存到pList中
    List<Menu> pList = new ArrayList<>();
    for(Menu menu: list){
        if(menu.getpId() == 0){
            pList.add(menu);
        }
    }

    // 第二步： 填充 一级菜单里的childList

    for(Menu menu : list){
        if(menu.getpId() != 0){
            // 当前menu 是一个子菜单

            // 遍历 一级 菜单 集合，寻找 当前子菜单 属于哪个父菜单
            for(Menu pMenu: pList){
                if(pMenu.getId() == menu.getpId()){
                    pMenu.getChildList().add(menu);
                }
            }

        }
    }

    pageContext.setAttribute("pList",pList);


%>--%>



<%--<div id="app" style="display: none" >--%>
<div id="app"  v-cloak>
    <%--<el-button @click="visible = true">Button</el-button>
    <el-dialog :visible.sync="visible" title="Hello world">
        <p>Try Element</p>
    </el-dialog>--%>

    <el-container>
        <%--<el-header height="60px">

            <el-menu
                    :default-active="activeIndex2"
                    class="el-menu-demo"
                    mode="horizontal"
                    @select="handleSelect"
            &lt;%&ndash;background-color="#545c64"&ndash;%&gt;
            &lt;%&ndash;text-color="#fff"&ndash;%&gt;
            &lt;%&ndash;active-text-color="#ffd04b"&ndash;%&gt;
            >
                <el-menu-item index="1">
                    <template slot="title">
                        <span>处理中心</span>
                    </template>
                </el-menu-item>
                <el-submenu index="2">
                    <template slot="title">我的工作台</template>
                    <el-menu-item index="2-1">
                        <template slot="title">选项1</template>
                    </el-menu-item>
                    <el-menu-item index="2-1">
                        <template slot="title">选项2</template>
                    </el-menu-item>
                    <el-menu-item index="2-1">
                        <template slot="title">选项3</template>
                    </el-menu-item>
                </el-submenu>
                <el-menu-item index="3">
                    <template slot="title">消息中心</template>
                </el-menu-item>
                <el-menu-item index="4">
                    <template slot="title"><a href="/" target="_blank">消息中心</a></template>
                </el-menu-item>
            </el-menu>
        </el-header>--%>
        <el-main>

            <el-row>
                <%--<el-col :span="6">
                    <div style="height: 1024px;">

                        <el-menu
                                default-active="2"
                                class="el-menu-vertical-demo"
                                @open="handleOpen"
                                @close="handleClose"
                        >
                            <c:forEach var="pMenu" items="${pList}" varStatus="status">

                                <el-submenu index="${status.index + 1}">
                                    <template slot="title">
                                        <i class="el-icon-menu"></i>
                                        <span>${pMenu.name}</span>
                                    </template>

                                    <c:forEach var="childMenu" items="${pMenu.childList}" varStatus="status2">

                                        <el-menu-item index="${status.index + 1}-${status2.index + 1}">${childMenu.name}</el-menu-item>

                                    </c:forEach>

                                </el-submenu>
                            </c:forEach>

                        </el-menu>
                    </div>


                </el-col>--%>

                <%--<el-col :span="18">--%>

                    <div>
                        <template>
                            <el-table
                                    ref="multipleTable"
                                    :data="tableData3"
                                    tooltip-effect="dark"
                                    style="width: 100%"
                                    @selection-change="handleSelectionChange">
                                <el-table-column
                                        type="selection"
                                        width="55">
                                </el-table-column>
                                <el-table-column
                                        label="日期"
                                        width="120">
                                    <template slot-scope="scope">{{ scope.row.date }}</template>
                                </el-table-column>
                                <el-table-column
                                        prop="name"
                                        label="姓名"
                                        width="120">
                                </el-table-column>
                                <el-table-column
                                        prop="address"
                                        label="地址"
                                        show-overflow-tooltip>
                                </el-table-column>
                            </el-table>
                        </template>


                    </div>
                <%--</el-col>
            </el-row>
        </el-main>
    </el-container>


</div>--%>
</body>
<!-- import Vue before Element -->
<script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
<script src="${pageContext.request.contextPath}/static/element/index.js"></script>
<script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
<script>
    new Vue({
        el: '#app',
        //页面加载成功时完成
        mounted: function(){
            var _this = this;
            axios
                .post('${pageContext.request.contextPath}/login/DingDanQuanXian')
                .then(function(res){
                    _this.deptData = res.data;
                })
                .catch(function (error) { // 请求失败处理
                    console.log(error);
                });

        },
        methods: {
        },
        data: function() {
            return {

                /*menuData: [{"id":1,"name":"父级菜单1","pid":0,"url":"","childList":[{"id":6,"name":"子菜单11","pid":1,"url":"","childList":[{"id":15,"name":"子菜单11-1","pid":6,"url":"","childList":[]},{"id":15,"name":"子菜单11-2","pid":6,"url":"","childList":[]}]},{"id":7,"name":"子菜单12","pid":1,"url":"","childList":[]},{"id":8,"name":"子菜单13","pid":1,"url":"","childList":[]}]},{"id":2,"name":"父级菜单2","pid":0,"url":"","childList":[{"id":9,"name":"子菜单21","pid":2,"url":"","childList":[]},{"id":10,"name":"子菜单22","pid":2,"url":"","childList":[]}]},{"id":3,"name":"父级菜单3","pid":0,"url":"","childList":[{"id":11,"name":"子菜单31","pid":3,"url":"","childList":[]},{"id":12,"name":"子菜单32","pid":3,"url":"","childList":[]}]},{"id":4,"name":"父级菜单4","pid":0,"url":"","childList":[{"id":13,"name":"子菜单41","pid":4,"url":"","childList":[{"id":15,"name":"子菜单41-1","pid":13,"url":"","childList":[]},{"id":15,"name":"子菜单41-2","pid":13,"url":"","childList":[]}]}]},{"id":5,"name":"父级菜单5","pid":0,"url":"","childList":[{"id":14,"name":"子菜单51","pid":5,"url":"","childList":[]},{"id":15,"name":"子菜单52","pid":5,"url":"","childList":[]}]}],
                deptData: [{"id":1,"name":"父级菜单1","pid":0,"url":"","childList":[{"id":6,"name":"子菜单11","pid":1,"url":"","childList":[{"id":15,"name":"子菜单11-1","pid":6,"url":"","childList":[]},{"id":15,"name":"子菜单11-2","pid":6,"url":"","childList":[]}]},{"id":7,"name":"子菜单12","pid":1,"url":"","childList":[]},{"id":8,"name":"子菜单13","pid":1,"url":"","childList":[]}]},{"id":2,"name":"父级菜单2","pid":0,"url":"","childList":[{"id":9,"name":"子菜单21","pid":2,"url":"","childList":[]},{"id":10,"name":"子菜单22","pid":2,"url":"","childList":[]}]},{"id":3,"name":"父级菜单3","pid":0,"url":"","childList":[{"id":11,"name":"子菜单31","pid":3,"url":"","childList":[]},{"id":12,"name":"子菜单32","pid":3,"url":"","childList":[]}]},{"id":4,"name":"父级菜单4","pid":0,"url":"","childList":[{"id":13,"name":"子菜单41","pid":4,"url":"","childList":[{"id":15,"name":"子菜单41-1","pid":13,"url":"","childList":[]},{"id":15,"name":"子菜单41-2","pid":13,"url":"","childList":[]}]}]},{"id":5,"name":"父级菜单5","pid":0,"url":"","childList":[{"id":14,"name":"子菜单51","pid":5,"url":"","childList":[]},{"id":15,"name":"子菜单52","pid":5,"url":"","childList":[]}]}],
*/
            }
        }
    });


</script>
</html>