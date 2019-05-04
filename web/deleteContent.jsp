<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/26
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<table class="table table-hover" >
    <thead>
    <tr>
        <th>图书ID</th>
        <th>ISBN</th>
        <th>书名</th>
        <th>分类</th>
        <th>入库时间</th>
        <th>状态</th>
        <th>操作</th>
    </tr>
    </thead>
    <c:forEach var="book" items="${deleteBkInfo}">
        <tr id="${book.bookId}">
            <td>${book.bookId}</td>
            <td>${book.bookISBN}</td>
            <td>${book.bookName}</td>
            <td>${book.classify}</td>
            <td>${book.enterLibTime}</td>
            <td>${book.bookStatus}</td>
            <td><button onclick="deleteBk(${book.bookId})" class="btn btn-danger btn-xs">删除</button></td>
        </tr>
    </c:forEach>
</table>
