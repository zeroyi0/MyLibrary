<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/26
  Time: 21:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .size {
            background-color: snow;
            margin: auto;
            width: 80%;
            height: 80%;
        }
        tr,th,td {
            border: 1px solid #BABABA;
            text-align: center;
            font-size: 15px;
            max-width: 200px;

        }
        th {
            padding: 4px 8px;
        }
    </style>
</head>
<body>
    <div class="size" >
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>用户ID</th>
                <th>用户名</th>
                <th>性别</th>
                <th>用户邮箱</th>
                <th>注册时间</th>
            </tr>
            </thead>
            <c:forEach var="user" items="${AllAdmin}">
                <tr>
                    <td>${user.userId}</td>
                    <td>${user.userName}</td>
                    <td>${user.userSex}</td>
                    <td>${user.email}</td>
                    <td>${user.registerTime}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
<script>
    // 身份
    function admin(userId) {
        console.log(userId);
        var ident = $("#user_" + userId).html();
        if (ident == "管理员") {
            alert("已经是管理员");
            return;
        }
        $.ajax({
            url:"./ident.do",
            type: "post",
            data: {
                userId: userId,
                identity: "管理员"
            },
            success: function (res) {
                console.log(res)
                if (res.code == 200) {
                    //
                    alert(res.data);
                    $("#user_" + userId).html('管理员');
                }else {
                    alert(res.code)
                }
            },
            error: function (res) {
                alert("系统错误，修改失败")
            }
        })
    }
</script>
</html>
