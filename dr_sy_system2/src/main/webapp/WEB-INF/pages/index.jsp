<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>收银系统管理后台</title>
	<meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />

    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
	<link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>

</head>
<body>
    <!-- 顶部开始 -->
    <div class="container">
        <div class="logo"><a href="./index.html">收银系统管理后台</a></div>
        <div class="left_open">
            <i title="展开左侧栏" class="iconfont">&#xe699;</i>
        </div>
        <ul class="layui-nav left fast-add" lay-filter="">
          <li class="layui-nav-item">
          </li>
        </ul>
        <ul class="layui-nav right" lay-filter="">
          <li class="layui-nav-item">
            <a href="javascript:;">${login.EName}</a>
            <dl class="layui-nav-child"> <!-- 二级菜单 -->
              <dd><a onclick="x_admin_show('个人信息','http://www.baidu.com')">个人信息</a></dd>
              <dd><a onclick="x_admin_show('切换帐号','http://www.baidu.com')">切换帐号</a></dd>
              <dd><a href="javascript:logout();">退出</a></dd>
            </dl>
          </li>
        </ul>
        
    </div>
    <!-- 顶部结束 -->
    <!-- 中部开始 -->
     <!-- 左侧菜单开始 -->
    <div class="left-nav">
      <div id="side-nav">
        <ul id="nav">
           <c:if test="${login.ELevel == 99}">
               <li>
                   <a href="javascript:;">
                       <i class="iconfont">&#xe6b8;</i>
                       <cite>员工管理</cite>
                       <i class="iconfont nav_right">&#xe697;</i>
                   </a>
                   <ul class="sub-menu">
                       <li>
                           <a _href="${pageContext.request.contextPath}/empl/list">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>员工列表</cite>

                           </a>
                       </li >
                       <li>
                           <a _href="${pageContext.request.contextPath}/empl/add?flag=1">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>添加员工</cite>

                           </a>
                       </li>
                   </ul>
               </li>
               <li>
                   <a href="javascript:;">
                       <i class="iconfont">&#xe723;</i>
                       <cite>商品管理</cite>
                       <i class="iconfont nav_right">&#xe697;</i>
                   </a>
                   <ul class="sub-menu">
                       <li>
                           <a _href="${pageContext.request.contextPath}/goods/list">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>商品列表</cite>
                           </a>
                       </li >
                   </ul>
                   <ul class="sub-menu">
                       <li>
                           <a _href="${pageContext.request.contextPath}/goods/add?flag=1">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>添加商品</cite>
                           </a>
                       </li >
                   </ul>
               </li>
               <li>
                   <a href="javascript:;">
                       <i class="iconfont">&#xe723;</i>
                       <cite>商品分类管理</cite>
                       <i class="iconfont nav_right">&#xe697;</i>
                   </a>
                   <ul class="sub-menu">
                       <li>
                           <a _href="${pageContext.request.contextPath}/cate/list">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>分类列表</cite>
                           </a>
                       </li >
                       <li>
                           <a _href="${pageContext.request.contextPath}/cate/insertPage">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>添加分类</cite>
                           </a>
                       </li >
                   </ul>
               </li>
               <li>
                   <a href="javascript:;">
                       <i class="iconfont">&#xe723;</i>
                       <cite>促销活动</cite>
                       <i class="iconfont nav_right">&#xe697;</i>
                   </a>
                   <ul class="sub-menu">
                       <li>
                           <a _href="${pageContext.request.contextPath}/type/list">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>活动类型</cite>
                           </a>
                       </li >
                       <li>
                           <a _href="${pageContext.request.contextPath}/prom/list">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>活动列表</cite>
                           </a>
                       </li >
                       <li>
                           <a _href="${pageContext.request.contextPath}/type/list">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>生成条形码</cite>
                           </a>
                       </li >
                       <li>
                           <a _href="${pageContext.request.contextPath}/type/list">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>打印活动条形码</cite>
                           </a>
                       </li >
                   </ul>
               </li>

               <li>
                   <a href="javascript:;">
                       <i class="iconfont">&#xe6ce;</i>
                       <cite>系统统计</cite>
                       <i class="iconfont nav_right">&#xe697;</i>
                   </a>
                   <ul class="sub-menu">
                       <li>
                           <a _href="${pageContext.request.contextPath}/syt/area">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>拆线图</cite>
                           </a>
                       </li >
                       <li>
                           <a _href="${pageContext.request.contextPath}/syt/bar">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>柱状图</cite>
                           </a>
                       </li>
                       <li>
                           <a _href="${pageContext.request.contextPath}/syt/pie">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>饼图</cite>
                           </a>
                       </li>

                       <li>
                           <a _href="${pageContext.request.contextPath}/syt/gauge">
                               <i class="iconfont">&#xe6a7;</i>
                               <cite>仪表图</cite>
                           </a>
                       </li>
                   </ul>
               </li>
           </c:if>


            <c:if test="${login.ELevel == 1 || login.ELevel == 99}">

                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#xe723;</i>
                        <cite>订单管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/order/order">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>订单列表</cite>
                            </a>
                        </li >
                    </ul>
                </li>
                <li>
                    <a _href="cate.html">
                        <i class="iconfont">&#xe723;</i>
                        <cite>上货操作</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="${pageContext.request.contextPath}/pm/list">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>上货记录</cite>
                            </a>
                        </li>

                    </ul>

                </li>
            </c:if>

        </ul>
      </div>
    </div>
    <!-- <div class="x-slide_left"></div> -->
    <!-- 左侧菜单结束 -->
    <!-- 右侧主体开始 -->
    <div class="page-content">
        <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
          <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>我的桌面</li>
          </ul>
          <div class="layui-tab-content">
            <div class="layui-tab-item layui-show">
                <iframe src="${pageContext.request.contextPath}/welcome" frameborder="0" scrolling="yes" class="x-iframe"></iframe>
            </div>
          </div>
        </div>
    </div>
    <div class="page-content-bg"></div>
    <!-- 右侧主体结束 -->
    <!-- 中部结束 -->
    <!-- 底部开始 -->
    <div class="footer">
        <div class="copyright">Copyright ©2017 x-admin 2.3 All Rights Reserved  更多模板：<a href="http://www.mycodes.net/" target="_blank">源码之家</a></div>  
    </div>
    <!-- 底部结束 -->

</body>
<script>
    /**
     * 退出登录*/
    function logout() {
        layer.confirm('确定退出吗？',function(index){
            //访问退出登陆的方法
            location.href="${pageContext.request.contextPath}/logout"
        });
    }
</script>
</html>