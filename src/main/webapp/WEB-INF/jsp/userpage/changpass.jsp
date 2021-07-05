<%@ page import="com.xjt.model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        form{
            text-align: center;
        }
        fieldset{
            margin-left: 15%;
            width: 70%;
            font-size: 20px;
            border: 2px solid #397bc5;
        }
        legend{
            text-align: left;
        }
        input,select{
            width:200px;
            height: 30px;
            margin-top: 15px;
        }
        input[type="submit"]{

        }
        .newinput{
            margin-left: 5px;
        }
    </style>
</head>
<body class="contacts">
<%
    if (session.getAttribute("changpassinfo") != null) {
        String x = (String) session.getAttribute("changpassinfo");
        out.println("<script>alert(\""+x+"\");</script>");
    }
    session.removeAttribute("changpassinfo");
%>
<div class="tree">
    <div>
        <h3>当 前 位 置 :用户管理&gt;修改密码</h3>
    </div>
    <form action="/user/changpass" method="post" id="from">
        <fieldset>
            <legend>基本信息:</legend>
            <div>
                <label for="pass">新密码:</label>
                <input type="text" name="password" id="pass" placeholder="输入新的密码，仅支持英文，数字,6-16位"
                       pattern="[0-9a-zA-Z]{6-16}"><br/>
                <label for="pass">再次输入新码:</label>
                <input type="text" name="pass" id="passn" placeholder="输入刚才输入的新密码"
                       pattern="[0-9a-zA-Z]{6-16}"><br/>
            </div>
        </fieldset>
        <input type="submit" value="提交修改"/>
        <input type="reset" value="重新输入" class="newinput"/>
    </form>
</div>
<script src="../../../js/jquery.min.js">
    function submit() {
        let pass = $("#pass").attr("value");
        let passn = $("#passn").attr("value");
        if (pass !== passn) {
            alert("新密码量词填写的不一样！");
            $("#from").removeAttribute("action");
            $("#from").setAttribute("action", " ");
        }else{
            $("#from").setAttribute("action", "/login/ceshi2");
        }
    }
</script>
</body>
</html>
