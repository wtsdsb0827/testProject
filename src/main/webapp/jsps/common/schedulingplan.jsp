<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
    <script src="${pageContext.request.contextPath}/static/element/index.js"></script>
    <script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>

</head>

<body>
    <div id="vue">
        <div style="margin-top: 30px;margin-left: 50px;margin-bottom: 40px;">
            状态:
            <el-select v-model="zhuangtai" placeholder="全部" style="margin-right: 50px;" >
                <el-option
                        v-for="item in zhuangtaishuzu"
                        :label="item.labelzt"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                        :value="item.valuezt">      <%-- 数据的值（id表示）--%>
                </el-option>
            </el-select>

            客户:
            <el-select v-model="kehu" placeholder="全部" style="margin-right: 50px;">
                <el-option
                        v-for="user in kehushuzu"
                        :label="user.customerName"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                        :value="user.id">      <%-- 数据的值（id表示）--%>
                </el-option>
            </el-select>

            销售部门:
            <el-select v-model="bumen" placeholder="全部" style="margin-right: 50px;" >
                <el-option
                        v-for="item1 in bumenshuzu"
                        :label="item1.deptName"  <%--下拉框中显示的数据（数据库查出的字段）--%>
                        :value="item1.id">       <%-- 数据的值（id表示）--%>
                </el-option>
            </el-select>

            销售员:
            <el-select v-model="xiaoshouyuan" placeholder="全部" style="margin-right: 50px;">
                <el-option
                        v-for="item2 in xiaoshouyuanshuzu"
                        :label="item2.allName"      <%--下拉框中显示的数据（数据库查出的字段）--%>
                        :value="item2.id">      <%-- 数据的值（id表示）--%>
                </el-option>
            </el-select>
            <br><br>


            订单编号:
            <el-input v-model="dingdanbianhao" style="width: 200px;" ></el-input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;


            排产计划号:
            <el-input v-model="paichanjihuahao" style="width: 200px;" ></el-input>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <button style="background-color: #009688;margin-left: 30px;height: 50px;width: 100px;" v-on:click="selectMoHuPaiChan">
                <img src="/static/images/9.png">
            </button>
            <br><br>

            <el-row>
                <el-button style="background-color: #009688;height: 50px;color: white"  @click="TianJiaAnNiu">新增</el-button>
                <el-button style="background-color: #FF5722;height: 50px;color: white" v-on:click="ShanChuAnNiu">删除</el-button>
                <el-button style="background-color: #009688;height: 50px;color: white">导入订单</el-button>
                <el-button style="background-color: #009688;height: 50px;color: white">下载模板</el-button>
            </el-row>
        </div>



        <div>
            <template>
                <el-table ref="multipleTable" :data="paichanquancha" tooltip-effect="dark" style="width: 100%" >

                    <el-table-column type="selection" width="100"></el-table-column>

                    <el-table-column prop="id" label="序号" width="160"></el-table-column>

                    <el-table-column prop="orderEmpno" label="订单编号" width="200"></el-table-column>

                    <el-table-column prop="customerName" label="客户"  width="200" show-overflow-tooltip></el-table-column>

                    <el-table-column prop="sendRiqi" label="发件日期"  width="200" show-overflow-tooltip></el-table-column>

                    <el-table-column prop="orderStatus" width="200" label="订单状态" show-overflow-tooltip></el-table-column>

                    <el-table-column prop="planEmpno" width="200" label="排产计划号" show-overflow-tooltip></el-table-column>

                    <el-table-column label="操作" width="250">
                        <template slot-scope="scope">
                            <el-button @click="xiugaiPaiChan(scope.row.id,scope.row.dingdanId,scope.row.planEmpno)" size="mini" style="background-color: #009688;height: 50px;color: white">修改</el-button>
                            <el-button size="mini" style="background-color: #009688;height: 50px;color: white">详情</el-button>
                            <el-button size="mini" style="background-color: #FF5722;height: 50px;color: white">删除排产</el-button>
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


        <%--新增--%>
        <el-dialog title="详细信息" :visible.sync="TianJiaBianL" :data="lianchaDuiXiang" width="70%" height="70%" :before-close="handleClose">
                <template>
                      销售订单号<el-select v-model="xiaoshoudingdanhao" placeholder="请选择">
                        <el-option
                                v-for="item in orderEmpnoshuzu"
                                :label="item.orderEmpno"
                                :value="item.id">
                        </el-option>
                      </el-select>

                    <br> <br>
                    排产计划跟踪号<el-input v-model="paichanhao" style="width:150px" placeholder="请输入内容"></el-input> <br> <br>
                  <el-button style="background-color: #009688;color: white" @click="addProductionBatch">添加生产批次</el-button><br><br>

                <table style="width:100%;height:60px;border:1px solid;border-color: #eeeeee">
                    <tr align="center" v-for="(item,index) in batchshuzu">
                        <td><h2>批次编号</h2></td>
                        <td><input v-model="item.batchEmpno" type="text" style="height: 35px;width: 250px;border-color: #eeeeee;font-size: 20px;"></td>
                        <td><h2>批次名称</h2></td>
                        <td><input v-model="item.batchName" type="text" style="height: 35px;width: 250px;border-color: #eeeeee;font-size: 20px;"></td>
                    </tr>
                </table>


                <span slot="footer" class="dialog-footer" style="margin-right: 450px;">
                    <el-button @click="QueDingAnNiu(lianchaDuiXiang,xiaoshoudingdanhao)" type="primary">确 定</el-button>
                    <el-button @click="TianJiaBianL = false">取 消</el-button>
                </span>
               </template>
        </el-dialog>












        <el-dialog title="修改" :data="selectduixiang" :visible.sync="XiuGaiAnNiu" width="70%" height="70%" :before-close="handleClose">
               <template :data="selectduixiang1">
                   <el-tabs v-model="activeName2" :data="selectduixiang2">
                       <template>
                      销售订单号<el-select v-model="selectduixiang2.orderEmpno" placeholder="请选择">
                                    <el-option
                                            v-for="item in orderEmpnoshuzu"
                                            :label="item.orderEmpno"
                                            :value="item.id">
                                    </el-option>
                                </el-select>
                      </template>
                    <br><br>
                排产计划跟踪号<el-input v-model="selectduixiang1.planEmpno" style="width:150px"></el-input><br><br>


                  <el-button style="background-color: #009688;color: white" @click="addProductionBatch2">添加生产批次</el-button><br><br>


                    <table style="width:100%;height:60px;border:1px solid;border-color: #eeeeee" :data="piciDuiXiang">
                        <tr align="center" v-for="item in batchshuzu2">
                            <td><h2>批次编号</h2></td>
                            <td><input v-model="item.batchEmpno" type="text" style="height: 35px;width: 250px;border-color: #eeeeee;font-size: 20px;"></td>
                            <td><h2>批次名称</h2></td>
                            <td><input v-model="item.batchName" type="text" style="height: 35px;width: 250px;border-color: #eeeeee;font-size: 20px;"></td>
                            <td>
                                <el-button @click="ShanChuPiCi(item.id)" :style="{display:ShanChuButton}" style="background-color: #009688;height: 50px;color: white">删除</el-button>
                                <el-button @click="ProductionPiCi(item.id)" :style="{display:ProductionButton}" style="background-color: #FF5722;height: 50px;color: white">生产信息</el-button>
                            </td>
                        </tr>
                    </table>
               </el-tabs>
                    <span slot="footer" class="dialog-footer" style="margin-right: 450px;">
                        <el-button @click="XiuGaiPiCi(selectduixiang,selectduixiang2.id)" type="primary">确 定</el-button>
                        <el-button @click="XiuGaiAnNiu = false">取 消</el-button>
                    </span>
            </template>
        </el-dialog>



















        <el-dialog title="新增产品"  :visible.sync="XinZengChanPin" width="70%" height="70%" :before-close="handleClose">

            <el-button @click="addProductionInfo" style="background-color: #009688;color: white" >点击添加生产信息</el-button><br><br>

            <table style="width:100%;height:60px;border:1px solid;border-color: #eeeeee" >

                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;产品编码</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;规格型号</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单位</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;数量</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产数量</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</td>
                </tr>

                <tr v-for="item in shengchanxinxishuzu">
                    <td>
                        <el-select v-model="item.bianma" align="center" style="width: 130px;">
                            <el-option
                                    v-for="rows in guigeshuzu"
                                    :label="rows.bianma"
                                    :value="rows.id">
                            </el-option>
                        </el-select>
                    </td>
                    <td>
                        <el-input v-model="item.productSize" style="width: 150px;height: 35px;" readonly="true"></el-input>
                    </td>
                    <td>
                        <el-input v-model="item.testunit"style="width: 150px;height: 35px;"readonly="true"></el-input>
                    </td>
                    <td>
                        <el-input v-model="item.infoNumber"style="width: 150px;height: 35px;"readonly="true"></el-input>
                    </td>
                    <td>
                        <el-input v-model="item.productionNum"style="width: 150px;height: 35px;"></el-input>
                    </td>
                    <td>
                        <el-button @click="shanchuProductionInfo(item.id)" style="background-color: #FF5722;height: 50px;color: white">删除</el-button>
                        <el-button @click="shangpinGenJinXinxi(item.id)" style="background-color: #009688;height: 50px;color: white">商品跟进信息</el-button>
                    </td>
                </tr>
            </table>

            <span slot="footer" class="dialog-footer" style="margin-right: 450px;">
                <el-button @click="chanpinQueDing" type="primary">确 定</el-button>
                <el-button @click="XinZengChanPin = false">取 消</el-button>
            </span>
        </el-dialog>



        <el-dialog title="跟进信息"  :visible.sync="GenJinXinxi" width="70%" height="70%" :before-close="handleClose">

            <el-button @click="addGenJIn" style="background-color: #009688;color: white" >新增跟进信息</el-button><br><br>

            <table style="width:100%;height:60px;border:1px solid;border-color: #eeeeee" >

                <tr>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开始时间</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束时间</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;车间</td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;操作</td>
                </tr>

                <tr v-for="item in genjinshuzu">
                    <td>
                        <template>
                            <div class="block">
                                <el-date-picker
                                        v-model="item.followStarttime"
                                        type="date"
                                        placeholder="选择日期">
                                </el-date-picker>
                            </div>
                        </template>
                    </td>

                    <td>
                        <template>
                            <div class="block">
                                <el-date-picker
                                        v-model="item.followEndtime"
                                        type="date"
                                        placeholder="选择日期">
                                </el-date-picker>
                            </div>
                        </template>
                    </td>

                    <td>
                        <input v-model="item.followWorkshop" style="width: 150px;height: 35px;">
                    </td>

                    <td>
                        <el-button @click="shanchuGenjinInfo(item.id)" style="background-color: #FF5722;height: 50px;color: white">删除</el-button>
                    </td>

                </tr>
            </table>

            <span slot="footer" class="dialog-footer" style="margin-right: 450px;">
                <el-button type="primary">确 定</el-button>
                <el-button @click="GenJinXinxi = false">取 消</el-button>
            </span>
        </el-dialog>





    </div>
