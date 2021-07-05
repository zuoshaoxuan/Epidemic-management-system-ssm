<%--
  Created by IntelliJ IDEA.
  User: zuoshaoxuan
  Date: 2021-04-13
  Time: 23:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.xjt.model.Page" %>
<%@ page import="java.util.List" %>
<%@ page import="com.xjt.model.Abnormal" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../../../js/jquery.min.js"></script>
</head>
<style>
    table{
        margin-top: 4%;
        border: 2px solid #5cc4ff;
    }
    th{
        width: 90px;
        text-align: center;
        border: 1px solid #5cc4ff;
        background-color: rgba(0,0,0,0.1);
    }
    td{
        width: 90px;
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
    <h3>当 前 位 置 :数据中心&gt;异常人员报告审批</h3>
</div>
<%
    if (request.getAttribute("info") != null) {
        String x = (String) request.getAttribute("info");
        out.println("<script>alert(\""+x+"\");</script>");
    }
%>

<%
    Page pager = (Page)request.getAttribute("pager");
    List<Abnormal> abnormals = pager.getRows();
    long total = pager.getTotal();
    int pages = Integer.parseInt(request.getParameter("page"));
    int size = Integer.parseInt(request.getParameter("size"));
%>
<table cellpadding="0" cellspacing="0">
    <tr>
        <th>id</th><th>时间</th><th>用户名</th>
        <th>症状1</th><th>症状2</th><th>症状3</th><th>症状4</th><th>症状5</th><th>症状6</th>
        <th>汇报人</th><th>汇报时间</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${requestScope.pager.rows}" var="u">
        <tr id="tr">
            <td>${u.id}</td>
            <td style="width: 220px;">${u.time}</td>
            <td>${u.username}</td>
            <td>${u.symptom0}</td>
            <td>${u.symptom1}</td>
            <td>${u.symptom2}</td>
            <td>${u.symptom3}</td>
            <td>${u.symptom4}</td>
            <td>${u.symptom5}</td>
            <td>${u.reporter}</td>
            <td style="width: 110px;">${u.reportertime}</td>
            <td style="width: 180px">
                <a href="/ab/abnormalsp?id=${u.id}"> 审批</a>
                <a href="/ab/abnormalno?id=${u.id}"> 驳回</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br/><br/>
<%
    out.println("<div class=\"div1\"><a href=\"/ab/findabByPager?page=1&size="+ size +"\">首页</a>&nbsp;");
    if (pages > 1) {
        out.println("<a href=\"/ab/findabByPager?page="+ (pages-1) +"&size="+ size +"\">上一页</a>&nbsp;");
    }
    out.println("第"+ pages +"/"+ ((total+size-1)/size) +"页&nbsp;&nbsp;&nbsp;");
    out.println("共"+ total +"条数据&nbsp;&nbsp;&nbsp;");
    if (pages < ((total+size-1)/size)) {
        out.println("<a href=\"/ab/findabByPager?page="+ (pages+1) +"&size="+ size +"\">下一页</a>&nbsp;");
    }
    out.println("<a href=\"/ab/findabByPager?page="+ ((total+size-1)/size) +"&size="+ size +"\">尾页</a>&nbsp;</div>");
%>

</body>
</html>

