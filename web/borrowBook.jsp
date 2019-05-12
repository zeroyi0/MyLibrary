<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/22
  Time: 18:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书借阅</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        input {
            outline: none;
        }
        .size {
            background-color: snow;
            margin: auto;
            width: 85%;
            height: 80%;
        }
        table {
            border: none;
        }
        tr,th,td {
            /*border: 1px solid #BABABA;*/
            /*width: 200px;*/
            text-align: right;
            font-size: 15px;
        }
        input {
            border-radius: 15px;
            width: 300px;
            height: 28px;
        }
        .fixlength {
            width: 300px !important;
        }
        .size2 {
            /*background-color: seashell;*/
            margin: auto;
            width: 80%;
            height: 80%;
        }
        select {
            width: 90%;
            height: 28px;
        }
        button {
            border-radius: 5px;
        }
        .table>tbody>tr>td {
            padding: 8px;
            line-height: 1.42857143;
            vertical-align: top;
            border-top: none !important;
        }
        tr:first-child{
            background-color: rgba(249, 239, 232, 0.9);
        }
        .tubiao {
            padding-top: 13px !important;
            font-size: 16px;
        }
        td>div{
            background-color: white;
            height: 28px;
            width: 300px;
            text-align: center;
        }
        .bookInfo {
            height: 100%;
            width: 100%;
            padding: 10px 15px;
            text-align: left;
        }

    </style>
</head>
<body>
<div class="size" >
    <div class="size2">
        <table class="table" >
            <tr>
                <td>
                    <select name="" id="search">
                        <option value="bookID">图书ID</option>
                    </select>
                </td>
                <td>
                    <input id="contents">
                </td>
                <td class="tubiao">
                    <a onclick="searchBk()" href="#">
                        <span class="glyphicon glyphicon-search">&nbsp;</span>
                    </a>
                </td>
            </tr>
            <tr><td></td></tr>
            <tr>
                <td>图书ID：</td>
                <td class="fixlength"><div id="bookId">${book.bookId}</div></td>
                <td></td>
                <td>出版社：</td>
                <td class="fixlength"><div id="publisher">${book.publisher}</div></td>
                <td></td>
            </tr>
            <tr>
                <td>ISBN：</td>
                <td><div id="bookISBN">${book.bookISBN}</div></td>
                <td></td>
                <td>出版日期：</td>
                <td><div id="createTime">${book.createTime}</div></td>
                <td></td>
            </tr>
            <tr>
                <td>书名：</td>
                <td><div id="bookName">${book.bookName}</div></td>
                <td></td>
                <td>分类：</td>
                <td><div id="classify">${book.classify}</div></td>
                <td></td>
            </tr>
            <tr>
                <td>作者：</td>
                <td><div id="author">${book.author}</div></td>
                <td></td>
                <td>入库时间：</td>
                <td><div id="enterLibTime">${book.enterLibTime}</div></td>
                <td></td>
            </tr>
            <tr>
                <td>价格：</td>
                <td><div id="bookPrice">${book.bookPrice}</div></td>
                <td></td>
                <td>状态：</td>
                <td><div id="bookStatus">${book.bookStatus}</div></td>
                <td></td>
            </tr>
            <tr>
                <td>内容简介：</td>
            </tr>
            <tr>
                <td colspan="5" style="width: 550px; height: 150px">
                    <div id="bookInfo" class="bookInfo">${book.bookInfo}</div></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
                <%--<td><button class="btn-info">继续添加下一本</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                <%--<button class="btn-info">添加</button></td>--%>
                <td><button onclick="borrowBk()" class="btn-info">确认借阅</button>&nbsp;&nbsp;</td>
            </tr>
        </table>
    </div>
</div>
</body>
<script>
    function searchBk() {
        // $("td div").html("");
        var bookId = $("#contents").val();
        console.log(bookId);
        $.ajax({
            url: "./borrowBkSearch.do",
            type: "get",
            data: {
                bookId: bookId
            },
            success: function (res) {
                console.log(res);
                $("#bookId").html(res.bookId);
                $("#publisher").html(res.publisher);
                $("#bookISBN").html(res.bookISBN);
                $("#createTime").html(res.createTime);
                $("#bookName").html(res.bookName);
                $("#classify").html(res.classify);
                $("#author").html(res.author);
                $("#enterLibTime").html(res.enterLibTime);
                $("#bookPrice").html(res.bookPrice);
                $("#bookStatus").html(res.bookStatus);
                $("#bookInfo").html("&nbsp;&nbsp;&nbsp;&nbsp;" + res.bookInfo);
            },
            error: function () {
                alert("error")
            }
        })
    }
    function borrowBk() {
        var bookStatus = $("#bookStatus").text();
        if (bookStatus == '已借出') {
            alert("该书已借出，不能借阅");
            return;
        }
        var bookId = $("#bookId").text();
        console.log(bookId);
        $.ajax({
            url: "./borrowBk.do",
            type: "post",
            data: {
                bookId: bookId
            },
            success: function (res) {
                alert(res.data)
            },
            error: function (res) {
                alert("系统错误，借书失败")
            }
        })
    }
</script>
</html>

