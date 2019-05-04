<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/23
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>增加新的图书</title>
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
        tr,th,td {
            /*border: 1px solid #BABABA;*/
            border: none;
            /*width: 200px;*/
            text-align: right;
            font-size: 15px;
        }
        .size2 {
            /*background-color: seashell;*/
            margin: auto;
            width: 80%;
            height: 80%;
            padding-top: 30px;
        }
        .import {
            color: red;
            font-size: 16px;
        }
        input {
            width: 90%;
            height: 28px;
            /*border-radius: 5px;*/
        }
        select {
            width: 90%;
            height: 28px;
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

    </style>
</head>
<body>
    <div class="size" >
        <div class="size2">
            <table class="table" >
                <tr>
                    <td>图书ID：<span class="import">*</span></td>
                    <td><input  id="bookId" type="text"></td>
                    <td></td>
                    <td>出版社：</td>
                    <td><input id="publisher" type="text"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>ISBN：</td>
                    <td><input id="bookISBN" type="number"></td>
                    <td></td>
                    <td>出版日期：</td>
                    <td><input id="createTime" type="text"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>书名：<span class="import">*</span></td>
                    <td><input id="bookName" type="text"></td>
                    <td></td>
                    <td>分类：</td>
                    <td><input id="classify" type="text"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>作者：</td>
                    <td><input id="author" type="text"></td>
                    <td></td>
                    <td>入库时间：</td>
                    <td><input id="enterLibTime" type="text"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>价格：</td>
                    <td><input id="bookPrice" type="text"></td>
                    <td></td>
                    <td>上传封面：</td>
                    <td style="padding-left: 47px"><input id="bookPicture" type="file" accept="image/jpeg,image/png"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>内容简介：</td>
                </tr>
                <tr>
                    <td colspan="5">
                    <textarea id="bookInfo"></textarea></td>
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
                    <td><button onclick="addBook()" class="btn-info">确认添加</button>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</body>
<script>
    function addBook() {
        var bookId = $("#bookId").val();
        var publisher = $("#publisher").val();
        var bookISBN = $("#bookISBN").val();
        var createTime = $("#createTime").val();
        var bookName = $("#bookName").val();
        var classify = $("#classify").val();
        var author = $("#author").val();
        var enterLibTime = $("#enterLibTime").val();
        var bookPrice = $("#bookPrice").val();
        var bookPicture = $("#bookPicture").val();
        var bookInfo = $("#bookInfo").val();
        console.log(bookPicture);
        var formData = new FormData();
        formData.append("bookPicture", bookPicture);

        $.ajax({
            url: "./addBook.do",
            type: "post",
            contentType: false,
            processData: false,
            data: {
                bookId: bookId,
                publisher: publisher,
                bookISBN: bookISBN,
                createTime: createTime,
                bookName: bookName,
                classify: classify,
                author: author,
                enterLibTime: enterLibTime,
                bookPrice: bookPrice ,
                bookInfo: bookInfo ,

                formData: formData
            }
        })
    }
</script>
</html>