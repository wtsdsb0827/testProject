<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
</head>
<body>
<div id="app">


    <div style="margin-top: 30px;margin-left: 50px;margin-bottom: 40px;">
        状态:
        <el-select v-model="zhuangtai" placeholder="请选择" style="margin-right: 50px;" name="orderStatus">
            <el-option
                    v-for="item in zhuangtaishuzu"
                    :label="item.labelzt"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                    :value="item.valuezt">      <%-- 数据的值（id表示）--%>
            </el-option>
        </el-select>

        客户:
        <el-select v-model="kehu" placeholder="请选择" style="margin-right: 50px;" name="customerId" id="customerId">
            <el-option
                    v-for="user in kehushuzu"
                    :label="user.customerName"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                    :value="user.id">      <%-- 数据的值（id表示）--%>
            </el-option>
        </el-select>

        销售部门:
        <el-select v-model="bumen" placeholder="请选择" style="margin-right: 50px;" name="deptId" id="deptId">
            <el-option
                    v-for="item1 in bumenshuzu"
                    :label="item1.deptName"  <%--下拉框中显示的数据（数据库查出的字段）--%>
                    :value="item1.id">       <%-- 数据的值（id表示）--%>
            </el-option>
        </el-select>

        销售员:
        <el-select v-model="xiaoshouyuan" placeholder="请选择" style="margin-right: 50px;" name="userId" id="userId">
            <el-option
                    v-for="item2 in xiaoshouyuanshuzu"
                    :label="item2.allName"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                    :value="item2.id">      <%-- 数据的值（id表示）--%>
            </el-option>
        </el-select>
        <br><br>


        订单信息关键字:
        <el-input v-model="xinxi" placeholder="请输入内容" style="width: 200px;" name="orderName"></el-input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        订单编号:
        <el-input v-model="bianhao" placeholder="请输入内容" style="width: 200px;" name="orderEmpno" ></el-input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


        交货日期:
        <el-date-picker
                v-model="riqi"
                name="orderDate"
                type="daterange"
                range-separator="至"
                start-placeholder="开始日期"
                end-placeholder="结束日期">
        </el-date-picker>


        <button style="background-color: #009688;margin-left: 30px;height: 50px;width: 100px;" v-on:click="MoHuselect">
            <img src="/static/images/9.png">
        </button>
            <br><br>

        <el-row>
            <el-button style="background-color: #009688;height: 50px;color: white" @click="TianJiaAnNiu">新增订单</el-button>
            <el-button style="background-color: #FF5722;height: 50px;color: white" v-on:click="ShanChuAnNiu">删除订单</el-button>
            <el-button @click="open1" style="background-color: #009688;height: 50px;color: white" >完成订单</el-button>
            <el-button style="background-color: #009688;height: 50px;color: white">导入订单</el-button>
            <el-button style="background-color: #009688;height: 50px;color: white">下载模板</el-button>
        </el-row>
    </div>



    <%--表格的全部数据--%>
    <div>
        <template>
            <el-table ref="multipleTable" @selection-change="handleSelectionChange" :data="quancha" tooltip-effect="dark" style="width: 100%" >

                <el-table-column type="selection" width="100"></el-table-column>

                <el-table-column prop="id" label="序号" width="160"></el-table-column>

                <el-table-column prop="orderEmpno" label="订单编号" width="200"></el-table-column>

                <el-table-column prop="customerName" label="客户"  width="200" show-overflow-tooltip></el-table-column>

                <el-table-column prop="productName" label="订单信息" width="350" show-overflow-tooltip>
                    <template slot-scope="scope">
                        <el-button type="text" v-on:click="ddd(scope.row.id)">
                            {{scope.row.productName}}
                            {{scope.row.productSize}}
                            {{scope.row.infoNumber}}
                            {{scope.row.testunit}}
                        </el-button>
                    </template>
                </el-table-column>

                <el-table-column prop="orderStatus" width="200" label="状态" show-overflow-tooltip></el-table-column>

                <el-table-column label="操作" width="230">
                    <template slot-scope="scope">
                        <el-button @click="eee(scope.row.id)" size="mini">详情</el-button>
                        <el-button @click="xxx(scope.row.id)" size="mini">确认</el-button>
                    </template>
                </el-table-column>
            </el-table>
                        <br>
            <el-pagination
                    background
                    layout="prev, pager, next"
                    :total="1000">
            </el-pagination>
        </template>
    </div>


    <%--点击蓝色订单信息查看的数据--%>
    <div>
        <el-dialog title="订单信息查看" :visible.sync="bianliangid">
            <template>
                <el-table :data="dingdanshuzu">
                    <el-table-column prop="productName" label="产品名称"></el-table-column>
                    <el-table-column prop="productSize" label="规格型号"></el-table-column>
                    <el-table-column prop="testunit" label="单位"></el-table-column>
                    <el-table-column prop="infoTime" label="日期"></el-table-column>
                    <el-table-column prop="infoNumber" label="数量"></el-table-column>
                    <el-table-column prop="infoAllrenumber" label="确认数量"></el-table-column>
                    <el-table-column prop="kucun" label="代储代销库存"></el-table-column>
                    <el-table-column prop="erpkucun" label="ERP库存"></el-table-column>
                </el-table>
            </template>
        </el-dialog>
    </div>


    <%--点击订单详情按钮查看的信息--%>
    <div>
        <el-dialog title="订单查看" :visible.sync="bianliangid2" width="70%">
            <template>
                <el-tabs v-model="activeName">
                    <el-tab-pane label="用户管理" name="first" value="first" :data="dingdanduixiang">
                                <table style="width: 850px;height: 452px;margin-top: 30px;border-style:none;border-collapse:collapse" border=1  cellspacing="0" align="center" >
                                    <tr style="height: 60px;border-color: #E6E6E6;">
                                <td style="background-color:#F4F4F4;width:150px;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单状态</td>
                                <td style="width: 300px;border-color: #E6E6E6;" align="center">{{dingdanduixiang.orderStatus}}</td>
                                <td style="background-color: #F4F4F4;width: 150px;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售订单号</td>
                                <td style="width: 300px;border-color: #E6E6E6;" align="center">{{dingdanduixiang.orderEmpno}}</td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;销售员</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.allName}}</td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收件人部门</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.deptName}}</td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收件人联系电话</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.receivePhone}}</td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收件人传真</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.receiveChuanzhen}}</td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;收件人备注</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.receiveBeizhu}}</td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;客户</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.customerName}}</td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发件人部门</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendDept}}</td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发件人</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendPeople}}</td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发件日期</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendRiqi}}</td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发件人电话</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendPhone}}</td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发件人传真</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendChuanzhen}}</td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;备注</td>
                                <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.beizhu}}</td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="border-style:none;background-color: #F4F4F4;"align="center" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;图片</td>
                                <td colspan="3" style="border-color: #E6E6E6;">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<button style="height: 40px;">查看图片</button>
                                </td>
                            </tr>
                        </table>

                        <div style="width: 800px;height: 300px;margin-top: 50px;margin-left: 100px;" >
                            <template>
                                <el-table :data="dingdanshuzu">
                                    <el-table-column prop="productName" label="产品名称"></el-table-column>
                                    <el-table-column prop="productSize" label="规格型号"></el-table-column>
                                    <el-table-column prop="testunit" label="单位"></el-table-column>
                                    <el-table-column prop="infoTime" label="日期"></el-table-column>
                                    <el-table-column prop="infoNumber" label="数量"></el-table-column>
                                    <el-table-column prop="infoAllrenumber" label="确认数量"></el-table-column>
                                    <el-table-column prop="kucun" label="代储代销库存"></el-table-column>
                                    <el-table-column prop="erpkucun" label="ERP库存"></el-table-column>
                                </el-table>
                            </template>
                        </div>


                        <el-button style="margin-left: 500px;" >关闭</el-button>
                    </el-tab-pane>
                    <el-tab-pane label="排产信息" name="second">

                        <table style="width: 100%;size: 50px;border: 1px;margin-top: 50px;">
                            <tr :data="genzongDuix">
                                <td style="height: 60px; background-color:#F3F3F3;font-size: 20px;" align="center">排产计划跟踪号</td>
                                <td style="height: 60px;width: 200px; background-color:#F3F3F3;font-size: 20px;"colspan="3">{{genzongDuix.planEmpno}}</td>
                            </tr>

                            <tr>
                                <td><h3>第1-2条批次信息</h3></td>
                            </tr>

                            <tr >
                                <td style="height: 60px;width: 200px; background-color:#F3F3F3;font-size: 20px;" align="center">批次号</td>
                                <td style="height: 60px; background-color:#F3F3F3;font-size: 20px;" align="center" colspan="3">批次名称</td>
                            </tr>
                            <tr v-for="itme in piciduiX" >
                                <td style="height: 60px;font-size: 20px;" align="center">{{itme.batchEmpno}}</td>
                                <td style="height: 60px;width: 300px;font-size: 20px;" align="center" colspan="3">{{itme.batchName}}</td>
                            </tr>

                            <tr style="height: 60px; background-color:#F3F3F3;font-size: 20px;" align="center" >
                                <td>产品名称</td>
                                <td>规格型号</td>
                                <td>数量</td>
                                <td>单位</td>
                            </tr>
                            <tr style="height: 60px;font-size: 20px;" align="center" v-for="item in proshuzu">
                                <td>{{item.productName}}</td>
                                <td>{{item.productSize}}</td>
                                <td>{{item.productionNum}}</td>
                                <td>{{item.testunit}}</td>
                            </tr>
                            <tr style="height: 60px; background-color:#F3F3F3;font-size: 20px;" align="center">
                                <td>开始时间</td>
                                <td>结束时间</td>
                                <td colspan="3">所在车间</td>
                            </tr>
                            <tr style="height: 60px;font-size: 20px;" align="center" v-for="item in genjinshuzu">
                                <td>{{item.followStarttime}}</td>
                                <td>{{item.followEndtime}}</td>
                                <td>{{item.followWorkshop}}</td>
                            </tr>
                        </table>

                    </el-tab-pane>
                    <el-tab-pane label="发运信息" name="third">发运信息</el-tab-pane>
                    <el-tab-pane label="一般性质检验" name="fourth">一般性质检验</el-tab-pane>
                    <el-tab-pane label="质量检验信息" name="fifth">质量检验信息</el-tab-pane>
                </el-tabs>
            </template>
        </el-dialog>
    </div>



    <%--点击新增订单查看信息--%>
    <div>
        <el-dialog title="新增订单" :visible.sync="tianjiabianliang" width="70%">
            <template>
                <el-tabs v-model="activeName1" :data="tianjiaduixiang">
                <table style="width: 850px;height: 452px;margin-top: 30px;border-style:none;border-collapse:collapse" border=1  cellspacing="0" align="center" >
                            <tr style="height: 60px;border-color: #E6E6E6;">
                                <td style="background-color:#F4F4F4;width:150px;border-style:none;" align="right">订单状态&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center" >
                                    <template>
                                        <el-select v-model="valuezhuangtai" placeholder="请选择" style="width:250px;">
                                            <el-option v-for="item in options" :label="item.label" :value="item.value" ></el-option>
                                        </el-select>
                                    </template>
                                </td>
                                <td style="background-color: #F4F4F4;width: 150px;border-style:none;" align="right">销售订单号&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input1" style="width:250px;" placeholder="请输入销售订单号"></el-input>
                                </td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">销售员&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-select v-model="xiaoshouyuan1" placeholder="请选择" style="width:250px;">
                                        <el-option
                                                v-for="item2 in xiaoshouyuanshuzu"
                                                :label="item2.allName"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                                                :value="item2.id">      <%-- 数据的值（id表示）--%>
                                        </el-option>
                                    </el-select>
                                </td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人部门&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-select v-model="bumen1" placeholder="请选择" style="width:250px;">
                                        <el-option
                                                v-for="item1 in bumenshuzu"
                                                :label="item1.deptName"  <%--下拉框中显示的数据（数据库查出的字段）--%>
                                                :value="item1.id">       <%-- 数据的值（id表示）--%>
                                        </el-option>
                                    </el-select>
                                </td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人联系电话&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input2" style="width:250px;" placeholder="请输入收件人联系电话"></el-input>
                                </td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人传真&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input3" style="width:250px;" placeholder="请输入收件人传真"></el-input>
                                </td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人备注&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input4" style="width:250px;" placeholder="请输入收件人备注"></el-input>
                                </td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">客户&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-select v-model="kehu1" placeholder="请选择" style="width:250px;">
                                        <el-option
                                                v-for="user in kehushuzu"
                                                :label="user.customerName"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                                                :value="user.id">      <%-- 数据的值（id表示）--%>
                                        </el-option>
                                    </el-select>
                                </td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;border-style:none;" align="right">发件人部门&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input5" style="width:250px;" placeholder="请输入发件人部门"></el-input>
                                </td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">发件人&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input6" style="width:250px;" placeholder="请输入发件人"></el-input>
                                </td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">发件日期&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input7" style="width:250px;" placeholder="请输入发件日期"></el-input>
                                </td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">发件人电话&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input8" style="width:250px;" placeholder="请输入发件人电话"></el-input>
                                </td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">发件人传真&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input9" style="width:250px;" placeholder="请输入发件人传真"></el-input>
                                </td>
                                <td style="background-color: #F4F4F4;border-style:none;" align="right">备注&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                    <el-input v-model="input10" style="width:250px;" placeholder="请输入备注"></el-input>
                                </td>
                            </tr>
                            <tr style="height: 60px;">
                                <td style="border-style:none;background-color: #F4F4F4;"align="right">图片&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td colspan="3" style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                    <button style="height: 40px;margin-left: 15px;">查看图片</button>
                                </td>
                            </tr>
                        </table>
                    <el-button style="background-color: #009688;height: 50px;color: white;margin-top: 20px;margin-left:80px;" @click="xinZengShiJian">新增</el-button><br>
                        <table style="width: 950px;height:60px;margin-top: 30px;margin-left:15px;border-style:none;border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" border=1  cellspacing="0" >
                            <tr>
                                <td style="height:80px;background-color:#F4F4F4;padding-left:40px;border-style:none;border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 100px;" rowspan="100">订单信息</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 140px;"align="center">产品编码</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 140px;"align="center">规格型号</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;"align="center">单位</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 100px;" align="center">交货日期</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 120px;"align="center">数量</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;"align="center">代储代销库存</td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;"align="center">ERP库存</td>
                            </tr>

                            <tr v-for="(row,index) in zizeshuzu">
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                    <el-select @change="GaiBianShiJian(row.bianma,index)" v-model="row.bianma" align="center">
                                        <el-option
                                                v-for="rows in guigeshuzu"
                                                :label="rows.bianma"
                                                :value="rows.id">
                                        </el-option>
                                    </el-select>
                                </td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                    <el-input v-model="row.productSize"></el-input>
                                </td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                    <el-input v-model="row.testunit"></el-input>
                                </td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                    <el-date-picker
                                            v-model="row.infoTime"
                                            type="date"
                                            placeholder="选择日期"
                                            style="width:140px;">
                                    </el-date-picker>
                                </td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                    <template>
                                        <el-input-number
                                                v-model="row.infoNumber"
                                                controls-position="right"
                                                @change="handleChange" :min="1" :max="1000000"
                                                style="width:120px;">
                                        </el-input-number>
                                    </template>
                                </td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                    <el-input v-model="row.kucun" ></el-input>
                                </td>
                                <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                    <el-input v-model="row.erpkucun" ></el-input>
                                </td>
                            </tr>

                        </table>
                    <el-button style="margin-left: 400px;margin-top: 100px;" @click="TianJiaTiJiao">确定</el-button>
                    <el-button @click="tianjiabianliang = false">取消</el-button>

                </el-tabs>
            </template>
        </el-dialog>
    </div>



    <%--订单信息的修改操作--%>
    <div>
        <el-dialog title="修改订单" :visible.sync="xiugaibianliang" width="70%" :append-to-body="true"> <%--默认是false，防止不弹框--%>
            <template>
                <el-tabs v-model="activeName2" :data="xiugaiduixiang">
                    <table style="width: 850px;height: 452px;margin-top: 30px;border-style:none;border-collapse:collapse" border=1  cellspacing="0" align="center" >
                        <tr style="height: 60px;border-color: #E6E6E6;">
                            <td style="background-color:#F4F4F4;width:150px;border-style:none;" align="right">订单状态&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center" >
                                <template>
                                    <el-select v-model="valuezhuangtai2" style="width:250px;">
                                        <el-option v-for="item in options"
                                                   :label="item.label"
                                                   :value="item.value">
                                        </el-option>
                                    </el-select>
                                </template>
                            </td>
                            <td style="background-color: #F4F4F4;width: 150px;border-style:none;" align="right">销售订单号&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.orderEmpno" style="width:250px;" >{{xiugaiduixiang.orderEmpno}}</el-input>
                            </td>
                        </tr>
                        <tr style="height: 60px;">
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">销售员&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-select v-model="xiaoshouyuan2.xs" style="width:250px;">
                                    <el-option
                                            v-for="item2 in xiaoshouyuanshuzu"
                                            :label="item2.allName"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                                            :value="item2.id">      <%-- 数据的值（id表示）--%>
                                    </el-option>
                                </el-select>
                            </td>
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人部门&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-select v-model="xiugaiduixiang.id" style="width:250px;">
                                    <el-option
                                            v-for="item1 in bumenshuzu"
                                            :label="item1.deptName"  <%--下拉框中显示的数据（数据库查出的字段）--%>
                                            :value="item1.id">       <%-- 数据的值（id表示）--%>
                                    </el-option>
                                </el-select>
                            </td>
                        </tr>
                        <tr style="height: 60px;">
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人联系电话&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.receivePhone" style="width:250px;" >{{xiugaiduixiang.receivePhone}}</el-input>
                            </td>
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人传真&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.receiveChuanzhen" style="width:250px;" >{{xiugaiduixiang.receiveChuanzhen}}</el-input>
                            </td>
                        </tr>


                        <tr style="height: 60px;">
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人备注&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.receiveBeizhu" style="width:250px;" >{{xiugaiduixiang.receiveBeizhu}}</el-input>
                            </td>
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">客户&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-select v-model="kehu2.kh" placeholder="请选择" style="width:250px;">
                                    <el-option
                                            v-for="user in kehushuzu"
                                            :label="user.customerName"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                                            :value="user.id">      <%-- 数据的值（id表示）--%>
                                    </el-option>
                                </el-select>
                            </td>
                        </tr>
                        <tr style="height: 60px;">
                            <td style="background-color: #F4F4F4;border-style:none;border-style:none;" align="right">发件人部门&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.sendDept" style="width:250px;" >{{xiugaiduixiang.sendDept}}</el-input>
                            </td>
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">发件人&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.sendPeople" style="width:250px;" >{{xiugaiduixiang.sendPeople}}</el-input>
                            </td>
                        </tr>
                        <tr style="height: 60px;">
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">发件日期&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.sendRiqi" style="width:250px;" >{{xiugaiduixiang.sendRiqi}}</el-input>
                            </td>
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">发件人电话&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.sendPhone" style="width:250px;" >{{xiugaiduixiang.sendPhone}}</el-input>
                            </td>
                        </tr>

                        <tr style="height: 60px;">
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">发件人传真&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.sendChuanzhen" style="width:250px;" >{{xiugaiduixiang.sendChuanzhen}}</el-input>
                            </td>
                            <td style="background-color: #F4F4F4;border-style:none;" align="right">备注&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" align="center">
                                <el-input v-model="xiugaiduixiang.beizhu" style="width:250px;" >{{xiugaiduixiang.beizhu}}</el-input>
                            </td>
                        </tr>
                        <tr style="height: 60px;">
                            <td style="border-style:none;background-color: #F4F4F4;"align="right">图片&nbsp;&nbsp;&nbsp;&nbsp;</td>
                            <td colspan="3" style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <button style="height: 40px;margin-left: 15px;">查看图片</button>
                            </td>
                        </tr>
                    </table>
                    <el-button @click="HuiXianxinZengShiJian1" style="background-color: #009688;height: 50px;color: white;margin-top: 20px;margin-left:80px;" >新增</el-button><br>

                    <table style="width: 950px;height:60px;margin-top: 30px;margin-left:15px;border-style:none;border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" border=1  cellspacing="0">
                        <tr>
                            <td style="padding-right:30px;width:30px;height:80px;background-color:#F4F4F4;padding-left:40px;border-style:none;border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;" rowspan="100">订单信息</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 120px;"align="center">产品编码</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 100px;"align="center">规格型号</td>
                            <td style="width:55px;border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;"align="center">单位</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 80px;" align="center">日期</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 80px;"align="center">总数量</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 70px;"align="center">已确认数量</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;width: 80px;"align="center">待确认数量</td>
                            <td style="width:55px;border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;"align="center">代储代销库存</td>
                            <td style="width:55px;border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;"align="center">ERP库存</td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;"align="center">操作</td>
                        </tr>

                        <tr v-for="(row,index) in danchashuzu">
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <el-select align="center"  @change="GaiBianShiJian2(row.bianma,index)" v-model="row.bianma">
                                    <el-option
                                            v-for="rows in guigeshuzu2"
                                            :label="rows.bianma"
                                            :value="rows.id">
                                    </el-option>
                                </el-select>
                            </td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <el-input v-model="row.productSize" :readonly="true"></el-input>
                            </td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <el-input v-model="row.testunit" :readonly="true"></el-input>
                            </td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <el-date-picker
                                        v-model="row.infoTime"
                                        type="date"
                                        placeholder="选择日期"
                                        style="width:120px;">
                                </el-date-picker>
                            </td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <template>
                                    <el-input-number
                                            v-model="row.infoNumber"
                                            controls-position="right"
                                            @change="handleChange" :min="0" :max="1000000"
                                            style="width:85px;">
                                    </el-input-number>
                                </template>
                            </td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <el-input v-model="row.infoAllrenumber" :readonly="true"></el-input>
                            </td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <template>
                                    <el-input-number
                                            v-model="row.infoWillrenumber"
                                            controls-position="right"
                                            @change="handleChange" :min="0" :max="1000000"
                                            style="width:85px;">
                                    </el-input-number>
                                </template>
                            </td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <el-input v-model="row.kucun" :readonly="true"></el-input>
                            </td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                                <el-input v-model="row.erpkucun" :readonly="true"></el-input>
                            </td>
                            <td style="border-color: #E6E6E6;border-top:1px #E6E6E6 solid;border-left:1px #E6E6E6 solid;">
                               <el-button style="background-color: #009688;color: white;margin-left: 10px;" @click="XiuGaiQueRen(row.id,row.infoAllrenumber,row.infoWillrenumber,row.infoNumber,row.infoTime)" :style="{display: QueRenButton}">确认</el-button>
                               <el-button style="background-color: #009688;color: white;margin-left: 10px;width: 70px;padding-left: 15px;" :style="{display:YiQueRenButton}">已确认</el-button>
                               <el-button @click="XiuGaiShanChu(row.productId)" style="background-color:#FF5722;color: white;margin-right: 15px;">删除</el-button>
                            </td>
                        </tr>

                    </table>

                    <el-button v-on:click="xiugaiShiJian(xiugaiduixiang.id)" style="margin-left: 400px;margin-top: 100px;" >全部确定</el-button>
                    <el-button @click="xiugaibianliang = false">取消</el-button>

                </el-tabs>
            </template>
        </el-dialog>
    </div>


