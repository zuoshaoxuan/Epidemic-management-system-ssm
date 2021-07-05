<%--
  Created by IntelliJ IDEA.
  User: zuoshaoxuan
  Date: 2021-04-11
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.xjt.model.Page" %>
<%@ page import="com.xjt.model.User" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../../../js/jquery.min.js"></script>
</head>
<style>
    table{
        margin-left: 10%;
        margin-top: 4%;
        border: 2px solid #5cc4ff;
    }
    th{
        width: 200px;
        text-align: center;
        border: 1px solid #5cc4ff;
    }
    td{
        width: 200px;
        height: 40px;
        text-align: center;
        border: 1px solid #5cc4ff;
    }
    #tr:hover{
        color: #7efbff;
        background-color: rgba(0,0,0,0.3);
    }
    a{
        width:160px;
        height: 60px;
        color:white;
        padding:5px;
        text-align: center;
        background-color: #6e809c;
        border: 1px solid black;
        text-decoration: none;
        -moz-border-top-right-radius: 3px;
        -moz-border-bottom-right-radius: 3px;
        -moz-border-top-left-radius: 3px;
        -moz-border-bottom-left-radius: 3px;
        -webkit-border-radius: 3px;
        border-radius: 3px;
    }
    a:hover {
        color: #F8D1F0;
        background-color: #05161f;
        -moz-border-top-right-radius: 10px;
        -moz-border-bottom-right-radius: 10px;
        -moz-border-top-left-radius: 10px;
        -moz-border-bottom-left-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;
    }
    #layer {
        color: #eeeeee;
        display: none;
        position: absolute;
        width: 350px;
        height: 400px;
        padding-top: 40px;
        font-size: 24px;
        text-align: center;
        background-color: rgba(0, 0, 0, 0.7);
        -moz-border-top-right-radius: 10px;
        -moz-border-bottom-right-radius: 10px;
        -moz-border-top-left-radius: 10px;
        -moz-border-bottom-left-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;

    }
    #layer_edit {
        color: #eeeeee;
        display: none;
        position: absolute;
        width: 350px;
        height: 400px;
        padding-top: 40px;
        font-size: 24px;
        text-align: center;
        background-color: rgba(0, 0, 0, 0.7);
        -moz-border-top-right-radius: 10px;
        -moz-border-bottom-right-radius: 10px;
        -moz-border-top-left-radius: 10px;
        -moz-border-bottom-left-radius: 10px;
        -webkit-border-radius: 10px;
        border-radius: 10px;

    }
    #layer input:focus{
        border: #5cc4ff;
    }
    .div{
        margin-left: 10%;
    }
    .div1{
        margin-left: 35%;
    }
    .btn{
        position: absolute;
        left: 363px;
        top: 51px;
    }
</style>
<body>
<div>
    <h3>当 前 位 置 :数据中心&gt;一线人员管理</h3>
</div>
<%--弹窗--%>
<form id="layer_edit" action="/user/edituser" method="post">
    <div class="title">
        <h2>修改角色</h2>
    </div>
    <input type="text" name="id" id="id" hidden/>
    <p><label> 用 户 名: </label><input type="text" name="username" id="username"/></p>
    <p><label> 密&nbsp;&nbsp;&nbsp;&nbsp;码: </label><input type="password" name="password" id="password"/></p>
    <p><label> 性&nbsp;&nbsp;&nbsp;&nbsp;别: </label><input type="text" name="sex" id="sex"/></p>
    <p><label> 生&nbsp;&nbsp;&nbsp;&nbsp;日: </label><input type="date" name="birth" id="birth"/></p>
    <p><input type="submit" value=" 修 改 "/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button onclick="hideLayer_edit('layer_edit')"> 取 消 </button></p>
</form>
<script>
    function hideLayer_edit(id) {
        let obj = document.getElementById(id);
        $("#layer_edit").removeAttr("action");
        obj.style.display = "none";


    }
    function showLayer(id, width, height) {
        let obj = document.getElementById(id);
        let winWidth = document.documentElement.clientWidth;
        let winHeight = document.documentElement.clientHeight;
        let offsetTop = document.documentElement.offsetTop;
        let left = (winWidth - width)/2;
        let top = (winHeight - height)/2 + offsetTop;
        obj.style.top = top + "px";
        obj.style.left = left + "px";
        obj.style.display = "block";
    }
    function showLayer_edit(id, width, height,uid , username,sex,birth) {
        let obj = document.getElementById(id);
        let winWidth = document.documentElement.clientWidth;
        let winHeight = document.documentElement.clientHeight;
        let offsetTop = document.documentElement.offsetTop;
        let left = (winWidth - width) / 2;
        let top = (winHeight - height) / 2 + offsetTop;
        $("#id").attr("value", uid);
        $("#username").attr("value", username);
        $("#sex").attr("value", sex);
        $("#birth").attr("value", birth);
        obj.style.top = top + "px";
        obj.style.left = left + "px";
        obj.style.display = "block";
    }
</script>
<%
    if (request.getAttribute("info") != null) {
        String x = (String) request.getAttribute("info");
        out.println("<script>alert(\""+x+"\");</script>");
    }
%>

<%
    Page pager = (Page)request.getAttribute("pager");
    List<User> users = pager.getRows();
    long total = pager.getTotal();
    int pages = Integer.parseInt(request.getParameter("page"));
    int size = Integer.parseInt(request.getParameter("size"));
    String username = request.getParameter("username");
%>
<div class="div">
    <form action="/user/FQGByname" method="post">
        <input type="text" name="page" value="1" hidden>
        <input type="text" name="size" value="7" hidden>
        <input type="search" placeholder="输入关键字" name="username"/> <input type="submit" value=" 搜 索 ">
    </form>
</div>
<table cellpadding="0" cellspacing="0">
    <th>id</th><th>用户名</th><th>性别</th><th>生日</th><th>操作</th>
    <c:forEach items="${requestScope.pager.rows}" var="u">
        <tr id="tr">
            <td>${u.id}</td>
            <td>${u.username}</td>
            <td>${u.sex}</td>
            <td>${u.birth}</td>
            <td style="width: 400px">
                <a href="javascript:;" onclick="showLayer_edit('layer_edit', 400, 600,'${u.id}','${u.username}',
                        '${u.sex}','${u.birth}')"> 修 改</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br/><br/>
<%
    out.println("<div class=\"div1\"><a href=\"/user/FQGByname?page=1&size="+ size +"&username="+username+"\">首页</a>&nbsp;");
    if (pages > 1) {
        out.println("<a href=\"user/FQGByname?page="+ (pages-1) +"&size="+ size +"&username="+username+"\">上一页</a>&nbsp;");
    }
    out.println("第"+ pages +"/"+ ((total+size-1)/size) +"页&nbsp;&nbsp;&nbsp;");
    out.println("共"+ total +"条数据&nbsp;&nbsp;&nbsp;");
    if (pages < ((total+size-1)/size)) {
        out.println("<a href=\"user/FQGByname?page="+ (pages+1) +"&size="+ size +"&username="+username+"\">下一页</a>&nbsp;");
    }
    out.println("<a href=\"user/FQGByname?page="+ ((total+size-1)/size) +"&size="+ size +"&username="+username+"\">尾页</a>&nbsp;</div>");
%>

</body>
</html>


