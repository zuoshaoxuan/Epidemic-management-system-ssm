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
        margin-left: 20%;
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
    <h3>当 前 位 置 :数据中心&gt;用户列表</h3>
</div>
<%--弹窗--%>
    <form id="layer" action="/user/insert" method="post">
            <div class="title">
                <h2>增加用户</h2>
            </div>
            <p><label> 用户名: </label><input type="text" name="username"/></p>
            <p><label> 密  码: </label><input type="password" name="password"/></p>
            <p><label>生&nbsp;&nbsp;&nbsp;日: </label><input type="date" name="birth" /></p>
            <p><input type="submit" value=" 添 加 " /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button onclick="hideLayer('layer')" type="button"> 取 消 </button></p>
    </form>
    <form id="layer_edit" action="/user/edit" method="post">
            <div class="title">
                <h2>修改用户</h2>
            </div>
            <input type="text" name="id" id="id" hidden/>
            <p><label> 用户名: </label><input type="text" name="username" id="username"/></p>
            <p><label> 密  码: </label><input type="password" name="password" id="password"/></p>
            <p><label>生&nbsp;&nbsp;&nbsp;日: </label><input type="date" name="birth" id="birth" /></p>
            <p><input type="submit" value=" 修 改 "/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <button onclick="hideLayer_edit('layer_edit')" type="button"> 取 消 </button></p>
    </form>
<script>
    function hideLayer(id) {
        let obj = document.getElementById(id);
        obj.style.display = "none";
        $("#layer").removeAttr("action");

    }
    function hideLayer_edit(id) {
        let obj = document.getElementById(id);
        obj.style.display = "none";
        $("#layer_edit").removeAttr("action");

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
    function showLayer_edit(id, width, height,uid , username,password,birth) {
        let obj  = document.getElementById(id);
        let winWidth = document.documentElement.clientWidth;
        let winHeight = document.documentElement.clientHeight;
        let offsetTop = document.documentElement.offsetTop;
        let left = (winWidth - width)/2;
        let top  = (winHeight - height)/2 + offsetTop;
        $("#id").attr("value",uid);
        $("#username").attr("value",username);
       $("#password").attr("value",password);
        $("#birth").attr("value",birth);
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
    int pages = Integer.parseInt((String)request.getParameter("page"));
    int size = Integer.parseInt((String)request.getParameter("size"));
%>

<div class="div">
    <form action="/user/FuzzyQueryByUsername?page=1&size=7" method="post">
    <input type="search" placeholder="输入关键字" name="username"  required/> <input type="submit" value=" 搜 索 ">
    </form>
    <button onclick="showLayer('layer', 400, 600)" class="btn">添加用户</button>
</div>
<table cellpadding="0" cellspacing="0">
    <th>用户名</th><th>房间号</th><th>操作</th>
    <c:forEach items="${requestScope.pager.rows}" var="u">
        <tr id="tr">
            <td>${u.username}</td>
            <td>${u.cadd}</td>
            <td style="width: 400px">
                <a href="javascript:;" onclick="showLayer_edit('layer_edit', 400, 600,'${u.id}','${u.username}',
                    '${u.password}','${u.birth}')"> 修改</a>
                <a href="/user/delet?id=${u.id}" > 删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
    <br/><br/>
<%
    out.println("<div class=\"div1\"><a href=\"/user/findByPager?page=1&size="+ size +"\">首页</a>&nbsp;");
    if (pages > 1) {
        out.println("<a href=\"/user/findByPager?page="+ (pages-1) +"&size="+ size +"\">上一页</a>&nbsp;");
    }
    out.println("第"+ pages +"/"+ ((total+size-1)/size) +"页&nbsp;&nbsp;&nbsp;");
    out.println("共"+ total +"条数据&nbsp;&nbsp;&nbsp;");
    if (pages < ((total+size-1)/size)) {
        out.println("<a href=\"/user/findByPager?page="+ (pages+1) +"&size="+ size +"\">下一页</a>&nbsp;");
    }
    out.println("<a href=\"/user/findByPager?page="+ ((total+size-1)/size) +"&size="+ size +"\">尾页</a>&nbsp;</div>");
%>

</body>
</html>