</div>



</body>

<script>
    new Vue({
        el: '#app',
        //页面加载成功时完成
        mounted: function () {
            var _this = this;
            axios
                .post('${pageContext.request.contextPath}/login/DingDanQuanXian',{
                    orderStatus:_this.value,
                    customerId:_this.kehu,
                    deptId:_this.bumen,
                    userId:_this.xiaoshouyuan,
                    orderName:_this.xinxi,
                    orderEmpno:_this.bianhao,
                    orderDate:_this.riqi,
                })    //下拉框回显table所有数据
                .then(function (res) {
                    console.log(res.data);
                    _this.quancha = res.data;
                })
                .catch(function (error) { // 请求失败处理
                    console.log(error);
                });
            axios
                .post('${pageContext.request.contextPath}/login/HuiXianDingDanManager2')    //下拉框回显客户
                .then(function (res) {
                    _this.kehushuzu = res.data;
                    console.log(res.data);
                })
                .catch(function (error) { // 请求失败处理
                    console.log(error);
                });
            axios
                .post('${pageContext.request.contextPath}/login/HuiXianDingDanManager3')    //下拉框回显部门
                .then(function (res) {
                    _this.bumenshuzu = res.data;
                    console.log(res.data+"-------------+++++++++++++++++++");
                })
                .catch(function (error) { // 请求失败处理
                    console.log(error);
                });
            axios
                .post('${pageContext.request.contextPath}/login/HuiXianDingDanManager4')    //下拉框回显销售员
                .then(function (res) {
                    _this.xiaoshouyuanshuzu = res.data;
                    console.log(res.data);
                })
                .catch(function (error) { // 请求失败处理
                    console.log(error);
                });











        },
        methods: {
            //模糊查询
            MoHuselect:function(){
                var vue = this;
                axios
                    .post('${pageContext.request.contextPath}/login/DingDanQuanXian',{
                        orderStatus:vue.zhuangtai,
                        customerId:vue.kehu,
                        deptId:vue.bumen,
                        userId:vue.xiaoshouyuan,
                        orderName:vue.xinxi,
                        orderEmpno:vue.bianhao,
                        orderDate:vue.riqi,
                    },)
                    .then(function (res) {
                        console.log(res.data);
                        vue.quancha = res.data;
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    })
            },


            //订单详情
            ddd:function (id) {
                var _this = this;
                this.bianliangid=true
                axios
                    .post('${pageContext.request.contextPath}/login/selectDingDanCha',{
                        id:id,
                    })  //订单回显信息查询
                    .then(function (res) {
                        _this.dingdanshuzu = res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },


            //订单详情
            eee:function (id) {
                var _this = this;
                this.bianliangid2=true
                axios
                    .post('${pageContext.request.contextPath}/login/DingDanXiangQing',{                 //订单详情信息
                        id:id,
                    })  //订单回显信息查询
                    .then(function (res) {
                        _this.dingdanduixiang = res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });

                axios
                    .post('${pageContext.request.contextPath}/login/selectDingDanCha',{
                        id:id,
                    })  //订单回显信息查询
                    .then(function (res) {
                        _this.dingdanshuzu = res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });



                /*
                    排产信息相关联
                 */
                axios
                    .post('${pageContext.request.contextPath}/login/selectPaiChanHao',{
                        dingdanId:id,
                    })
                    .then(function (res) {
                        _this.genzongDuix = res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });

                axios
                    .post('${pageContext.request.contextPath}/login/selectPiCiHao',{
                        id:id,
                    })
                    .then(function (res) {
                        _this.piciduiX = res.data;
                        console.log("就在眼前"+res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });


                axios
                    .post('${pageContext.request.contextPath}/login/selectProduct',{
                        id:id,
                    })
                    .then(function (res) {
                        _this.proshuzu = res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });


                axios
                    .post('${pageContext.request.contextPath}/login/selectFollowUp',{
                        id:id,
                    })
                    .then(function (res) {
                        _this.genjinshuzu = res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });

            },


            handleSelectionChange(val) {
                this.multipleTable = val;               //  this.multipleTable 选中的值
                /*console.log(val); */          //这里的value就表示一行数据（一个对象）
            },


            //删除操作
            ShanChuAnNiu:function(){
                for (var i=0;i<this.multipleTable.length;i++){
                    var hello = this.multipleTable[i];
                    var id=hello.id;
                    console.log(id);
                }
                axios
                    .post('${pageContext.request.contextPath}/login/deleteDingDan',{
                        id:id,
                    })
                    .then(function (res) {
                        alert("删除成功!!!");
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },
            
            
            //添加操作
            TianJiaAnNiu:function () {
                this.tianjiabianliang=true
            },


            //点击按钮进行添加
            TianJiaTiJiao:function () {
                var _this=this;
                axios                       //订单表添加
                    .post('${pageContext.request.contextPath}/login/TianJiaDingDan',{
                        id:_this.zizeshuzu,
                        orderStatus:_this.valuezhuangtai,   //状态
                        orderEmpno:_this.input1,     //订单销售号
                        userId:_this.xiaoshouyuan1,         //销售员
                        deptId:_this.bumen1,      //收件人部门
                        receivePhone:_this.input2,          //收件人联系电话
                        receiveChuanzhen:_this.input3,      //收件人传真
                        receiveBeizhu:_this.input4,    //收件人被备注
                        customerId:_this.kehu1,     //客户
                        sendDept:_this.input5,      //发件人部门
                        sendPeople:_this.input6,        //发件人
                        sendRiqi:_this.input7,      //发件日期
                        sendPhone:_this.input8,         //发件人电话
                        sendChuanzhen:_this.input9,         //发件人传真
                        beizhu:_this.input10,        //备注
                        tupian:_this.input11     //图片
                    })
                    .then(function (res) {
                        alert("添加成功！！！");
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },


            //新增函数
            xinZengShiJian:function(){
                this.zizeshuzu.push({
                    bianma:null,
                    productSize:null,
                    testunit:null,
                    kucun:null,
                    erpkucun:null,
                })
                var _this=this;
                axios
                    .post('${pageContext.request.contextPath}/login/selectBianMa')
                    .then(function (res) {
                        _this.guigeshuzu= res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },




            //修改回显函数
           HuiXianxinZengShiJian1:function(){
                this.danchashuzu.push({
                    bianma:null,
                    productSize:null,
                    testunit:null,
                    kucun:null,
                    erpkucun:null,
                    infoTime:null,
                    infoNumber:null,
                    infoAllrenumber:null,
                    infoWillrenumber:null,
                })

             },





            //改变事件
            GaiBianShiJian:function(row,index){
                alert(row);
                var _this=this;
                axios
                    .post('${pageContext.request.contextPath}/login/loadProperty',{
                        id:row
                    })
                    .then(function (res) {
                        _this.zizeshuzu.splice(index,1,res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },
            GaiBianShiJian2:function(row,index){
                alert(row);
                var _this=this;
                axios
                    .post('${pageContext.request.contextPath}/login/loadProperty2',{
                        id:row
                    })
                    .then(function (res) {
                        _this.danchashuzu.splice(index,1,res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },

            //计数函数
            handleChange:function(value) {
                console.log(value); 
            },

            //修改的单查函数
            xxx:function (id) {
                console.log(id);

                var _this = this;
                this.xiugaibianliang=true
                axios
                    .post('${pageContext.request.contextPath}/login/DingDanXiangQing',{
                        id: id
                    })
                    .then(function (res) {
                        //把下拉框的默认值进行设置
                        _this.xiugaiduixiang = res.data;
                        _this.valuezhuangtai2 = res.data.orderStatus;

                        if(res.data.orderStatus=='已结束'){
                            alert("已完成的订单无需修改");
                            _this.xiugaibianliang = false;
                        }
                        if(res.data.orderStatus=='已确认'){
                            _this.QueRenButton = 'none';
                            _this.YiQueRenButton = '';
                        }else{
                            _this.QueRenButton = '';
                            _this.YiQueRenButton = 'none';
                        }
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });


                //根据订单信息表的id进行单查用于修改操作
                axios.post('${pageContext.request.contextPath}/login/xiugaiDingDanDanCha',{
                        id:id
                    })
                    .then(function (res) {
                        _this.danchashuzu= res.data;
                        console.log("=========="+res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });


                //编码的查询
                axios
                    .post('${pageContext.request.contextPath}/login/selectBianMa')
                    .then(function (res) {
                        _this.guigeshuzu2= res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });


                },



            //修改函数
            xiugaiShiJian:function (id) {
                var _this = this;
                axios
                    .post('${pageContext.request.contextPath}/login/XiuGaiDingDan',{
                        id:_this.xiugaiduixiang.id,
                        orderStatus:_this.valuezhuangtai2,   //状态
                        orderEmpno:_this.xiugaiduixiang.orderEmpno,     //订单销售号
                        userId:_this.xiaoshouyuan2.xs,         //销售员
                        deptId:_this.xiugaiduixiang.id,      //收件人部门
                        receivePhone:_this.xiugaiduixiang.receivePhone,          //收件人联系电话
                        receiveChuanzhen:_this.xiugaiduixiang.receiveChuanzhen,      //收件人传真
                        receiveBeizhu:_this.xiugaiduixiang.receiveBeizhu,    //收件人被备注
                        customerId:_this.kehu2.kh,     //客户
                        sendDept:_this.xiugaiduixiang.sendDept,      //发件人部门
                        sendPeople:_this.xiugaiduixiang.sendPeople,        //发件人
                        sendRiqi:_this.xiugaiduixiang.sendRiqi,      //发件日期
                        sendPhone:_this.xiugaiduixiang.sendPhone,         //发件人电话
                        sendChuanzhen:_this.xiugaiduixiang.sendChuanzhen,         //发件人传真
                        beizhu:_this.xiugaiduixiang.beizhu,        //备注
                        tupian:_this.input11     //图片
                    })
                    .then(function (res) {
                        alert("订单表修改成功！！！");
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });




                axios
                    .post('${pageContext.request.contextPath}/login/updateDingDanXinXi',{
                    id:_this.danchashuzu
                })
                    .then(function (res) {
                        alert("订单信息表修改成功！！！");
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });

            },

            //点击完成时触发的事件
            open1() {
                var _this = this;
                this.$message('请选择你要完成的订单');
                for (var i=0;i<this.multipleTable.length;i++){
                    var hello = this.multipleTable[i];
                    var id=hello.id;
                    var orderStatus=hello.orderStatus;
                axios.post('${pageContext.request.contextPath}/login/dingdanWanCheng',{
                    id:id,
                    orderStatus:orderStatus,
                })
                    .then(function (res) {
                        alert("修改成功！！！");
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
                }

            },

            //点击确认进行修改
            XiuGaiQueRen:function(id,infoAllrenumber,infoWillrenumber,infoNumber,infoTime){
                var _this = this;
                axios.post('${pageContext.request.contextPath}/login/XiuGaiQueRen',{
                    id:id,
                    infoTime:infoTime,
                    infoNumber:infoNumber,
                    infoAllrenumber:infoAllrenumber,
                    infoWillrenumber:infoWillrenumber,
                })
                    .then(function(res){
                        alert("修改成功");
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },



            //点击删除进行删除
            XiuGaiShanChu:function (id) {
                axios.post('${pageContext.request.contextPath}/login/XiuGaiShanChu',{
                    id:id,
                })
                    .then(function(res){
                        alert("删除成功");
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            }



        },
        data: function () {
            return {
                quancha: [],
                kehushuzu: [],
                zhuangtaishuzu: [
                    {valuezt: '全部', labelzt: '全部'},
                    {valuezt: '待确认', labelzt: '待确认'},
                    {valuezt: '已确认', labelzt: '已确认'},
                    {valuezt: '待生产', labelzt: '待生产'},
                    {valuezt: '已生产', labelzt: '已生产'},
                    {valuezt: '已结束', labelzt: '已结束'}
                ],
                bumenshuzu: [],
                xiaoshouyuanshuzu: [],
                dingdanshuzu:[],
                multipleTable: [],
                guigeshuzu:[],
                guigeshuzu2:[],
                zizeshuzu:[],
                danchashuzu:[],
                handleClick:false,
                kehu: '',
                kehu2:{kh:1},
                zhuangtai: '',
                bumen: '',
                bianma:'',
                xiaoshouyuan:'',
                xiaoshouyuan2:{xs:1},
                xinxi:'',
                bianhao:'',
                riqi:'',
                productType:'',
                guige:'',
                danwei:'',
                daichudaixiao:'',
                ERPkucun:'',
                bianliangid:false,
                bianliangid2:false,
                tianjiabianliang:false,
                xiugaibianliang:false,
                readonly:false,
                activeName:'first',
                activeName1:'first',
                activeName2:'first',
                dingdanduixiang:{},
                xiugaiduixiang:{},
                tianjiaduixiang:{},
                num:1,
                options: [{
                    value: '待确认',
                    label: '待确认'
                }, {
                    value: '已确认',
                    label: '已确认'
                    }, {
                    value: '待生产',
                    lbel: '待生产'
                }, {
                    value: '已生产',
                    label: '已生产'
                }, {
                    value: '已结束',
                    label: '已结束'
                }],


                valuezhuangtai: '',
                valuezhuangtai2: '',
                input1:'',
                input2:'',
                input3:'',
                input4:'',
                input5:'',
                input6:'',
                input7:'',
                input8:'',
                input9:'',
                input10:'',
                xiaoshouyuan1:'',
                bumen1:'',
                kehu1:'',


                QueRenButton:'',
                YiQueRenButton:'',


                //排产信息
                genzongDuix:{},
                piciduiX:[],
                proshuzu:[],
                genjinshuzu:[],
            }
        }
    });


</script>
</html>