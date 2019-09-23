<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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

                <input type="hidden" name="gtPno" value="${childrenPno}" >
                <input type="hidden" name="gtLevel" value="${childrenLevel}">

                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>商品类别名称
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="gtName" required="" lay-verify="required"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>商品类别名称
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>商品类别描述
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="gtDescript" required="" lay-verify="required"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>分类描述
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">
                        <span class="x-red">*</span>商品类别备注
                    </label>
                    <div class="layui-input-inline">
                        <input type="text" name="gtRemark" required=""
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        <span class="x-red">*</span>商品类别备注
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

        layui.use(['form','layer'], function(){
            //$ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;

          //监听提交
          form.on('submit(add)', function(data){
             console.log(data);
            //发异步，把数据提交给java
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/cate/insertChildren",
                data: data.field,
                dataType:"json",
                success:function (data) {

                    console.log(data);

                    layer.alert(data.msg, {icon: 6},function () {
                        if(data.code == 200){
                            // 获得frame索引
                           /* var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close();*/
                        }
                    });

                }
            });

            return false;
          });
        });
    </script>

  </body>

</html>