</body>



<script>
    new Vue({
        el:'#vue',
        //加载当前页面时就需要加载这些函数
        mounted: function () {
            var _this = this;
            axios
                .post('${pageContext.request.contextPath}/login/quanchaPlan')      //数据的全查
                .then(function (res) {
                    _this.paichanquancha = res.data;
                    console.log(res.data);
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
            axios
                .post('${pageContext.request.contextPath}/login/selectDingdanEmpno')    //在点击新增按钮之前触发事件查找订单编码
                .then(function (res) {
                    _this.orderEmpnoshuzu = res.data;
                    console.log(res.data);
                })
                .catch(function (error) { // 请求失败处理
                    console.log(error);
                });
        },



        methods:{
            /*排产计划的模糊查询*/
            selectMoHuPaiChan:function () {
                var _this = this;
                axios
                    .post('${pageContext.request.contextPath}/login/quanchaPlan',{  //数据的全查
                        orderStatus:_this.zhuangtai,
                        customerId:_this.kehu,
                        deptId:_this.bumen,
                        userId:_this.xiaoshouyuan,
                        orderEmpno:_this.dingdanbianhao,
                        planEmpno:_this.paichanjihuahao
                    })
                    .then(function (res) {
                        _this.paichanquancha = res.data;

                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },

            handleClose(done) {
                this.$confirm('确认关闭？')
                    .then(_ => {
                        done();
                    })
                    .catch(_ => {});
            },

            //添加：点击添加生产批次
            addProductionBatch:function(){
                var t = this;
                this.batchshuzu.push({
                    batchEmpno:null,
                    batchName:null
                })
            },
            //修改：点击添加生产批次
            addProductionBatch2:function(id){
              var _this=this;
                _this.batchshuzu2.push({
                    batchEmpno:null,
                    batchName:null,
                })
            },

            /*排产计划的新增*/
            TianJiaAnNiu:function (){
                var _this = this;
                _this.TianJiaBianL=true
                axios
                    .post('${pageContext.request.contextPath}/login/LianChaXinZengPanDuan')
                    .then(function(res){
                        _this.lianchaDuiXiang=res.data;
                        console.log(res.data);
                    })
                    .catch(function(error){
                        console.log(error);
                    })

            },

            /*排产计划新增的确认按钮*/
            QueDingAnNiu:function(lianchaDuiXiang,xiaoshoudingdanhao) {
                var tt = this;
                for(var i=0;i<lianchaDuiXiang.length;i++){
                    var ii= lianchaDuiXiang[i].dingdanId;
                     if(xiaoshoudingdanhao==ii){
                        alert("改订单号已经注册");
                        break;
                    }
                }
                     if(xiaoshoudingdanhao!=ii){
                        axios
                            .post('${pageContext.request.contextPath}/login/XinZengPaiChan',{
                                id:tt.xiaoshoudingdanhao,
                                planEmpno:tt.paichanhao,
                                batchshuzu:tt.batchshuzu,     //批次数组
                            })
                        .then(function(res){
                            alert("添加成功！！");
                            console.log(res);
                        })
                        .catch(function(error){
                            console.log(error);
                        })
                     }
            },

            /*排产计划修改按钮*/
            xiugaiPaiChan:function(id,dingdanId,planEmpno){
                var tt = this;
                tt.XiuGaiAnNiu=true
                tt.selectduixiang1.planEmpno=planEmpno;
                axios
                    .post('${pageContext.request.contextPath}/login/GenZongHaoHuiXian',{      //回显销售订单号和订单跟踪号
                        id:dingdanId,
                    })
                    .then(function(res){
                        tt.selectduixiang2=res.data;
                        console.log("===="+res.data+"====");
                    })
                    .catch(function(error){
                        console.log(error);
                    })



                axios
                    .post('${pageContext.request.contextPath}/login/PiCiHuiXian',{      //回显批次信息
                        id:id,
                    })
                    .then(function(res){
                        tt.batchshuzu2=res.data;
                        console.log(res.data);
                    })
                    .catch(function(error){
                        console.log(error);
                    })



             axios
                    .post('${pageContext.request.contextPath}/login/QuanHuiXian',{       //查询批次表信息和排产计划信息
                        batchId:id,
                    })
                    .then(function(res){
                        tt.selectduixiang=res.data;
                        console.log("-----------+++-------------"+res.data+"--------+++----------");
                    })
                    .catch(function(error){
                        console.log(error);
                    })

            },
            ShanChuPiCi:function(id){
                axios
                    .post('${pageContext.request.contextPath}/login/shanChuPiCi',{
                        id:id
                    })
                    .then(function(res){
                        alert("删除成功！！！");
                        console.log(res.data);
                    })
                    .catch(function(error){
                        console.log(error);
                    })
            },

           XiuGaiPiCi:function(selectduixiang,id1){     //id:修改的id（s表id）   id1:添加的外键（b表的id）
               for(var i=0;i<selectduixiang.length;i++){
                   var id=selectduixiang[i].id;
               }
              var tt = this;
                axios
                    .post('${pageContext.request.contextPath}/login/QueDingXiuGaiPiCi',{        //添加和修改操作
                        shuzu:tt.batchshuzu2,
                        id:id,
                    })
                    .then(function(res){
                        alert("修改成功！！！");
                        console.log(res);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
               axios
                   .post('${pageContext.request.contextPath}/login/QueDingTianjiaPiCi',{        //添加操作
                       shuzu:tt.batchshuzu2,
                       batchId:id1,
                   })
                   .then(function(res){
                        alert("添加成功！！！");
                       console.log(res);
                   })
                   .catch(function (error) { // 请求失败处理
                       console.log(error);
                   });
            },

            ProductionPiCi:function(id){
                var _this = this
                _this.XinZengChanPin=true

                axios
                    .post('${pageContext.request.contextPath}/login/selectBianMa')      //回显编码
                    .then(function (res) {
                        _this.guigeshuzu= res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });


                axios
                    .post('${pageContext.request.contextPath}/login/selectProductionInfo',{
                        id:id,
                    })
                    .then(function (res) {
                        _this.shengchanxinxishuzu= res.data;
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },

            //点击添加生产信息
            addProductionInfo:function(){
                this.shengchanxinxishuzu.push({
                    bianma:null, productSize:null,   testunit:null,  infoNumber:null,  productionNum:null,
                })
            },

            //点击确定修改生产信息
            chanpinQueDing:function(){

            },

            //删除生产信息
            shanchuProductionInfo:function(id){
                alert(id);
                var _this = this;
                axios
                    .post('${pageContext.request.contextPath}/login/removeProductionInfo',{
                        id:id
                    })
                    .then(function (res) {
                        alert("删除成功！！！");
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },


            //点击商品跟进信息
            shangpinGenJinXinxi:function(id){
                var _this = this;
                this.GenJinXinxi=true
                axios
                    .post('${pageContext.request.contextPath}/login/selectgenjinInfo',{
                        id:id
                    })
                    .then(function (res) {
                        _this.genjinshuzu=res.data,
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });

            },


            //新增跟进信息
            addGenJIn:function(){
                this.genjinshuzu.push({
                    followStarttime:null, followEndtime:null, followWorkshop:null,
                })
            },

            //删除跟进信息
            shanchuGenjinInfo:function(id){
                var _this = this;
                axios
                    .post('${pageContext.request.contextPath}/login/removeGenJinInfo',{
                        id:id
                    })
                    .then(function (res) {
                        alert("删除成功！！！");
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    });
            },



            //删除操作
            ShanChuAnNiu:function () {

            }


        },


        data:function(){
            return {
                zhuangtaishuzu: [
                    {valuezt: '全部', labelzt: '全部'},
                    {valuezt: '待确认', labelzt: '待确认'},
                    {valuezt: '已确认', labelzt: '已确认'},
                    {valuezt: '待生产', labelzt: '待生产'},
                    {valuezt: '已生产', labelzt: '已生产'},
                    {valuezt: '已结束', labelzt: '已结束'}
                ],

                /*  模糊查变量：*/
                zhuangtai:'',
                kehu:'',
                bumen:'',
                xiaoshouyuan:'',
                dingdanbianhao:'',
                paichanjihuahao:'',
                kehushuzu:[],
                bumenshuzu:[],
                xiaoshouyuanshuzu:[],

                paichanquancha:[],
                multipleTable:[],

                /*新增*/
                TianJiaBianL:false,
                orderEmpnoshuzu:[],
                xiaoshoudingdanhao:'',
                paichanhao:'',
                batchshuzu:[],
                batchshuzu2:[],
                selectduixiang:[],
                selectduixiang1:{},
                selectduixiang2:{},
                lianchaDuiXiang:{},

                ShanChuButton:'',
                ProductionButton:'',

                /*修改*/
                XiuGaiAnNiu:false,
                XinZengChanPin:false,
                piciDuiXiang:[],
                shengchanxinxishuzu:[],
                guigeshuzu:[],
                genjinshuzu:[],
                GenJinXinxi:false,
                activeName2:'first',

            }
        }
    })
</script>
</html>
