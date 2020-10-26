<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script src="${pageContext.request.contextPath}/static/vue/vue.js"></script>
<body>


<div id="app">


    <div>
        {{message}}
        <h2 v-bind:title="myTitle">{{abc}}</h2>
        <button v-on:click="changeTitle">点击之后改变title的值</button>
        <input type="text" v-model="message">
    </div>


    <div>
        <p>双向绑定：</p>
        <p>
            <input type="text" v-model="user.name">
            <label>{{user.name}}</label>
        </p>

        <p>
            <input type="text" v-model="user.age">
            <label>{{user.age}}</label>
        </p>

        <p>
            <button v-on:click="submitClick">点击提交在控制台查看参数的变化情况：：：</button>
        </p>
    </div>


    <div>
        <p>菜单数据</p>
        <ul>
            <li v-for="item in menus">{{item.name}}</li>
        </ul>
    </div>

    <div>
        <p v-if="seen">如果我是true就能看到我，如果设置我为false就看不到</p>
    </div>


    <div  v-if="type === 'A'">
        <p>现在你看到我了：：：我是A</p>
    </div>
    <div  v-else-if="type === 'B'">
        <p>现在你看到我了：：：我是B</p>
    </div>
    <div v-else-if="type === 'C'">
        <p >现在你看到我了：：：我是C</p>
    </div>
    <div  v-else="type === 'D'">
        <p>现在你看到我了：：：我是D</p>
    </div>

    <div>
        <button v-on:click="reverseMessage">逆转消息</button>
    </div>

</div>

</body>
<script>
    var lianxiVUE = new Vue({
        el: "#app",
        data: {      //打印的属性名加内容
            message: 'Hello Vue!!!',
            abc: '把鼠标放上去展示的效果：',
            myTitle: '这是一个标题属性',
            seen:true,
            type:"B",

            user: {
                name: 'fdsf',
                age: '324'
            },

            menus: [        //必须放在data中
                {name: '订单1', id: 1},
                {name: '订单2', id: 2},
                {name: '订单3', id: 3}
            ]


        },
        methods: {
            changeTitle: function () {
                this.message = '改变了吗？？？？';
            },
            submitClick: function () {
                console.log(this.user);     //使用 console.log方法打印日志信息并在控制台查看信息
            },
            reverseMessage:function () {
                this.message=this.message.split('').reverse().join('')
            }
        },

    })


</script>
</html>
