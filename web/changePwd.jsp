<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/5/1
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .bkground {
            background-image: url("imgs/login2.jpg")
        }
        .outborder {
            margin: auto;
            width: 80%;
            height: 80%;
            border: 4px solid orange;
            border-radius: 10px;
        }
        .forgetPwdArea {
            background-color: orange;
            margin: auto;
            margin-top: 10%;
            width: 580px;
            padding: 2px;
            border-radius: 5px;
        }
        table {
            width: 100%;
        }
        tr,td {
            /*border: 1px solid gray;*/
            background-color: rgba(255, 243, 225, 0.85);
            padding: 12px 10px;
            font-size: 15px;
        }
        .xing {
            color: red;
            font-size: 16px;
        }
        botton {
            width: 90% !important;
        }
        .title {
            color: orange;
            font-size: 25px;
            padding: 8px 15px;
        }
        input {
            width: 105%;
            padding: 4px 8px;
        }
    </style>
</head>
<body class="bkground">
    <div class="outborder">
        <div class="title">修改密码</div>
        <div class="forgetPwdArea">
            <table>
                <tr>
                    <td>请输入密码：</td>
                    <td><input id="passWord1" type="password" placeholder="输入密码"></td>
                    <td><span class="xing">*</span>请输入6-16位密码</td>
                </tr>
                <tr>
                    <td>请确认密码：</td>
                    <td><input id="passWord2" type="password" placeholder="确认密码"></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td><button onclick="sure()" class="btn btn-warning btn-sm btn-block">确认</button></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>
</body>
<script>
    function sure() {
        var passWord = $("#passWord1").val();
        var passWord2 = $("#passWord2").val();
        if (!/^.{6,16}/.test(passWord)) {
            alert("密码格式错误");
            return;
        }
        if (passWord != passWord2) {
            alert("前后密码输入不一致");
            return;
        }
        $.ajax({
            url: "./changePwd.do",
            type: "post",
            data: {
                userName: userName,
                email: email
            },
            success: function (res) {
                alert(res.data)
            },
            error: function (res) {
                alert("error")
            }
        })
    }
</script>
</html>
