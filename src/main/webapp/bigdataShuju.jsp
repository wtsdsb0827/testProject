<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/element/index.css">
<script src="${pageContext.request.contextPath}/static/element/index.js"></script>
<script src="${pageContext.request.contextPath}/static/axios/axios.js"></script>
<body>
<div id = "app">

    <div>
        <h3 align="center">分类</h3>
        <div align="center" style="margin-bottom: 50px;">
            <el-button type="primary" @click="FenLei1">按总推荐分类</el-button>
            <el-button type="success" @click = "FenLei2">按总点击分类</el-button>
            <el-button type="info" @click = "FenLei3">按周推荐分类</el-button>
        </div>
    </div>

    <div style="width: 300px;width: 100%;margin-left: 300px;">
        <template>
            <el-table
                    :data="xiaoshuoshuzu"
                    style="width: 100%">
                <el-table-column
                        prop="name"
                        label="小说名"
                        width="180">
                </el-table-column><el-table-column
                        prop="kind"
                        label="小说种类"
                        width="180">
                </el-table-column><el-table-column
                        prop="author"
                        label="小说作者"
                        width="180">
                </el-table-column><el-table-column
                        prop="wordnumber"
                        label="字数"
                        width="180">
                </el-table-column><el-table-column
                        prop="recommend"
                        label="总推荐"
                        width="180">
                </el-table-column><el-table-column
                        prop="totalclick"
                        label="总点击"
                        width="180">
                </el-table-column><el-table-column
                        prop="weeklyRecommendation"
                        label="周推荐"
                        width="180">
                </el-table-column>
            </el-table>
        </template>
    </div>

</div>



<script>
    new Vue({
        el:"#app",
       mounted:function(){
            var _this = this;
            axios.post('${pageContext.request.contextPath}/Thebigdata/selectZongTuiJian')
                .then(function (res) {
                    _this.xiaoshuoshuzu = res.data;
                })
                .catch(function (error) { // 请求失败处理
                    console.log(error);
                });
       },
        methods:{
            FenLei1:function(){
                var _this = this;
                axios.post('${pageContext.request.contextPath}/Thebigdata/FirstClassify')
                    .then(function (res) {
                        _this.xiaoshuoshuzu = res.data;
                    })
                    .catch(function (error) {
                        console.log(error);
                    })
            },
            FenLei2:function(){
                var _this = this;
                axios.post('${pageContext.request.contextPath}/Thebigdata/SecondClassify')
                    .then(function (res) {
                        _this.xiaoshuoshuzu = res.data;
                    })
                    .catch(function (error) {
                        console.log(error);
                    })
            },
            FenLei3:function(){
                var _this = this;
                axios.post('${pageContext.request.contextPath}/Thebigdata/ThirdClassify')
                    .then(function (res) {
                        _this.xiaoshuoshuzu = res.data;
                    })
                    .catch(function (error) {
                        console.log(error);
                    })
            }
        },
        /* 在前端只有数组，没有集合 */
        data:function () {
            return{
                xiaoshuoshuzu:[],
              /*  firstClassify:[],
                SecondClassify:[],
                ThirdClassify:[],*/
            }
        }
    })
</script>

</body>
</html>
