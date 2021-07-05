<%--
  Created by IntelliJ IDEA.
  User: 童书悦
  Date: 2021-03-31
  Time: 0:44
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String basePath="../.."; %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>隔离人员管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/left-side-menu.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/font/iconfont.css">
    <script type="text/javascript" src="<%=basePath%>/js/jquery.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/left-side-menu.js"></script>
    <style>
        .right{
            width:82.5%;
            position: absolute;
            left: 250px;
            top: 60px;
            height: 85%;
            overflow-x: hidden;
            border: none;
        }
        .right-min{
            position: absolute;
            left: 100px;
            top: 60px;
            width:89%;
            height: 85%;
            overflow-x: hidden;
            border: none;
        }
        footer{
            width: 100%;
            height: 36px;
            color: #eeeeee;
            padding-top: 13px;
            text-align: center;
            font-size: 18px;
            background-color: #397bc5;
        }
    </style>
</head>
<body style="overflow-x: hidden; z-index: -2;">
<div class ="top"  style="width: 100%;height: 50px;background-color: #397bc5">
    <div style="padding-top: 10px; padding-left: 20px; color: #eeeeee;font-size: 18px;width: 100%;">
        <span>欢迎用户：<%--${users.username}--%>李四领导</span>
        <a href="/login/exit" target="_blank" style="text-decoration: none; margin-left: 85%;text-align: right" >
            <span style="color: #eeeeee;font-size: 18px;" onclick="cloe()">退出</span>
        </a>
    </div>
</div>
<div class="left-side-menu">
    <div class="lsm-expand-btn">
        <div class="lsm-mini-btn">
            <label>
                <input type="checkbox" checked="checked">
                <svg viewBox="0 0 100 100" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="50" cy="50" r="30" />
                    <path class="line--1" d="M0 40h62c18 0 18-20-17 5L31 55" />
                    <path class="line--2" d="M0 50h80" />
                    <path class="line--3" d="M0 60h62c18 0 18 20-17-5L31 45" />
                </svg>
            </label>

        </div>
        <!--        <input type="text">-->
    </div>
    <div class="lsm-container">
        <div class="lsm-scroll" >
            <div class="lsm-sidebar">
                <ul>
                    <li class="lsm-sidebar-item">
                        <a href="javascript:;"><i class="my-icon lsm-sidebar-icon icon_1"></i><span>个人中心</span><i class="my-icon lsm-sidebar-more"></i></a>
                        <ul>
                            <li><a href="javascript:;" id="a0" url="/login/Xinfo" onclick="step(0)"><span>修改个人信息</span></a></li>
                            <li><a href="javascript:;" id="a1" url="/login/changpass" onclick="step(1)"><span>修改密码</span></a></li>
                        </ul>
                    </li>
                    <li class="lsm-sidebar-item">
                        <a href="javascript:;"><i class="my-icon lsm-sidebar-icon icon-users"></i><span>数据中心</span><i class="my-icon lsm-sidebar-more"></i></a>
                        <ul>
                            <li><a href="javascript:;" id="a3" url="/user/findGByPager?page=1&size=7" onclick="step(3)"><span>一线人员管理</span></a></li>
                            <li><a href="javascript:;" id="a4" url="/user/findGLByPager?page=1&size=7" onclick="step(4)"><span>角色管理</span></a></li>
                        </ul>
                    </li>
                    <li class="lsm-sidebar-item">
                        <a href="javascript:;"><i class="my-icon lsm-sidebar-icon icon-iconset0308"></i><span>单据管理</span><i class="my-icon lsm-sidebar-more"></i></a>
                        <ul>
                            <li><a href="javascript:;" id="a6" url="/bill/findAllBillByPager?page=1&size=7" onclick="step(6)"><span>单据查询</span></a></li>
                            <li><a href="javascript:;" id="a7" url="/bill/spfindAllBillByPager?page=1&size=7" onclick="step(7)"><span>单据审批</span></a></li>
                            <li><a href="javascript:;" id="a8" url="/bill/xiufindAllBillByPager?page=1&size=7" onclick="step(8)"><span>单据修改</span></a></li>
                        </ul>
                    </li>
                    <li class="lsm-sidebar-item">
                        <a href="javascript:;"><i class="my-icon lsm-sidebar-icon icon-iconset0308"></i><span>病情报告中心</span><i class="my-icon lsm-sidebar-more"></i></a>
                        <ul>
                            <li><a href="javascript:;" id="a9" url="/data/findab" onclick="step(9)"><span>数据可视化</span></a></li>
                            <li><a href="javascript:;" id="a10" url="/ab/findabByPager?page=1&size=7" onclick="step(10)" ><span>异常人员报告审批</span></a></li>
                        </ul>
                    </li>
                    <%--<li class="lsm-sidebar-item">
                        <a href="javascript:;"><i class="my-icon lsm-sidebar-icon icon-chongzhi1"></i><span>反馈中心</span><i class="my-icon lsm-sidebar-more"></i></a>
                        <ul>
                            <li><a href="javascript:;"><span>软件帮助</span></a></li>
                        </ul>
                    </li>--%>
                </ul>
            </div>
        </div>
    </div>
</div>
<iframe id="iframe" class="right"  src="/login/right"></iframe>
<script>
    function  cloe(){

        window.close()
    }
    function step(x) {
        let id="#a"+x;
        let aurl=$(id).attr('url');
        $('a').removeAttr('class')
        $('#iframe').removeAttr("src");
        $('#iframe').attr("src",aurl);
        $(id).attr("class","active");
    }
</script>
<footer class="footer">
    <span id="time"></span><span id=""></span>
    <script>
        document.getElementById('time').innerHTML ='当前时间： '+new Date().toLocaleString()
            + ' 星期' + '日一二三四五六'.charAt(new Date().getDay());
        setInterval(
            "document.getElementById('time').innerHTML='当前时间： '+new Date().toLocaleString()+' 星期'+'日一二三四五六'.charAt(new Date().getDay());",
            1000);
    </script>
</footer>
</body>
</html>

