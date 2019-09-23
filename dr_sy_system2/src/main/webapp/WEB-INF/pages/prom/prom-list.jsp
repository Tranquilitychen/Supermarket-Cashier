<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>收银系统管理后台</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body class="layui-anim layui-anim-up">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>活动列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input class="layui-input" placeholder="开始日" name="start" id="start">
            <input class="layui-input" placeholder="截止日" name="end" id="end">
            <input type="text" name="username"  placeholder="请输入活动名" autocomplete="off" class="layui-input">
            <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加活动','${pageContext.request.contextPath}/prom/add',600,400)"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${pageInfo.total} 条</span>
    </xblock>
    <table class="layui-table layui-form">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>活动记录编号</th>
            <th>活动名</th>
            <th>活动类型编号</th>
            <th>员工编号</th>
            <th>开始时间</th>
            <th>结束时间</th>
            <th>活动状态</th>
            <th>操作</th></tr>
        </thead>
        <tbody>
        <c:forEach items="${pageInfo.list}" var="prom">
        <tr>
            <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${prom.evNo}'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${prom.evNo}</td>
            <td>${prom.evName}</td>
            <td>${prom.etNo}</td>
            <td>${prom.EId}</td>
            <td>${prom.evBegintime}</td>
            <td>${prom.evEndtime}</td>
            <td>${prom.evState == 1 ? "进行中" : prom.evState == 2 ? "已结束": "未开启"}</td>
            <td class="td-manage">

                <button class="layui-btn layui-btn layui-btn-xs"  onclick="x_admin_show('修改','${pageContext.request.contextPath}/prom/edit',600,400)" ><i class="layui-icon">&#xe642;</i>修改</button>
                <button class="layui-btn layui-btn-normal layui-btn-xs"  onclick="x_admin_show('查看','${pageContext.request.contextPath}/prom/detail',600,400)" ><i class="layui-icon">&#xe642;</i>查看</button>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="page">
        <div>
            <c:if test="${pageInfo.hasPreviousPage}">
                <a class="prev" href="${pageContext.request.contextPath}/prom/list?page=${pageInfo.prePage}">&lt;&lt;</a>
            </c:if>
            <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                <c:if test="${pageNum == pageInfo.pageNum}">
                    <span class="current">${pageNum}</span>
                </c:if>
                <c:if test="${pageNum != pageInfo.pageNum}">
                    <a class="num" href="${pageContext.request.contextPath}/prom/list?page=${pageNum}">${pageNum}</a>
                </c:if>
            </c:forEach>
            <c:if test="${pageInfo.hasNextPage}">
                <a class="next" href="${pageContext.request.contextPath}/prom/list?page=${pageInfo.nextPage}">&gt;&gt;</a>
            </c:if>
        </div>
    </div>

</div>
<script>
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    /*用户-停用*/
    function member_stop(obj,id){
        layer.confirm('确认要停用吗？',function(index){

            if($(obj).attr('title')=='启用'){

                //发异步把用户状态进行更改
                $(obj).attr('title','停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!',{icon: 5,time:1000});

            }else{
                $(obj).attr('title','启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!',{icon: 5,time:1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }



    function delAll (argument) {
        var data = tableCheck.getData();
        console.log(data);
        // 将data转换成字符串
        data = data.join(",");
        layer.confirm('确认要删除吗？',function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/prom/delete",
                data: {evDo: data},
                dataType: "json",
                success: function (data) {
                    layer.msg('删除成功', {icon: 1});
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                }
            });
        });
    }
</script>

</body>

</html>