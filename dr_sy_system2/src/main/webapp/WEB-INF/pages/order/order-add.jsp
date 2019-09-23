<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <div class="x-body layui-anim layui-anim-up">
        <form class="layui-form">

            <div class="layui-row layui-col-md6">


                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>订单编号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="ONo" required=""  lay-verify="nikename"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red"></span>
                    </div>
                </div>


                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>员工编号
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="EId" required=""  lay-verify="eid"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>输入你的员工编号
                    </div>
                </div>


                <div class="layui-form-item">
                    <label  class="layui-form-label">
                        <span class="x-red">*</span>订单时间
                    </label>
                    <div class="layui-input-inline">
                        <input class="layui-input" placeholder="订单时间" name="OTime" id="joinTime" lay-verify="required">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>订单总价
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="OCost" required=""  lay-verify=""
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">￥</span>
                    </div>
                </div>

                <div class="layui-form-item layui-form-text">
                    <label for="desc" class="layui-form-label">
                        订单备注
                    </label>
                    <div class="layui-input-block">
                        <textarea placeholder="请输入内容" id="desc" name="ODescript" class="layui-textarea"></textarea>
                    </div>
                </div>

                <div class="layui-form-item">
                    <label  class="layui-form-label">
                    </label>
                    <button  class="layui-btn" lay-filter="add" lay-submit="">
                        增加
                    </button>
                </div>

            </div>

      </form>
    </div>

    <script>

        // 日期的渲染
        layui.use('laydate', function(){
            var laydate = layui.laydate;

            //执行一个laydate实例
            laydate.render({
                elem: '#joinTime' //指定元素
            });
            laydate.render({
                elem: '#birthday' //指定元素
            });

        });

        layui.use(['form','layer'], function(){
            //$ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;

          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 10 || value.length > 30){
                return '订单编号须为员工编号加订单时间加6位数字';
              }
            }
            ,eid: [/(.+){6,12}$/, '请输入你的员工编号']
          });

          //监听提交
          form.on('submit(add)', function(data){
              console.log(data.field);
              // 传递给后端的数据
              var transData = data.field;
              transData.OTime = transData.OTime+" 00:00:00";
              console.log(transData);
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/order/add/ordersAction",
                    data:data.field,
                    dataType:"json",
                    success:function (data) {
                        console.log(data);

                        <%--layer.alert(data.msg, {icon: 6},function () {--%>
                        <%--    if(data.code == 200){--%>
                        <%--        // 获得frame索引--%>
                        <%--        var index = parent.layer.getFrameIndex(window.name);--%>
                        <%--        //关闭当前frame--%>
                        <%--        parent.layer.close(index);--%>
                        <%--        location.href="${pageContext.request.contextPath}/order/order";--%>

                        <%--    }--%>
                        <%--});--%>
                    }
                });

            return false;
          });
        });


    </script>

  </body>

</html>