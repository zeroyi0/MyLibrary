<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/22
  Time: 18:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>全部图书信息</title>
    <%--<script src="https://cdn.bootcss.com/jquery/2.2.2/jquery.js"></script>--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .size {
            margin: auto;
            width: 90%;
            height: 80%;
        }
        tr,th,td {
            background-color: snow;
            /*border: 1px solid #BABABA;*/
            /*width: 200px;*/
            text-align: center;
            font-size: 14px;
            color: #383838;
            max-width: 160px;
        }
        th {
            padding: 4px 8px;
            font-size: 16px;
        }
        .pagination>li>a, .pagination>li>span {
            position: relative;
            float: left;
            padding: 6px 25px;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
            font-size: 13px;
        }
        .pagination>li>a:hover {
            background-color: #FEF6A5;
        }
        ul>li>input {
            position: relative;
            float: left;
            margin-left: -1px;
            line-height: 1.42857143;
            color: #337ab7;
            text-decoration: none;
            background-color: #fff;
            border: 1px solid #ddd;
            width: 100px;
            height: 32px;
            outline: none;
            border-radius: 3px;
            font-size: 13px;
            padding-left: 10px;
        }
    </style>
</head>
<body>
    <div class="size" >
        <table class="table table-hover" >
            <thead>
            <tr>
                <th>图书ID</th>
                <th>ISBN</th>
                <th>书名</th>
                <th>作者</th>
                <th>出版社</th>
                <th>出版日期</th>
                <th>价格</th>
                <th>分类</th>
                <th>入库时间</th>
                <th>状态</th>
            </tr>
            </thead>
            <c:forEach var="book" items="${AllBook}">
                <tr>
                    <td>${book.bookId}</td>
                    <td>${book.bookISBN}</td>
                    <td><a href="changeBkPage.do?bookId=${book.bookId}">${book.bookName}</a></td>
                    <td>${book.author}</td>
                    <td>${book.publisher}</td>
                    <td>${book.createTime}</td>
                    <td>${book.bookPrice}</td>
                    <td>${book.classify}</td>
                    <td>${book.enterLibTime}</td>
                    <td>${book.bookStatus}</td>
                </tr>
            </c:forEach>
            <tr>
                <td></td>
                <td colspan="5" style="text-align: right">
                    <ul class="pagination">
                        <li><a href="#">首页</a></li>
                        <li><a href="#" id="up">上一页</a></li>
                        <li><a href="#" id="1">1</a></li>
                        <li><a href="#" id="2">2</a></li>
                        <li><a href="#" id="3">3</a></li>
                        <li><a href="#" id="4">4</a></li>
                        <li><a href="#" id="5">5</a></li>
                        <li><a href="#" id="6">6</a></li>
                        <li><a href="#" id="down">下一页</a></li>
                        <li><a href="#">尾页</a></li>
                    </ul><br>
                </td>
                <td colspan="3">
                    <ul class="pagination">
                        <li><input type="number" id="gotoIndex"></li>
                        <li><a href="#">跳转</a></li>
                    </ul><br>
                </td>
            </tr>
        </table>
    </div>
</body>
<script>
    // 当前页页码显示
    function page(){
        // 当前页
        current = ${Current};
        // 总页数
        pageMax = ${PageNum};
        console.log(current);
        // 这一行的第x个（sure=0时是第六个）
        var sure = current % 6;  // current = 6 时
        // 最后一页页码个数
        var  last = pageMax % 6;
        // 最后一个页码
        if (current + last > pageMax) {
            for (var j = last + 1; j <= 6; j++) {
                $("#" + j).html("END")
            }
            for  (var j = 1; j <= last; j++) {
                $("#" + j).html(pageMax - last + j);
            }
            if (sure == 0) {
                $("#6")[0].style.backgroundColor = "#FEF6A5";
            } else {
                $("#" + sure)[0].style.backgroundColor = "#FEF6A5";
            }
            return;
        }
        // 当前页的所有页码
        for (var j = 1; j <= 6; j++) {
            if (sure == 0) {
                sure = 6;
            }
            $("#" + j).html(current + j - sure);  // sure = 0
        }
        if (sure == 0) {
            $("#6")[0].style.backgroundColor = "#FEF6A5";
        } else {
            $("#" + sure)[0].style.backgroundColor = "#FEF6A5";
        }
    }
    page();
    // 当前页信息
    $(function (){
        $(".pagination a").click(function () {
            var current = ${Current};
            var pageMax = ${PageNum};
            var index = $(this).text();
            switch (index) {
                case "首页":index = 1; break;
                case "尾页":index = pageMax; break;
                case "上一页":
                    if (current <= 1) {
                    alert("已经是首页");
                    return;
                    }
                    index = current - 1; break;
                case "下一页":
                    if (current >= pageMax) {
                        alert("已经是尾页");
                        return;
                    }
                    index = current + 1; break;
                case "END":
                    alert("此页码不存在");
                    return;
                case "跳转":
                    index = $("#gotoIndex").val();
                    if (index < 1 || index > pageMax) {
                        alert("输入有误");
                        return;
                    }
                    break;
            }
            index--;
            this.href = "./allBookInfo.do?index=" + index;
        })
    })
</script>
</html>
