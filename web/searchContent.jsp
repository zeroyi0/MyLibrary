<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/23
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
        <c:forEach var="book" items="${SearchBook}">
            <tr>
                <td>${book.bookId}</td>
                <td>${book.bookISBN}</td>
                <td>${book.bookName}</td>
                <td>${book.author}</td>
                <td>${book.publisher}</td>
                <td>${book.createTime}</td>
                <td>${book.bookPrice}</td>
                <td>${book.classify}</td>
                <td>${book.enterLibTime}</td>
                <td>${book.bookStatus}</td>
            </tr>
        </c:forEach>
    </table>


