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
/*        .contacts {
            width: 100%;
            overflow: hidden;
        }
        .tree{
            width: 110%;
            overflow-y: scroll;
        }*/
        /*css主要部分的样式*/
        /*!*定义滚动条宽高及背景，宽高分别对应横竖滚动条的尺寸*!*/
        ::-webkit-scrollbar {
            width: 6px; /*对垂直流动条有效*/
        }
        /*定义滚动条的轨道颜色、内阴影及圆角*/
        ::-webkit-scrollbar-track{
            /*-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,.3);*/
            background-color: #FFFFFF;
            border-radius: 3px;
        }
        /*定义滑块颜色、内阴影及圆角*/
        ::-webkit-scrollbar-thumb{
            border-radius: 7px;
            -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.2);
            background-color: rgba(0,0,0,0.3);
        }
        /*定义两端按钮的样式*/
        /*::-webkit-scrollbar-button {
            background-color:cyan;
        }*/
        /*定义右下角汇合处的样式*/
        ::-webkit-scrollbar-corner {
            background:khaki;
        }
    </style>
</head>
<body class="contacts">
<div class="tree">
    <div>
        <h3>当 前 位 置 :用户管理&gt;修改个人信息</h3>
    </div>
    <form action="/user/xiugai" method="post">
        <fieldset>
            <legend>基本信息:</legend>
            <div>
                <label for="name">用户名称:</label>
                    <input type="text" name="username" id="name" value="${users.username}"><br/>
                <label for="sex">性 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</label>
                <input type="text" id="sex" name="sex" value="${users.sex}"> <br/>
                <label for="birth">出生日期:</label>
                    <input type="date" name="birth" id="birth" value="${users.birth}"><br/>
                <label for="realname">真实姓名:</label>
                    <input type="text" name="realname" id="realname" value="${users.realname}"><br/>
                <label for="idnum">身份证号:</label>
                    <input type="text" name="idnum" id="idnum" pattern="[0-9]{18}" value="${users.idnum}"><br/>
            </div>
        </fieldset>
        <fieldset>
            <legend>通讯信息:</legend>
            <div>
                <label for="phonenum">手 &nbsp;&nbsp;机 &nbsp;&nbsp;号:</label>
                    <input type="text" name="phonenum" id="phonenum" pattern="[0-9]{11}" value="${users.phonenum}"><br/>
                <label for="qq">Q &nbsp;&nbsp;Q &nbsp;&nbsp;号:</label>
                    <input type="text" name="qq" id="qq" pattern="[0-9]{8,11}" value="${users.qq}"><br/>
                <label for="email">邮 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</label>
                    <input type="text" name="email" id="email" value="${users.email}"><br/>
                <label for="address">地 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址:</label>
                    <input type="text" name="address" id="address" value="${users.address}"><br/>
            </div>
        </fieldset>
        <input type="submit" value="提交修改"/>
        <input type="reset" value="重新输入" class="newinput"/>
    </form>
</div>
</body>
</html>
