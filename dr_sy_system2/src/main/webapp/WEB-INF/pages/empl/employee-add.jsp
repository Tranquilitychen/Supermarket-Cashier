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
                <label class="layui-form-label">
                    <span class="x-red">*</span>姓名
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="EName" required=""  lay-verify="nikename"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    <span class="x-red">*</span>显示的昵称
                </div>
            </div>
            <div class="layui-form-item">
                <label for="L_pass" class="layui-form-label">
                    <span class="x-red">*</span>密码
                </label>
                <div class="layui-input-inline">
                    <input type="password" id="L_pass" name="EPassword" required="" lay-verify="pass"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    6到12个字符
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>RFID卡号
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="ERfid" required="" lay-verify="rfid"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    射频卡的卡号
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>身份证
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="EIdCard" required="" lay-verify="idcard"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    员工身份证号码
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>性别
                </label>
                <div class="layui-input-inline">
                    <input type="radio" name="ESex" checked class="layui-btn-radius" value="男"> 男
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="ESex"  class="layui-btn-radius" value="女"> 女
                </div>
            </div>

            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>手机号
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="EPhone" required="" lay-verify="mobile"
                           autocomplete="off" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">
                    员工手机号
                </div>
            </div>
        </div>
        <div class="layui-row layui-col-md6">
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>入职日期
                </label>
                <div class="layui-input-inline">
                    <input class="layui-input" placeholder="入职日期" name="EJointime" id="joinTime" lay-verify="required">
                </div>
            </div>

            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>出生日期
                </label>
                <div class="layui-input-inline">
                    <input class="layui-input" placeholder="出生日期" name="EBirthday" id="birthday" lay-verify="required">
                </div>
            </div>

            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>操作等级
                </label>
                <div class="layui-input-inline">
                    <select name="ELevel" class="valid">
                        <option value="99">管理员</option>
                        <option value="1">员工</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    是管理员还是员工
                </div>
            </div>

            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red">*</span>状态
                </label>
                <div class="layui-input-inline">
                    <select name="EState" class="valid">
                        <option value="1">在职</option>
                        <option value="0">离职</option>
                    </select>
                </div>
                <div class="layui-form-mid layui-word-aux">
                    在职还是离职
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    <span class="x-red"></span>头像
                </label>
                <div class="layui-input-inline">
                    <%--隐藏域 : 存放上传成功的图片地址--%>
                    <input type="hidden" name="EIcon">
                    <button type="button" class="layui-btn" id="header">
                        <i class="layui-icon">&#xe67c;</i>上传头像
                    </button>
                </div>
                <div class="layui-form-mid layui-word-aux" id="thumb">
                    员工头像
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
    // 上传文件
    layui.use('upload', function(){
        var upload = layui.upload;
        //执行实例
        var uploadInst = upload.render({
            elem: '#header' //绑定元素
            ,url: '${pageContext.request.contextPath}/empl/upload/header' //上传接口
            ,done: function(res){
                //上传完毕回调
                // 缩略图显示
                var img = '<img width="50px" src="http://localhost:8090/upload/'+res.data+'">'
                $("#thumb").html(img);
                // 还要给隐藏的文件域赋值
                $("input[name=EIcon]").val(res.data);
                console.log(res);
            }
            ,error: function(){
                //请求异常回调
            },
            accept:"file,images",
            field:"header"
        });
    });


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
                if(value.length < 5 || value.length > 11){
                    return '昵称的长度是5~11位';
                }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,rfid: function (value) {
                if(value.length != 6){
                    return "rfid格式不正确,必须32位!";
                }
            }
            ,idcard : [/^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/, '身份证格式不正确!']
            ,mobile : [/^1[34578]\d{9}$/,"手机号格式不正确!"]
        });

        //监听提交
        form.on('submit(add)', function(data){
            // 传递给后端的数据
            var transData = data.field;
            transData.EBirthday = transData.EBirthday+" 00:00:00";
            transData.EJointime = transData.EJointime+" 00:00:00";

            console.log(transData);
            //发异步，把数据提交给java
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/empl/add/action",
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