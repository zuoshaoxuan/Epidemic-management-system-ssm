<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>finduser</title>
</head>
<body>
<c:forEach items="${requestScope.user}" var="u">
    id:${u.id}<br/>
    email: ${u.email}<br/>
    username:${u.username}<br/>
</c:forEach>
</body>
</html>
