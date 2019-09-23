<%@ page import="java.util.List" %>
<%@ page import="com.sy.pojo.Employee" %><%--
  Created by IntelliJ IDEA.
  User: Tiantian
  Date: 2019/8/28
Time: 16:34
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
</head>
<body>

<table border="1" align="center">
    <tr>
        <th>ID</th>
        <th>身份证编号</th>
        <th>姓名</th>
        <th>员工卡号</th>
    </tr>

    <c:forEach  items="${employees}" var="empl">
        <tr>
            <th>${empl.EId}</th>
            <th>${empl.EIdCard}</th>
            <th>${empl.EName}</th>
            <th>${empl.ERfid}</th>
        </tr>
    </c:forEach>

</table>
</body>
</html>
