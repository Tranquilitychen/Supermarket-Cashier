<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <label  class="layui-form-label">
                    <span class="x-red">*</span>商品类别编号
                </label>
                <div class="layui-input-inline">

                    <select name="gtNo" class="valid">
                        <option value="1">=请选择=</option>
                        <c:forEach items="${goodstypes}" var="cate">
                            <option value="${cate.gtNo}">${cate.gtName}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="layui-form-mid layui-word-aux">
                    选择商品类别的编号
                </div>
            </div>

            <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>商品名称
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="L_pass" name="GName" required="" lay-verify="gname"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    显示商品名
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>商品描述
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="GDescript" required="" lay-verify="gdescript"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    对商品作用进行描述
                </div>
            </div>

            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>条码编号
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="GBarcode" required="" lay-verify="gbarcode"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    商品的条码编号
                </div>

            </div>

            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>计量单位
                </label>
                    <div class="layui-input-inline">
                        <input type="text" name="GUnit" required="" lay-verify="gunit"
                               autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-form-mid layui-word-aux">
                        国际通用计量单位
                    </div>
            </div>


            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>当前售价
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="GPrice" required="" lay-verify="gprice"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    单件商品的价格
                </div>
            </div>


        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red">*</span>商品状态
            </label>
            <div class="layui-input-inline">
                <select name="GState" class="valid">
                    <option value="2">=请选择=</option>
                    <option value="0">有货</option>
                    <option value="1">没货</option>
                </select>
            </div>
            <div class="layui-form-mid layui-word-aux">
                有货还是没货
            </div>
        </div>

        <div class="layui-form-item">
            <label  class="layui-form-label">
                <span class="x-red">*</span>货物数量
            </label>
                <div class="layui-input-inline">
                    <input type="text" name="GCount" required="" lay-verify="gcount"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    剩余货物的数量
                </div>
        </div>

            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>员工编号
                </label>
                <div class="layui-input-inline">

                    <select name="EId" class="eId">
                        <option value="0">=请选择=</option>
                        <option value="1">GL0001</option>
                        <option value="2">GL0002</option>
                        <option value="3">GL0003</option>
                        <option value="4">GL0004</option>
                    </select>
                </div>

                <div class="layui-form-mid layui-word-aux">
                    录入商品的员工的编号
                </div>
            </div>

        <div class="layui-row layui-col-md6">
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>上货日期
                </label>
                <div class="layui-input-inline">
                    <input class="layui-input" placeholder="上货日期" name="exhibitTime" id="exhibitTime" lay-verify="required">
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

        </div>
    </form>
</div>
<script>
    // 日期的渲染
    layui.use('laydate', function(){
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#exhibitTime' //指定元素
        });

    });


    layui.use(['form','layer'], function(){
        $ = layui.jquery;
        var form = layui.form
            ,layer = layui.layer;

        //自定义验证规则
        form.verify({

            gname: function (value) {
                if(value.length == null){
                    return "商品名称不能为空!";
                }
            }
            ,gdescript:function (value) {
                if (value.length == null){
                    return "商品描述不能为空!"
                }
            }
            ,gbarcode:function (value) {
                if (value.length != 13) {
                    return "条形编码必须是13位!"
                }
            }
            ,gunit:function (value) {
                if (value.length == null) {
                    return "计量单位不能为空!"
                }
            }
            ,gprice:function (value) {
                if (value.length == 0||value.length < 0){
                    return "输入价格不正确"
                }
            }

        });
        //监听提交
        form.on('submit(add)', function(data){
            // 传递给后端的数据
            var transData = data.field;

            transData.exhibitTime = transData.exhibitTime+" 00:00:00";

            console.log(transData);
            //发异步，把数据提交给java
            $.ajax({
                type:"post",
                url: "${pageContext.request.contextPath}/goods/add/action",
                data: data.field,
                dataType:"json",
                success:function (data) {
                    console.log(data);
                    layer.alert(data.msg, {icon: 6},function () {
                        if(data.code == 200){
                            // 获得frame索引
                            <c:if test="${param.flag!=1}">
                            var index = parent.layer.getFrameIndex(window.name);
                            //关闭当前frame
                            parent.layer.close(index);
                            </c:if>
                            <c:if test="${param.flag==1}">
                            location.href="${pageContext.request.contextPath}/empl/list";

                            </c:if>

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