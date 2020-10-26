<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
    <%--<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery/js/jquery-3.2.1.min.js"></script>--%>
    <%--<script src="${pageContext.request.contextPath}/static/vue/qs.js"></script>--%>
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
    </div>

<%--表格的全部数据--%>
    <div>
        <template>
            <el-table ref="multipleTable" :data="quancha" tooltip-effect="dark" style="width: 100%" >

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
                    </template>
                </el-table-column>

            </el-table>
        </template>
    </div>


    <div>
        <el-dialog title="订单信息查看" :visible.sync="bianliangid">
        <template>
            <el-table :data="dingdanshuzu">
                <el-table-column prop="productName" label="产品名称"></el-table-column>
                <el-table-column prop="productSize" label="规格型号"></el-table-column>
                <el-table-column prop="testunit" label="单位"></el-table-column>
                <el-table-column prop="infoTime" label="日期"></el-table-column>
                <el-table-column prop="infoNumber" label="数量"></el-table-column>
                <el-table-column prop="infoRenumber" label="确认数量"></el-table-column>
                <el-table-column prop="kucun" label="代储代销库存"></el-table-column>
                <el-table-column prop="erpkucun" label="ERP库存"></el-table-column>
            </el-table>
        </template>
        </el-dialog>
    </div>

    <div>
        <el-dialog title="订单查看" :visible.sync="bianliangid2" width="70%">
                <template>
                    <el-tabs v-model="activeName">
                        <el-tab-pane label="用户管理" name="first" value="first" :data="dingdanduixiang">
                            <table style="width: 800px;height: 300px;margin-top: 50px;border-style:none;" border="1"  cellspacing="0" align="center">
                                <tr style="height: 60px;">
                                    <td style="background-color:#F4F4F4;width:150px;border-style:none;" align="right">订单状态</td>
                                    <td style="width: 300px;border-color: #E6E6E6;" align="center">{{dingdanduixiang.orderStatus}}</td>
                                    <td style="background-color: #F4F4F4;width: 150px;border-style:none;" align="right">销售订单号</td>
                                    <td style="width: 300px;border-color: #E6E6E6;" align="center">{{dingdanduixiang.orderEmpno}}</td>
                                </tr>
                                <tr style="height: 60px;">
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">销售员</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.allName}}</td>
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人部门</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.deptName}}</td>
                                </tr>
                                <tr style="height: 60px;">
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人联系电话</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.receivePhone}}</td>
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人传真</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.receiveChuanzhen}}</td>
                                </tr>
                                <tr style="height: 60px;">
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">收件人备注</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.receiveBeizhu}}</td>
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">客户</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.customerName}}</td>
                                </tr>
                                <tr style="height: 60px;">
                                    <td style="background-color: #F4F4F4;border-style:none;border-style:none;" align="right">发件人部门</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendDept}}</td>
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">发件人</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendPeople}}</td>
                                </tr>
                                <tr style="height: 60px;">
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">发件日期</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendRiqi}}</td>
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">发件人电话</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendPhone}}</td>
                                </tr>
                                <tr style="height: 60px;">
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">发件人传真</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.sendChuanzhen}}</td>
                                    <td style="background-color: #F4F4F4;border-style:none;" align="right">备注</td>
                                    <td style="border-color: #E6E6E6;" align="center">{{dingdanduixiang.beizhu}}</td>
                                </tr>
                                <tr style="height: 60px;">
                                    <td style="border-style:none;background-color: #F4F4F4;"align="right" >图片</td>
                                    <td colspan="3" style="border-color: #E6E6E6;">
                                        <button style="height: 40px;">查看图片</button>
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
                                        <el-table-column prop="infoRenumber" label="确认数量"></el-table-column>
                                        <el-table-column prop="kucun" label="代储代销库存"></el-table-column>
                                        <el-table-column prop="erpkucun" label="ERP库存"></el-table-column>
                                    </el-table>
                                </template>
                            </div>



                            <button style="margin-left: 500px;" >关闭</button>
                        </el-tab-pane>
                        <el-tab-pane label="配置管理" name="second">配置管理</el-tab-pane>
                        <el-tab-pane label="角色管理" name="third">角色管理</el-tab-pane>
                        <el-tab-pane label="定时任务补偿" name="fourth">定时任务补偿</el-tab-pane>
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
                    orderStatus:_this.zhuangtai,
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
                    console.log(res.data);
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
            //模糊查询：
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
               /* dingdanshuzu2:[],*/
                dialogTableVisible: false,
                handleClick:false,
                kehu: '',
                zhuangtai: '',
                bumen: '',
                xiaoshouyuan:'',
                xinxi:'',
                bianhao:'',
                riqi:'',
                bianliangid:false,
                bianliangid2:false,
                activeName:'first',
                dingdanduixiang:{}
            }
        }
    });


</script>
</html>