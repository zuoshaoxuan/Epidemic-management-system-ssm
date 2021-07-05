<%@ page import="com.xjt.model.Page" %>
<%@ page import="java.util.List" %>
<%@ page import="com.xjt.model.Caip" %>
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
    <h3>当 前 位 置 :数据中心&gt;菜品/日用品管理</h3>
</div>
<%--弹窗--%>
<form id="layer" action="/caip/addCaip" method="post">
    <div class="title">
        <h2>增加菜品/日用品</h2>
    </div>
    <p><label> 菜 品 名 : </label><input type="text" name="cpname"/></p>
    <p><label> 主要成分: </label><input type="text" name="cpdescribe"/></p>
    <p><label> 类 &nbsp;&nbsp;&nbsp;&nbsp;别 : </label>
        <select name="caipy" style="width: 170px;height: 20px;">
            <option value="1">菜品</option>
            <option value="0">日用品</option>
        </select>
    <p><input type="submit" value=" 添 加 " /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button onclick="hideLayer('layer')"> 取 消 </button></p>
</form>
<form id="layer_edit" action="/user/edit" method="post">
    <div class="title">
        <h2>修改菜品/日用品</h2>
    </div>
    <input type="text" name="id" id="id" hidden/>
    <p><label> 菜 品 名: </label><input type="text" name="cpname" id="cpname"/></p>
    <p><label> 主要成分: </label><input type="cpdescribe" name="cpdescribe" id="cpdescribe"/></p>
    <p><label> 类  别: </label>
        <select name="caipy" style="width: 170px;height: 20px;" id="select">
            <option value="1">菜品</option>
            <option value="0">日用品</option>
        </select>
    </p>
    <p><input type="submit" value=" 修 改 "/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button onclick="hideLayer_edit('layer_edit')"> 取 消 </button></p>
</form>
<script>
    function hideLayer(id) {
        let obj = document.getElementById(id);
        $("#layer").removeAttr("action");
        obj.style.display = "none";


    }
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
    function showLayer_edit(id, width, height,uid , cpname,cpdescribe,caipy) {
        let obj = document.getElementById(id);
        let winWidth = document.documentElement.clientWidth;
        let winHeight = document.documentElement.clientHeight;
        let offsetTop = document.documentElement.offsetTop;
        let left = (winWidth - width) / 2;
        let top = (winHeight - height) / 2 + offsetTop;
        $("#id").attr("value", uid);
        $("#cpname").attr("value", cpname);
        $("#cpdescribe").attr("value", cpdescribe);
        for (let i = 0; i < $('#select').children("option").length; i++) {
            if ($('#select').children("option").eq(i).attr("value") == caipy) {
                $('#select').children("option").eq(i).attr("selected", "selected");
            }
            obj.style.top = top + "px";
            obj.style.left = left + "px";
            obj.style.display = "block";

        }
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
    List<Caip> caips = pager.getRows();
    long total = pager.getTotal();
    int pages = Integer.parseInt(request.getParameter("page"));
    int size = Integer.parseInt(request.getParameter("size"));
    String cpname=request.getParameter("cpname");
%>

<div class="div">
    <form action="/caip/FuzzyQueryBycpname" method="post">
        <input type="text" name="page" value="1" hidden>
        <input type="text" name="size" value="7" hidden>
        <input type="search" placeholder="输入关键字" name="username" id="search" required /> <input type="submit" value=" 搜 索 ">
    </form>
    <button onclick="showLayer('layer', 400, 460)" class="btn">添加菜品/日用品</button>
</div>
<table cellpadding="0" cellspacing="0">
    <th>id</th><th>菜品/日用品名</th><th>主要成分</th><th>操作</th>
    <c:forEach items="${requestScope.pager.rows}" var="u">
        <tr id="tr">
            <td>${u.id}</td>
            <td>${u.cpname}</td>
            <td>${u.cpdescribe}</td>
            <td style="width: 400px">
                <a href="javascript:;" onclick="showLayer_edit('layer_edit', 400, 460,'${u.id}','${u.cpname}',
                        '${u.cpdescribe}','${u.caipy}')"> 修改</a>
                <a href="/caip/deletcaip?id=${u.id}"> 删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<br/><br/>
<script>
    function  ss(){
        let inputvalue = $('#search').attr("value");
        sessionStorage.setItem("search",inputvalue);
    }
</script>
<%
    out.println("<div class=\"div1\"><a href=\"/caip/FuzzyQueryBycpname?page=1&size="+ size +"&cpname="+cpname+"\">首页</a>&nbsp;");
    if (pages > 1) {
        out.println("<a href=\"/caip/FuzzyQueryBycpname?page="+ (pages-1) +"&size="+ size +"&cpname="+cpname+"\">上一页</a>&nbsp;");
    }
    out.println("第"+ pages +"/"+ ((total+size-1)/size) +"页&nbsp;&nbsp;&nbsp;");
    out.println("共"+ total +"条数据&nbsp;&nbsp;&nbsp;");
    if (pages < ((total+size-1)/size)) {
        out.println("<a href=\"/caip/FuzzyQueryBycpname?page="+ (pages+1) +"&size="+ size +"&cpname="+cpname+"\">下一页</a>&nbsp;");
    }
    out.println("<a href=\"/caip/FuzzyQueryBycpname?page="+ ((total+size-1)/size) +"&size="+ size +"&cpname="+cpname+"\">尾页</a>&nbsp;</div>");
%>

</body>
</html>


