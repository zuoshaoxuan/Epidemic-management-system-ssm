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
    .btn{
        position: absolute;
        left: 363px;
        top: 51px;
    }
</style>
<body>
<form action="/user/looks">
    用户名：<input type="text" name="uname" id="uname">
    <input type="button" value="搜索"/><br>
</form>
</body>
</html>
