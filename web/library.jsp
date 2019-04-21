<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/19
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>图书管理系统</title>
    <script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
    <%--<script src="https://cdn.bootcss.com/jquery/2.2.2/jquery.js"></script>--%>
    <%--bootstrap--%>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        .bkground {
            background-image: url("imgs/login2.jpg")
        }
        .libraryTitle {
            font-size: 20px;
            font-family: "微软雅黑";
            color: white;
            text-shadow: 5px 5px 15px red;
        }
        .navPostion {
            float: right;
        }
        table {
            margin-top: 2%;
            margin-left: 10%;
        }
        tr,td,th {
            padding: 4px 10px;
            border: 1px solid saddlebrown;
            width: 150px;
            text-align: center;
        }
        .row {
            margin: auto 0 !important;
        }
        div {
            border-radius: 4px;
        }
        .nav>li>a:focus, .nav>li>a:hover {
            background-color: #c19b70 !important;
            background-color: #eee;
        }
        .nav .open>a, .nav .open>a:focus, .nav .open>a:hover {
            background-color: #c19b70 !important;
            border-color: #337ab7;
        }
        .breadcrumb {
            padding: 8px 15px;
            margin-top: 4px;
            margin-bottom: 4px ;
            list-style: none;
            background-color: #FFF4E2;
            border-radius: 4px;
        }
    </style>
</head>

<body class="bkground">
    <div id="container" style="width:100%">
        <%-- 导航栏 --%>
        <div id="header" style="background-color:burlywood">
                <div class="row">
                    <div class="container-fluid">
                    <span class="libraryTitle">图书借阅系统&nbsp;&nbsp;</span>
                        <ul class="nav navbar-nav navPostion" >

                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown">
                                    ${UserInfo.userName}
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a href="#">修改资料</a></li>
                                    <li><a href="#">查询借阅图书</a></li>
                                    <li><a href="./logout.do">注销</a></li>
                                    <%-- 横线 --%>
                                    <%--<li class="divider"></li>--%>
                                </ul>
                            </li>
                        </ul>
                    </div>
            </div>
        </div><%-- 导航栏 --%>
        <%-- 左侧栏目 --%>
        <div id="menu" style="background-color:#D3A059;height:88%;width:15%;float:left;border-right: 3px solid white">
            fff
        </div><%-- 左侧栏目 --%>
        <%-- 主内容 --%>
        <div id="content" style="background: linear-gradient(to right,rgba(255,236,206,0.6), rgba(255,236,206,0.6));
                height:88%;width:85%;float:left;">
            <div style="width: 100%;border-bottom: 3px solid white">
                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">2013</a></li>
                    <li class="active">十一月</li>
                </ul>
            </div>
            <div>
                <table style="background-color: #FFF4E2">
                    <tr>
                        <th>条形码</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>书架</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                        <th>条形码</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>书架</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                        <th>条形码</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>书架</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                        <th>条形码</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>书架</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                    <tr>
                        <th>条形码</th>
                        <th>书名</th>
                        <th>作者</th>
                        <th>出版社</th>
                        <th>书架</th>
                        <th>状态</th>
                        <th>操作</th>
                    </tr>
                </table>
            </div>
        </div><%-- 主内容 --%>
        <%-- 底部 --%>
        <div>
            <div id="footer" style="background-color:white;clear:both;text-align:center;">
                <%--版权 © runoob.com--%>&nbsp;
            </div>
            <div style="width: 100%;height: 5%; background-color: burlywood">
                &nbsp;
            </div>
        </div><%-- 底部 --%>
    </div>
</body>
<script>
    function logout() {
        $.ajax({
            url: "./logout.do",
            type: "get"
        })
    }
</script>
</html>
