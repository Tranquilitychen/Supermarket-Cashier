<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>国信安-收银系统管理后台</title>
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
<body class="login-bg">
    
    <div class="login layui-anim layui-anim-up">
        <div class="message">国信安收银系统-管理登录</div>
        <div id="darkbannerwrap"></div>
        
        <form method="post" class="layui-form" >
            <input name="eRfid" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" >
            <hr class="hr15">
            <input name="ePassword" lay-verify="required" placeholder="密码"  type="password" class="layui-input">
            <hr class="hr15">
            <input value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit">
            <hr class="hr20" >
        </form>
    </div>

    <script>
        $(function  () {
            layui.use('form', function(){
              var form = layui.form;
              // layer.msg('玩命卖萌中', function(){
              //   //关闭后的操作
              //   });
              //监听提交
              form.on('submit(login)', function(data){
                // alert(888)
                  //data.field是表单的数据
                  //通过ajax将数据提交到java后端
                  $.ajax({
                      type:"post",//提交方法
                      url:"${pageContext.request.contextPath}/login/action",//后端接收数据登录的地址
                      data:data.field,//提交到后端的数据
                      dataType:"json",//后端返回的数据类型
                      success:function (data) {
                          //data：后端返回的json数据

                          console.log(data);
                          layer.msg(data.msg,function(){
                              if (data.code == 200)
                                  location.href='${pageContext.request.contextPath}/home';

                          })

                          }

                  });
                // layer.msg(JSON.stringify(data.field),function(){
                //     location.href='index.html'
                // });
                return false;
              });
            });
        })

        
    </script>

    
    <!-- 底部结束 -->

</body>
</html>