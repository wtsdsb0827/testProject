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

<a href="login/Zz">dsfds</a>
<div id="app">

    姓名：<el-input v-model="input1" placeholder="请输入内容"></el-input>
    语文：<el-input v-model="input2" placeholder="请输入内容"></el-input>
    数学：<el-input v-model="input3" placeholder="请输入内容"></el-input>



    <div align="center" style="margin-top: 100px;">
        <el-button @click="tianjia">添加</el-button>

        <template>
            <el-table :data="zhuangtaishuzu">
                <el-table-column prop="name" label="学生姓名"></el-table-column>
                <el-table-column prop="yuwen" label="语文"></el-table-column>
                <el-table-column prop="shuxue" label="数学"></el-table-column>

                <el-table-column prop="infoName" label="操作" width="350" show-overflow-tooltip>
                    <template slot-scope="scope">
                        <el-button type="text" v-on:click="shanchu(scope.row.id)">
                            删除
                        </el-button>
                    </template>
                </el-table-column>

            </el-table>
        </template>
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
                .post('${pageContext.request.contextPath}/login/selectXinxi')
                    .then(function (res) {
                    console.log(res.data);
                        _this.zhuangtaishuzu = res.data;
                })
                .catch(function (error) { // 请求失败处理
                    console.log(error);
                })
        },
        methods: {
            tianjia:function(){
                var _this = this;
                axios
                    .post('${pageContext.request.contextPath}/login/addXinXi',{
                        name:_this.input1,
                        yuwen:_this.input2,
                        shuxue:_this.input3,
                    })
                    .then(function (res) {
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    })
            },
            shanchu:function(id){
                var _this = this;
                axios
                    .post('${pageContext.request.contextPath}/login/shanchuXinXi',{
                        id:id
                    })
                    .then(function (res) {
                        console.log(res.data);
                    })
                    .catch(function (error) { // 请求失败处理
                        console.log(error);
                    })
            }
        },
        data: function () {
            return {
                zhuangtaishuzu:[],
                input1:'',
                input2:'',
                input3:'',
            }
        }
    });


</script>
</html>