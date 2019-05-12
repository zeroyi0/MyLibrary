<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/23
  Time: 12:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改图书信息</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
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
        .size2 {
            /*background-color: seashell;*/
            margin: auto;
            width: 80%;
            height: 80%;
        }
        .import {
            color: red;
            font-size: 16px;
        }
        input {
            width: 90%;
            height: 28px;
            padding-left: 10px;
            /*border-radius: 5px;*/
        }
        select {
            width: 90%;
            height: 28px;
            padding-left: 10px;
        }
        textarea {
            width: 96%;
            height: 100px;
            border-radius: 5px;
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
            background-color: #f7ede6;
            border-radius: 10px;
        }
        .tubiao {
            padding-top: 13px !important;
            font-size: 16px;
        }
        .fixlength {
            border: 1px solid gray;
            width: 90%;
            height: 28px;
            float: right;
            padding-left: 10px;
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
                            <option value="userName">图书ID</option>
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
                    <td>图书ID：<span class="import">*</span></td>
                    <td style="text-align: left"><div id="bookId" class="fixlength">${book.bookId}</div></td>
                    <td></td>
                    <td>出版社：</td>
                    <td><input id="publisher" type="text" value="${book.publisher}"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>ISBN：</td>
                    <td><input id="bookISBN" type="number" value="${book.bookISBN}"></td>
                    <td></td>
                    <td>出版日期：</td>
                    <td><input id="createTime" type="text" value="${book.createTime}"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>书名：<span class="import">*</span></td>
                    <td><input id="bookName" type="text" value="${book.bookName}"></td>
                    <td></td>
                    <td>分类：</td>
                    <td><input id="classify" type="text" value="${book.classify}"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>作者：</td>
                    <td><input id="author" type="text" value="${book.author}"></td>
                    <td></td>
                    <td>入库时间：</td>
                    <td><input id="enterLibTime" type="text" value="${book.enterLibTime}"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>价格：</td>
                    <td><input id="bookPrice" type="text" value="${book.bookPrice}"></td>
                    <td></td>
                    <td>状态：</td>
                    <td><select id="bookStatus" name="" value="${book.bookStatus}">
                        <option>在架上</option>
                        <option>已借出</option>
                    </select></td>
                    <td></td>
                </tr>
                <tr>
                    <td>内容简介：</td>
                </tr>
                <tr>
                    <td colspan="5">
                        <textarea id="bookInfo"> ${book.bookInfo}</textarea></td>
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
                    <td><button onclick="changeBk()" class="btn-info">确认修改</button>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</body>
<script>
    function searchBk() {
        // $("td input").html("");
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
                $("#publisher").val(res.publisher);
                $("#bookISBN").val(res.bookISBN);
                $("#createTime").val(res.createTime);
                $("#bookName").val(res.bookName);
                $("#classify").val(res.classify);
                $("#author").val(res.author);
                $("#enterLibTime").val(res.enterLibTime);
                $("#bookPrice").val(res.bookPrice);
                $("#bookStatus").val(res.bookStatus);
                $("#bookInfo").html("&nbsp;&nbsp;&nbsp;&nbsp;" + res.bookInfo);
            },
            error: function () {
                alert("error")
            }
        })
    }
    function changeBk() {
        var bookId = $("#bookId").html();
        var publisher = $("#publisher").val();
        var bookISBN = $("#bookISBN").val();
        var createTime = $("#createTime").val();
        var bookName = $("#bookName").val();
        var classify = $("#classify").val();
        var author = $("#author").val();
        var enterLibTime = $("#enterLibTime").val();
        var bookPrice = $("#bookPrice").val();
        var bookStatus = $("#bookStatus").val();
        var bookInfo = $("#bookInfo").html();
        console.log(bookId);
        $.ajax({
            url: "./changeBk.do",
            type: "post",
            data: {
                bookId: bookId,
                publisher: publisher,
                bookISBN: bookISBN,
                createTime: createTime,
                bookName: bookName,
                classify: classify,
                author: author,
                enterLibTime: enterLibTime,
                bookPrice: bookPrice,
                bookStatus: bookStatus,
                bookInfo: bookInfo
            },
            success: function (res) {
                alert(res.data)
            },
            error: function (res) {
                console.log(res);
                alert("系统错误，修改失败")
            }
        })
    }
</script>
</html>