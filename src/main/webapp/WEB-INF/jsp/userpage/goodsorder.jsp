<%@ page import="com.xjt.model.Page" %>
<%@ page import="com.xjt.model.Caip" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String basePath="../.."; %>
<html>
<head>
    <title>菜品选择</title>
    <link rel="stylesheet" href="<%=basePath%>/css/table.css">
    <script src="<%=basePath%>/js/jquery.min.js"></script>
    <style>
        .td1{
            width: 350px;
        }

        .div{
            margin-left: 10%;
        }
        .div1{
            margin-left: 35%;
            margin-top: 20px;
        }
        .btn{
            position: absolute;
            left: 363px;
            top: 51px;
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

    </style>
</head>
<body>

<div>
    <h3>当 前 位 置 :餐品/日用品中心&gt;日用品订购</h3>
<%
    if (request.getAttribute("info") != null) {
        String x = (String) request.getAttribute("info");
        out.println("<script>alert(\""+x+"\");</script>");
    }
%>
<%
    Page pager = (Page)request.getAttribute("pager");
    List<Caip> caips= pager.getRows();
    long total = pager.getTotal();
    int pages = Integer.parseInt((String)request.getParameter("page"));
    int size = Integer.parseInt((String)request.getParameter("size"));
%>
    <form id="layer_edit" action="/caip/orderGoods" method="post">
        <div class="title">
            <h2>确 认 订 单</h2>
        </div>
        <input type="text" name="id" id="id" hidden/>
        <p><label> 用 户 名: </label><input type="text" name="username" value="${sessionScope.x}"/></p>
        <p><label> 选 购 表: </label><input type="text" name="temp" id="caip"/></p>
        <p><input type="submit" value=" 确 定 "/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button onclick="hideLayer_edit('layer_edit')"> 取 消 </button></p>
    </form>
    <script language="javascript">
        function hideLayer_edit(id) {
            let obj = document.getElementById(id);
            obj.style.display = "none";
            $("#layer_edit").removeAttr("action");

        }
        sessionStorage.removeItem('caip');
        function anyCheck(caip) {
            let caipStr = sessionStorage.getItem('caip');
            if (caipStr == null) {
                caipStr = caip + ",";
                sessionStorage.setItem('caip', caipStr);
                let caipS = sessionStorage.getItem('caip');
                alert("您选择了" + caipS);
            } else {
                caipStr = caipStr + caip + ",";
                sessionStorage.setItem('caip', caipStr);
                let caipS = sessionStorage.getItem('caip');
                alert("您选择了" + caipS);
            }
        }
        function showLayer_edit(id, width, height,username) {
            let obj = document.getElementById(id);
            let winWidth = document.documentElement.clientWidth;
            let winHeight = document.documentElement.clientHeight;
            let offsetTop = document.documentElement.offsetTop;
            let left = (winWidth - width) / 2;
            let top = (winHeight - height) / 2 + offsetTop;
            $("#username").attr("value", username);
            let caipS = sessionStorage.getItem('caip');
            $("#caip").attr("value", caipS);
            obj.style.top = top + "px";
            obj.style.left = left + "px";
            obj.style.display = "block";
        }
    </script>
    <table border="1px" cellpadding="0" cellspacing="0">
        <tr><th>日用品名称</th><th>主要成分</th><th>选择</th></tr>
        <c:forEach items="${requestScope.pager.rows}" var="v">
            <tr id="tr">
                <td>${v.cpname}</td>
                <td class="td1">${v.cpdescribe}</td>
                <td>
                    <a href="javascript:;" onclick="anyCheck('${v.cpname}')">添加到购物车</a>
                </td>
            </tr>
        </c:forEach>
    </table>
        <%
        out.println("<div class=\"div1\"><a href=\"javascript:;\" onclick=\"showLayer_edit('layer_edit', 400, 460)\"> 提 交</a>");
        out.println("<a href=\"/caip/findAllGoodsByPager?page=1&size="+ size +"\">首页</a>&nbsp;");
        if (pages > 1) {
            out.println("<a href=\"/caip/findAllGoodsByPager?page="+ (pages-1) +"&size="+ size +"\">上一页</a>&nbsp;");
        }
        out.println("第"+ pages +"/"+ ((total+size-1)/size) +"页&nbsp;&nbsp;&nbsp;");
        out.println("共"+ total +"条数据&nbsp;&nbsp;&nbsp;");
        if (pages < ((total+size-1)/size)) {
            out.println("<a href=\"/caip/findAllGoodsByPager?page="+ (pages+1) +"&size="+ size +"\">下一页</a>&nbsp;");
        }
        out.println("<a href=\"/caip/findAllGoodsByPager?page="+ ((total+size-1)/size) +"&size="+ size +"\">尾页</a>&nbsp;</div>");
    %>
    <br>
</body>
</html>