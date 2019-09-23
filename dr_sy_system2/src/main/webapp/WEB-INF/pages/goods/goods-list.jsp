<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="UTF-8">
    <title>欢迎页面-X-admin2.0</title>
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
  
  <body>
    <div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">演示</a>
        <a>
          <cite>导航元素</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
    </div>
    <div class="x-body">
      <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
          <input class="layui-input" placeholder="上货时间" name="start" id="start">
          <div class="layui-input-inline">
            <select name="contrller">
              <option>商品状态</option>
              <option>有货</option>
              <option>没货</option>
            </select>
          </div>
          <div class="layui-input-inline">
            <select name="contrller">
              <option>商品名称</option>
              <option>可口可乐</option>
              <option>百事可乐</option>
              <option>货精通CSS</option>
              <option>A5笔记本蓝色</option>
              <option>A5笔记本红色</option>
            </select>
          </div>
          <div class="layui-input-inline">
            <select name="contrller">
              <option value="">收银员编号</option>
              <option value="0">SY0001</option>
              <option value="1">SY0002</option>
              <option value="2">SY0003</option>
              <option value="3">SY0004</option>

            </select>
          </div>
          <input type="text" name="username"  placeholder="请输入商品编号" autocomplete="off" class="layui-input">
          <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
      </div>
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加商品','${pageContext.request.contextPath}/goods/add')"><i class="layui-icon"></i>添加</button>
        <span class="x-right" style="line-height:40px">共有数据：${total}条</span>
      </xblock>
      <table class="layui-table">
        <thead>
          <tr>
            <th>
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th>商品编号</th>
            <th>商品类别编号</th>
            <th>商品名称</th>
            <th>商品描述</th>
            <th>条码编号</th>
            <th>计量单位</th>
            <th>当前售价</th>
            <th>状态</th>
            <th>货物数量</th>
            <th>收银员编号</th>
            <th>上货盘点时间</th>
            <th >操作</th>
            </tr>
        </thead>
        <tbody>

        <c:forEach items="${goods}" var="goods">
          <tr>
            <td>
              <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${goods.GNo}'><i class="layui-icon">&#xe605;</i></div>
            </td>
            <td>${goods.GNo}</td>
            <td>${goods.gtNo}</td>
            <td>${goods.GName}</td>
            <td>${goods.GDescript}</td>
            <td>${goods.GBarcode}</td>
            <td>${goods.GUnit}</td>
            <td>${goods.GPrice}</td>
            <td>${goods.GState}</td>
            <td>${goods.GCount}</td>
            <td>${goods.EId}</td>
            <td>${goods.exhibitTime}</td>
            <td class="td-manage">
              <a title="查看"  onclick="x_admin_show('编辑','order-view.html')" href="javascript:;">
                <i class="layui-icon">&#xe63c;</i>
              </a>
              <a title="删除" onclick="member_del(this,'要删除的id')" href="javascript:;">
                <i class="layui-icon">&#xe640;</i>
              </a>
            </td>
          </tr>
        </c:forEach>

        </tbody>
      </table>
      <div class="page">
        <%--<a class="num" href="">1</a>
        <span class="current">2</span>
        <a class="num" href="">3</a>
        <a class="num" href="">489</a>--%>
        <div>
          <a class="prev" href="${pageContext.request.contextPath}/goods/list?page=${pageInfo.prePage}">&lt;&lt;</a>
          <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
            <c:if test="${pageNum == pageInfo.pageNum}">
              <span class="current">${pageNum}</span>
            </c:if>
            <c:if test="${pageNum != pageInfo.pageNum}">
              <a class="num" href="${pageContext.request.contextPath}/goods/list?page=${pageNum}">${pageNum}</a>
            </c:if>
          </c:forEach>
          <a class="next" href="${pageContext.request.contextPath}/goods/list?page=${pageInfo.nextPage}">&gt;&gt;</a>
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



      //多条删除
      function delAll (argument) {

        var data = tableCheck.getData();

        //将data转换成字符串
        data = data.join(",");
        console.log(data);
  
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            //发送ajax到后端
            $.ajax({
              type:"post",
              url:"${pageContext.request.contextPath}/goods/delete",
              data:{gNos:data},
              dataType:"json",
              success:function (data) {
                layer.msg('删除成功', {icon: 1});
                $(".layui-form-checked").not('.header').parents('tr').remove();
              }
            });
        });
      }
    </script>

  </body>

</html>