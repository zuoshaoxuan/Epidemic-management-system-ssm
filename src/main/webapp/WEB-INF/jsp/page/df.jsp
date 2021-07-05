<%--
  Created by IntelliJ IDEA.
  User: zuoshaoxuan
  Date: 2021-05-26
  Time: 19:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="text-align: center">登录失败，返回登录界面</h1>
<%
    response.setHeader("refresh","1;URL=/login");
%>
</body>
</html>
