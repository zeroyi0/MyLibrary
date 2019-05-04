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
        tr:first-child{
            background-color: #f7ede6;
            border-radius: 10px;
        }
        .tubiao {
            padding-top: 13px !important;
            font-size: 16px;
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
                            <option value="userName">书名</option>
                            <option value="author">作者</option>
                            <option value="publisher">出版社</option>
                            <option value="classify">类别</option>
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
                    <td><input type="text"></td>
                    <td></td>
                    <td>出版社：</td>
                    <td><input type="text"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>ISBN：</td>
                    <td><input type="number"></td>
                    <td></td>
                    <td>出版日期：</td>
                    <td><input type="text"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>书名：<span class="import">*</span></td>
                    <td><input type="text"></td>
                    <td></td>
                    <td>分类：</td>
                    <td><input type="text"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>作者：</td>
                    <td><input type="text"></td>
                    <td></td>
                    <td>入库时间：</td>
                    <td><input type="text"></td>
                    <td></td>
                </tr>
                <tr>
                    <td>价格：</td>
                    <td><input type="text"></td>
                    <td></td>
                    <td>状态：</td>
                    <td><select name="" id="">
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
                        <textarea></textarea></td>
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
                    <td><button class="btn-info">确认修改</button>&nbsp;&nbsp;</td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>