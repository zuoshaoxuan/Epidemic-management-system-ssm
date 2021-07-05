<%--
  Created by IntelliJ IDEA.
  User: 童书悦
  Date: 2021-04-04
  Time: 16:45
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1 style="text-align: center">修改成功，正在跳转</h1>
<%
        response.setHeader("refresh","1;URL=/login/Xinfo");
%>
</body>
</html>
