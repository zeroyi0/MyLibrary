<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/22
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书归还</title>
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
            font-size: 14px;
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
                    <th>序号</th>
                    <th>借阅时间</th>
                    <th>图书ID</th>
                    <th>书名</th>
                    <th>应还时间</th>
                    <th>是否归还</th>
                    <th>操作</th>
                </tr>
            </thead>
            <%int i = 1;%>
            <c:forEach var="borBk" items="${notReturnBkInfo}" >
                <tr>
                    <td><%= i++%></td>
                    <td>${borBk.borrowTime}</td>
                    <td>${borBk.book.bookId}</td>
                    <td>${borBk.book.bookName}</td>
                    <td>${borBk.shouldReturn}</td>
                    <td>${borBk.isReturnBk}</td>
                    <td><button onclick="returnBk(${borBk.borId})" class="btn btn-info btn-xs">归还</button></td>
                </tr>
            </c:forEach>
            <tr></tr>
        </table>
    </div>
</body>
<script>
    function returnBk(borId) {
        $.ajax({
            url: "./returnBk.do",
            type: "post",
            data: {
                borId: borId
            },
            success: function (res) {
                location.reload();
                alert(res.data)
            },
            error: function (res) {
                alert("系统错误，还书失败")
            }
        })
    }
</script>
</html>
