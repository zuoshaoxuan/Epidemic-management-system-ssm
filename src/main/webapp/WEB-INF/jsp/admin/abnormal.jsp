<%--
  Created by IntelliJ IDEA.
  User: zuoshaoxuan
  Date: 2021-04-24
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<% String basePath="../.."; %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
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
<%
    if (session.getAttribute("info") != null) {
        String x = (String) session.getAttribute("info");
        out.println("<script>alert(\""+x+"\");</script>");
    }
%>
<div class="tree">
    <div>
        <h3>当 前 位 置 :数据中心&gt;异常人员报告</h3>
    </div>
    <form action="/ab/addab" method="post">
        <fieldset>
            <legend>异常信息:</legend>
            <div>
                <label for="name">用户名称:</label>
                <input type="text" name="username" id="name" placeholder="填写用户名"><br/>
                <label for="symptom0">异常症状1:</label>
                <input type="text" id="symptom0" name="symptom0"placeholder="可以不填写" > <br/>
                <label for="symptom0">异常症状2:</label>
                <input type="text" id="symptom1" name="symptom1"placeholder="可以不填写" > <br/>
                <label for="symptom0">异常症状3:</label>
                <input type="text" id="symptom2" name="symptom2"placeholder="可以不填写" > <br/>
                <label for="symptom0">异常症状4:</label>
                <input type="text" id="symptom3" name="symptom3"placeholder="可以不填写" > <br/>
                <label for="symptom0">异常症状5:</label>
                <input type="text" id="symptom4" name="symptom4"placeholder="可以不填写" > <br/>
                <label for="symptom0">异常症状6:</label>
                <input type="text" id="symptom5" name="symptom5"placeholder="可以不填写" > <br/>
                <label for="reporter">汇 报 者 :</label>
                <input type="text" id="reporter" name="reporter" value="${users.username}" readonly="readonly"> <br/>
                <label for="reportertime">汇报时间:</label>
                <input type="date" id="reportertime" name="reportertime"> <br/>
            </div>
        </fieldset>
        <input type="submit" value="提交修改"/>
        <input type="reset" value="重新输入" class="newinput"/>
    </form>
</div>
</body>
</html>


