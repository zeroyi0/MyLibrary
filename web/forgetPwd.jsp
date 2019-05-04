<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/30
  Time: 17:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>密码找回</title>
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
        <div class="title">找回密码</div>
        <div class="forgetPwdArea">
            <table>
                <tr>
                    <td>您输入的账号是</td>
                    <td><input id="userName" type="text" placeholder="输入账号"></td>
                    <td><span class="xing">*</span>您注册时的用户名</td>
                </tr>
                <tr>
                    <td>您输入的邮箱是</td>
                    <td><input id="email" type="text" placeholder="输入邮箱"></td>
                    <td><span class="xing">*</span>必须是注册时使用的邮箱</td>
                </tr>
                <tr>
                    <td></td>
                    <td><button onclick="next()" class="btn btn-warning btn-sm btn-block">下一步</button></td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>
</body>
<script>
    function next() {
        var userName = $("#userName").val();
        var email = $("#email").val();
        if (!/^.{4,12}/.test(userName)) {
            alert("用户名输入有误");
            return;
        } 
        if (!/^.+@\w+\.\w+$/.test(email)) {
            alert("邮箱输入有误");
            return;
        }
        $.ajax({
            url: "./forgetPwd.do",
            type: "post",
            data: {
                userName: userName,
                email: email
            },
            success: function (res) {
                if (res.code == 200) {
                    alert(res.data);
                    return;
                }
                alert(res.errMsg)
            },
            error: function (res) {
                alert("error")
            }
        })
    }
</script>
</html>
