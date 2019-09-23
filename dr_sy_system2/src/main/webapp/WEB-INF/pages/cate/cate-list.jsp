<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
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
      <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>
        <button class="layui-btn" onclick="x_admin_show('添加商品分类','${pageContext.request.contextPath}/cate/insertPage',500,350)"><i class="layui-icon"></i>添加一级分类</button>
       <%-- <span class="x-right" style="line-height:40px">共有数据： 条</span>--%>
      </xblock>
      <table class="layui-table layui-form">
        <thead>
          <tr>
            <th width="20">
              <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i class="layui-icon">&#xe605;</i></div>
            </th>
            <th width="70">ID</th>
            <th>栏目名</th>
            <th>描述</th>
            <th width="50">状态</th>
            <th width="220">操作</th>
        </thead>

        <tbody class="x-cate">
          <c:forEach items="${cates}" var = "cate">
			<!-- 判断是否是1级菜单 -->
            <c:choose>
              <c:when test="${cate.gtLevel == 1}"><c:set var="fid" value="0"></c:set></c:when>
              <c:otherwise><c:set var="fid" value="${cate.gtPno}"></c:set></c:otherwise>
            </c:choose>

            <tr cate-id='${cate.gtNo}' fid='<c:out value="${fid}"></c:out>'>
              <td>
                <div class="layui-unselect layui-form-checkbox" lay-skin="primary" data-id='${cate.gtNo}'><i class="layui-icon">&#xe605;</i></div>
              </td>

              <td>${cate.gtNo}</td>

              <td>
                 <c:if test="${cate.gtLevel != 1}">
                	<c:forEach begin="2" end="${cate.gtLevel }">
               			<c:out value="&nbsp;&nbsp;&nbsp;" escapeXml="false" ></c:out>
               		</c:forEach>
                </c:if> 

				<c:if test="${cate.gtIsparent == 1}">
					<i class="layui-icon x-show" status='true'>&#xe623;</i>
				</c:if>
                  ${cate.gtName}
              </td>

              <td>${cate.gtDescript }</td>

              <td>
                <input type="checkbox" gtNo="${cate.gtNo}" lay-filter="state" name="switch"
                       lay-text="正常|锁定" ${cate.gtState == 1 ? "checked" : ""} lay-skin="switch">
              </td>

              <td class="td-manage">
                <button class="layui-btn layui-btn layui-btn-xs"  onclick="x_admin_show('编辑','${pageContext.request.contextPath}/cate/updatePage?gtNo=${cate.gtNo}')" ><i class="layui-icon">&#xe642;</i>编辑</button>
                <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="x_admin_show('编辑' ,'${pageContext.request.contextPath}/cate/insertChildrenPage?gtPno=${cate.gtNo}&gtLevel=${cate.gtLevel}')" ><i class="layui-icon">&#xe642;</i>添加子栏目</button>
                <button class="layui-btn-danger layui-btn layui-btn-xs"  onclick="member_del(this,'${cate.gtNo}')" href="javascript:;" ><i class="layui-icon">&#xe640;</i>删除</button>
              </td>
            </tr>
          </c:forEach>
          
        </tbody>
      </table>
      <%-- 
        <div class="page">
        <div>
          <c:if test="${pageInfo.hasPreviousPage}">
            <a class="prev" href="${pageContext.request.contextPath}/cate/list?page=${pageInfo.prePage}">&lt;&lt;</a>
          </c:if>
          <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
            <c:if test="${pageNum == pageInfo.pageNum}">
              <span class="current">${pageNum}</span>
            </c:if>
            <c:if test="${pageNum != pageInfo.pageNum}">
              <a class="num" href="${pageContext.request.contextPath}/cate/list?page=${pageNum}">${pageNum}</a>
            </c:if>
          </c:forEach>
          <c:if test="${pageInfo.hasNextPage}">
            <a class="next" href="${pageContext.request.contextPath}/cate/list?page=${pageInfo.nextPage}">&gt;&gt;</a>
          </c:if>
        </div> --%>
        
    </div>
    <style type="text/css">
      
    </style>
    <script>

        // 主要是监听复选框


        layui.use('form', function(){
            var form = layui.form;
            form.on("switch(state)",function (data) {
                // 获取状态值
                var state = data.elem.checked ? 1 : 0;
                // 获取员工编号
                var checkbox = data.elem;
                var gtNo = $(checkbox).attr("gtNo");

                console.log("gtNo:" + gtNo);
                console.log("status:" + state);
                // 通过ajax 去访问后台更新状态
                $.ajax({
                    type:"post",
                    url:"${pageContext.request.contextPath}/cate/update/state",
                    data:{gtNo:gtNo, status:state},
                    dataType:"json",
                    success:function (data) {
                        console.log(data)
                        /*var prev = $(checkbox).parent().prev().prev()
                        prev.text(state == 1 ? "显示" : "不显示");*/
                        if(data.code == 200){
                            layer.msg('修改成功', {icon: 1});
                        }

                    }
                });
            });
        });
      /*用户-删除*/
      function member_del(obj,id){
          layer.confirm('确认要删除吗？' + id,function(index){
              //发异步删除数据
                id = id + ",";
              $.ajax({
                  type:"post",
                  url:"${pageContext.request.contextPath}/cate/delAll",
                  data:{gtNos:id},
                  dataType:"json",
                  success:function (data) {
                      layer.msg('删除成功', {icon: 1});
                      $(".layui-form-checked").not('.header').parents('tr').remove();
                  }
              });

              $(obj).parents("tr").remove();
              layer.msg('已删除!',{icon:1,time:1000});
          });
      }
      
      function delAll (argument) {
        var data = tableCheck.getData();
        data = data.join(",");
        layer.confirm('确认要删除吗？'+data,function(index){
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                type:"post",
                url:"${pageContext.request.contextPath}/cate/delAll",
                data:{gtNos:data},
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