<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/23
  Time: 13:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除已有图书</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .size {
            background-color: snow;
            margin: auto;
            width: 90%;
            height: 80%;
        }
        table {
            background-color: snow;
            margin: auto;
            border-radius: 30px !important;
        }
        td,th {
            /*border: 1px solid #BABABA !important;*/
            padding: 5px 20px;
            text-align: center;
            font-size: 14px;
            color: #383838;
            max-width: 160px;
        }
        .trIn {
            width: 300px;
            text-align: right;
        }
        select {
            width: 100px;
            height: 30px;
            border: 1px solid gray;
            border-radius: 3px;
            padding: 3px 6px;
            font-size: 15px;
        }
        input {
            width: 235px;
            height: 28px;
            border: 1px solid gray;
            border-radius: 5px;
            padding: 1px 10px;
        }
        table:first-child {
            border: none !important;
        }
        @media screen and (max-width: 1200px){
            td,th {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="size" >
        <table>
            <tr style="background-color: #faf1ea">
                <td>
                    <select name="" id="search">
                        <option value="b_name">书名</option>
                        <option value="b_author">作者</option>
                        <option value="b_classify">类别</option>
                        <option value="b_publish">出版社</option>
                        <option value="all">关键字</option>
                    </select>
                </td>
                <td>
                    <input id="contents">
                </td>
                <td class="trIn">
                    <a onclick="searchDelBk()" href="#">
                        <span class="glyphicon glyphicon-search" style="font-size: 16px"></span>
                    </a>
                </td>
            </tr>
        </table>
        <div> &nbsp;</div>
        <div id="title"></div>
    </div>
</body>
<script>
    // 查阅要删除的图书
    function searchDelBk() {
        var select = $("#search option:selected").val();
        console.log(select);
        var content = $("#contents").val();
        console.log(content);
        $.ajax({
            url: "./deleteBkInfo.do",
            type: "get",
            data: {
                // 条件
                condition: select,
                content: content
            },
            success: function (res) {
                console.log(res);
                // alert("success");
                $("#title").html(res);
            },
            error: function (res) {
                alert("error")
            }
        })
    }
    // 删除图书
    function deleteBk(bookId) {
        console.log(bookId);
                $.ajax({
            url: "./deleteBk.do",
            type: "post",
            data: {
                bookId: bookId
            },
            success: function (res) {
                alert("success");
                // 刷新页面
                searchDelBk();
                return;
            },
            error: function (res) {
                alert("error")
            }
        })
    }
</script>
</html>