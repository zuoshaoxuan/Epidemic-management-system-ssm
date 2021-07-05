<%--
  Created by IntelliJ IDEA.
  User: zuoshaoxuan
  Date: 2021-04-14
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="com.xjt.model.Page" %>
<%@ page import="java.util.List" %>
<%@ page import="com.xjt.model.Caiporder" %>
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
        margin-top: 5%;
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
    <h3>当 前 位 置 :餐品/日用品中心&gt;我的订单</h3>
</div>
<%
    Page pager = (Page)request.getAttribute("pager");
    List<Caiporder> caiporders = pager.getRows();
    long total = pager.getTotal();
    int pages = Integer.parseInt((String)request.getParameter("page"));
    int size = Integer.parseInt((String)request.getParameter("size"));
%>
<table cellpadding="0" cellspacing="0">
    <th>时间</th><th>购买内容</th><th>是否送达</th>
    <c:forEach items="${requestScope.pager.rows}" var="u">
        <tr id="tr">
            <td>${u.cdate}</td>
            <td>${u.temp}</td>
            <td>${u.sendYN}</td>
        </tr>
    </c:forEach>
</table>
<br/><br/>
<%
    out.println("<div class=\"div1\"><a href=\"/caip/findAllorderByPager?page=1&size="+ size +"\">首页</a>&nbsp;");
    if (pages > 1) {
        out.println("<a href=\"/caip/findAllorderByPager?page="+ (pages-1) +"&size="+ size +"\">上一页</a>&nbsp;");
    }
    out.println("第"+ pages +"/"+ ((total+size-1)/size) +"页&nbsp;&nbsp;&nbsp;");
    out.println("共"+ total +"条数据&nbsp;&nbsp;&nbsp;");
    if (pages < ((total+size-1)/size)) {
        out.println("<a href=\"/caip/findAllorderByPager?page="+ (pages+1) +"&size="+ size +"\">下一页</a>&nbsp;");
    }
    out.println("<a href=\"/caip/findAllorderByPager?page="+ ((total+size-1)/size) +"&size="+ size +"\">尾页</a>&nbsp;</div>");
%>

</body>
</html>


