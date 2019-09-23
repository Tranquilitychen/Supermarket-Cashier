<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>欢迎页面-收银系统管理后台</title>
        <meta name="renderer" content="webkit">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
        <link rel="stylesheet" href="/static/css/font.css">
        <link rel="stylesheet" href="/static/css/xadmin.css">
        <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    </head>
    <body>
    <div class="x-body layui-anim layui-anim-up">

        <blockquote class="layui-elem-quote">欢迎登录：
            <span class="x-red">${login.EName}</span>

            当前时间:<div id="time"> </div>
            <script src="static/js/current-time.js"></script>

        </blockquote>
        <fieldset class="layui-elem-field">
            <legend>数据统计</legend>
            <div class="layui-field-box">
                <div class="layui-col-md12">
                    <div class="layui-card">
                        <div class="layui-card-body">
                            <div class="layui-carousel x-admin-carousel x-admin-backlog" lay-anim="" lay-indicator="inside" lay-arrow="none" style="width: 100%; height: 90px;">
                                <div carousel-item="">
                                    <ul class="layui-row layui-col-space10 layui-this">
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>员工数</h3>
                                                <p>
                                                    <cite id="totalEmpl">${totalEmpl}</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>商品数</h3>
                                                <p>
                                                    <cite id="totalGd">${totalGd}</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>活动数</h3>
                                                <p>
                                                    <cite id="totalEt">${totalEt}</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>商品分类数</h3>
                                                <p>
                                                    <cite id="totalGdt">${totalGdt}</cite></p>
                                            </a>
                                        </li>
                                        <li class="layui-col-xs2">
                                            <a href="javascript:;" class="x-admin-backlog-body">
                                                <h3>订单数</h3>
                                                <p>
                                                    <cite id="totalOd">${totalOd}</cite></p>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>系统通知</legend>
            <div class="layui-field-box">
                <table class="layui-table" lay-skin="line">
                    <tbody>
                        <tr>
                            <td >
                                <a class="x-a" href="/" target="_blank">响应党的号召</a>
                            </td>
                        </tr>
                        <tr>
                            <td >
                                <a class="x-a" href="/" target="_blank">不能偷懒</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <fieldset class="layui-elem-field">
            <legend>开发团队</legend>
            <div class="layui-field-box">
                <table class="layui-table">
                    <tbody>
                        <tr>
                            <th>版权所有</th>
                            <td>www.gxaedu.com(国信安教育)</td>
                        </tr>
                        <tr>
                            <th>开发者</th>
                            <td>黄乔国(2402973438@qq.com)</td></tr>
                    </tbody>
                </table>
            </div>
        </fieldset>
        <blockquote class="layui-elem-quote layui-quote-nm">感谢layui,百度Echarts,jquery,本系统由x-admin提供技术支持。</blockquote>
    </div>

    <script>
        /*
        获取员工总数
         */
        $(function () {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/welcome/showData",
                dataType:"json",
                success:function (data) {
                    console.log(data);
                    $("#totalEmpl").html(data.data);
                }
            });
        });
        /*
        获取商品总数
         */
        $(function () {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/welcome/showGd",
                dataType:"json",
                success:function (data) {
                    console.log(data);
                    $("#totalGd").html(data.data);
                }
            });
        });
        /*
        获取商品类别总数
         */
        $(function () {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/welcome/showGdt",
                dataType:"json",
                success:function (data) {
                    console.log(data);
                    $("#totalGdt").html(data.data);
                }
            });
        });
        /*
        获取订单总数
         */
        $(function () {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/welcome/showOd",
                dataType:"json",
                success:function (data) {
                    console.log(data);
                    $("#totalOd").html(data.data);
                }
            });
        });
        /*
       获取活动总数
        */
        $(function () {
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/welcome/showEt",
                dataType:"json",
                success:function (data) {
                    console.log(data);
                    $("#totalEt").html(data.data);
                }
            });
        });
    </script>

    </body>
</html>