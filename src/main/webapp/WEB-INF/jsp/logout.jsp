<%--
  Created by IntelliJ IDEA.
  User: 童书悦
  Date: 2021-04-03
  Time: 23:16
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    session.invalidate();
    response.setHeader("refresh","0;URL=../../index.jsp");
%>
</body>
</html>
