<% String basePath="../..";%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>欢迎进入此系统</title>
    <link rel="stylesheet" href="<%=basePath%>/css/login.css">
    <style>
        .submit:hover{
            color: #eeeeee;
            background: #ffdef8;
        }
    </style>
</head>
<body>
<div class="login">
    <div class="login_title">
        <p><img src="../../img/syslogo.png" style="width: 75px;height: 75px;"/>疫 情 隔 离 人 员 管 理 系 统</p>
    </div>
    <div class="login_main">
        <div class="main_left"><img src="../../img/login_left.png" alt="" class="main_left"></div>
        <div class="main_right">
            <div class="right_title">用户登录</div>
            <form action="/user/login" method="post" target="_blank" accept-charset="UTF-8">
                <div class="username">
                    <img src="../../img/username.png" alt="">
                    <input type="text" placeholder="请输入用户名" name="username">
                </div>
                <div class="password">
                    <img src="../../img/password.png" alt="">
                    <input type="password" placeholder="请输入密码" name="password">
                </div>

                <input type="submit" value="登 录" class="submit" style="padding: 0;" onclick="cloe()">
                <center><p style="margin-top:20px;font-size:12px;color:#FA6F03;">登录遇到问题，请联系管理员</p></center>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        function cloe(){
            window.close();
        }
    </script>
    <div class="login_footer">
        <p>建议浏览器：IE8及以上、360、谷歌、Firefox v22</p>
    </div>
</div>
<p style="text-align: center;color: #eeeeee; font-size: 20px;margin-top: 10px;"> 2 0 1 7 级&nbsp;&nbsp;&nbsp;&nbsp; 信 息 工 程 学 院 软 件 工 程 二 班 &nbsp;&nbsp;&nbsp;&nbsp; 1 7 0 3 6 0 9 7 &nbsp;&nbsp;&nbsp;&nbsp; 童 书 悦  毕 业 设 计 作 品 </p>
</body>
</html>
