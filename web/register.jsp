<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/19
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
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
        .registerPostion {
            /*background: linear-gradient(to right,rgba(255,0,0,0), rgba(255,100,20,0.5));*/
            background: linear-gradient(to right,rgba(254,246,210,1), rgba(255,100,20,0));
        }
        .registerArea {
            width: 767px;
            margin: auto;
            margin-top: 6%;
        }
        @media screen and (max-width: 800px) {
            .registerArea {
                width: 90%;
        }
        }
        .registerTable {
            padding: 15px;
            /*text-align: center;*/
            font-size: 35px;
            font-family: "微软雅黑";
            color: azure;
            text-shadow: 5px 5px 15px orange;
        }
        input {
            border: beige;
        }
        table {
            width: 100%;
        }
        tr,td {
            padding: 10px;
            text-align: center;
            /*background-color: darkseagreen;*/
        }
        td:first-child {
            text-align: right;
            padding-right: 0px;
        }
        td:last-child {
            text-align: left;
            padding-left: 0px;
        }
        input {
            padding: 4px 8px;
            border-radius: 3px;
        }

    </style>
</head>
<body class="bkground registerArea">
<%-- 位置 --%>
    <div class="registerPostion ">
        <%-- 表单 --%>
        <table class="text-warning">
            <tr>
                <td rowspan="1" class="registerTable">用户注册</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <%-- 默认填写 --%>
                <td>用户Id：</td>
                <td><input type="text" id="userId" name="userId"></td>
                <td></td>
            </tr>
            <tr>
                <td>用户名：</td>
                <td><%-- placeholder 属性提供可描述输入字段预期值的提示信息（hint）--%>
                    <input type="text" id="userName" name="userName"></td>
                <td></td>
            </tr>
            <tr>
                <td>设置密码：</td>
                <td><input type="password" id="passWord" name="passWord"></td>
                <td style="font-size: 14px"><span style="color: red;font-size: 16px">*</span>长度为6~16位字符</td>
            </tr>
            <tr>
                <td>确认密码：</td>
                <td><input type="password" id="passWord2" name="passWord2"></td>
                <td></td>
            </tr>
            <tr>
                <td>选择身份：</td>
                <td><select name="identity" id="identity" style="width: 211px;height: 26px;border: none">
                    <option></option>
                    <option value="GUEST">学生</option>
                    <option value="ADMIN">教师</option>
                </select></td>
                <td></td>
            </tr>
            <tr>
                <td>常用邮箱：</td>
                <td><input id="email" name="email"></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <%-- rowspan=xx --%>
                <td colspan="2">
                    <%-- 注册按钮 --%>
                    <button onclick="register()" id="fat-btn" class="btn btn-block" data-loading-text="Loading..."
                            type="button" style="background-color: #FEF6A5; width: 60%" > 注&nbsp;册
                    </button>
                </td>
            </tr>
            <tr>
                <td></td>
                <td colspan="2">
                    <%--复选框--%>
                    <input type="checkbox"><span style="font-size: 13px"> 我已阅读并同意 <a href="#">服务条款</a></span>
                </td>
            </tr>
        </table><%-- 表单 --%>
    </div><%-- 位置 --%>
</body>
<script>
    function isEmpty(obj) {
        return obj === "" || obj == null;
    }
    function register() {
        var userId = $("#userId").val();
        var userName = $("#userName").val();
        var passWord = $("#passWord").val();
        var passWord2 = $("#passWord2").val();
        var identity = $("#identity").val();
        var email = $("#email").val();
        console.log(passWord);
        if (!/^[0-9]+$/.test(userId)) {
            alert("用户ID输入有误");
            return;
        }
        if (isEmpty(userName)) {
            alert("用户名不允许为空");
            return;
        }
        if (isEmpty(passWord)) {
            alert("密码不允许为空");
            return;
        }
        if (passWord != passWord2) {
            alert("前后密码输入不一致");
            return;
        }
        if (isEmpty(identity)) {
            alert("身份选择不允许为空");
            return;
        }
        if (!/^\w+@\w+\.\w+$/.test(email)) {
            alert("邮箱格式错误");
            return;
        }
        // 加载状态按钮
        $('#fat-btn').button('loading');
        $.ajax({
            url:"./register.do",
            type: "post",
            data:{
                userId: userId,
                userName: userName,
                passWord: passWord,
                identity: identity,
                email: email
            },
            success: function (res) {
                // JSON.parse(res);
                if (res.code == 200) {
                    alert("注册成功！")
                } else {
                    alert(res.errMsg);
                    // window.location.href="index.jsp";
                    return;
                }
            },
            complete: function (res) {
                $('#fat-btn').button('reset');
            }
        })
    }
</script>
</html>
