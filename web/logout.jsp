<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/21
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销</title>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <%--<script src="https://cdn.bootcss.com/jquery/2.2.2/jquery.js"></script>--%>
    <%--bootstrap--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .bkground {
            background-image: url("imgs/login2.jpg")
        }
        .logoutTitle {
            position: relative;
            margin: 8% 30%;
            background-color: #FFF3E1;
            padding: 1% 2%;
            text-align: center;
            font-size: 25px;
        }
        .loginAgain {
            position: absolute;
            right: 10%;
            bottom: 0%;
            font-size: 13px;
        }
    </style>
</head>
<body class="bkground">
    <div class="logoutTitle">
        您已成功退出XX图书管理系统
        <div class="loginAgain">
            <a href="./index.jsp">重新登陆</a>
        </div>
    </div>

</body>
</html>
