<%--
  Created by IntelliJ IDEA.
  User: 童书悦
  Date: 2021-04-06
  Time: 1:29
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>修改成功，正在跳转</h1>
<%
    response.setHeader("refresh","0.3;URL=/user/findByPager?page=1&size=7");
%>
</body>
</html>
