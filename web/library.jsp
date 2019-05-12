<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="https://cdn.bootcss.com/jquery/2.2.2/jquery.js"></script>
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
            text-shadow: 5px 5px 15px orangered;
        }
        .navPostion {
            float: right;
        }
        table {
            margin-top: 2%;
            margin-left: 10%;
        }
        .size tr,td,th {
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
            background-color: snow;
            border-radius: 4px;
        }
        .list-group-item.active, .list-group-item.active:focus, .list-group-item.active:hover {
             z-index: 2;
             color: #fff;
             background-color: #337ab7;
             border-color: #337ab7;
         }
        .list-group-item {
            position: relative;
            display: block;
            padding: 10px 15px;
            margin: 0px auto -1px auto;
            background-color: #FFFBFB;
            border: 1px solid #ddd;
            width: 97%;
        }
        .list-group-item:active {
            background-color: #FFF3E1 !important;

        }
        .left-item {
            position: relative;
            display: block;
            padding: 10px 30px;
            margin-bottom: -1px;
            background-color: #BABABA;
            font-size: 18px;
            color: white;
        }
    </style>
</head>
<body class="bkground">
    <div id="container" style="width:100%">
        <%-- 导航栏 --%>
        <div id="header" style="background-color:#FEF6D2">
                <div class="row">
                    <div class="container-fluid">
                    <span class="libraryTitle">图书管理系统&nbsp;&nbsp;</span>
                        <ul class="nav navbar-nav navPostion" >
                            <li class="dropdown">
                                <a href="#" data-toggle="dropdown">
                                    ${UserInfo.userName}
                                    <b class="caret"></b>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-right">
                                    <%--<li><a href="#">修改资料</a></li>--%>
                                    <li><a href="./logout.do">注销账号</a></li>
                                    <li><a href="./logout.do">退出账号</a></li>
                                    <%-- 横线 --%>
                                    <%--<li class="divider"></li>--%>
                                </ul>
                            </li>
                        </ul>
                    </div>
            </div>
        </div><%-- 导航栏 --%>
        <%-- 左侧栏目 --%>
        <div id="leftmenu" style="background-color: #BABABA;height:88%;width:15%;float:left;border-right: 3px solid white">
            <%--<a href="#" class="list-group-item active">--%>
                <%--免费域名注册--%>
            <%--</a>--%>
            <div class="left-item">
                搜索
            </div>
            <a href="./searchBook.jsp" class="list-group-item active" >书目检索</a>
            <div class="left-item">
                借阅管理
            </div>
            <a href="./borrowBook.jsp" class="list-group-item">图书借阅</a>
            <a href="./borrowBkAgain.do" class="list-group-item">图书续借</a>
            <a href="./returnBook.do" class="list-group-item">图书归还</a>
            <div class="left-item">
                查询统计
            </div>
            <a href="./myBookInfo.do" class="list-group-item">历史借阅记录</a>
            <a href="./notReturnOnTime.do" class="list-group-item">逾期记录查询</a>
            <c:if test='${UserInfo.identity == "管理员" }'>
                <div class="left-item">
                    图书管理
                </div>
                <a href="./allBookInfo.do" class="list-group-item">全部图书信息</a>
                <a href="deleteBk.jsp" class="list-group-item">图书信息删除</a>
                <a href="./changeBk.jsp" class="list-group-item">图书信息修改</a>
                <a href="./addNewBk.jsp" class="list-group-item">增加新的图书</a>
                <div class="left-item">
                    用户管理
                </div>
                <a href="./allUserInfo.do" class="list-group-item">全部用户信息</a>
                <a href="./allAdminInfo.do" class="list-group-item">查看全部管理员</a>
            </c:if>

        </div><%-- 左侧栏目 --%>
        <%-- 主内容 --%>
            <%--linear-gradient(to right,rgba(255,236,206,0.3), rgba(255,236,206,0.3)--%>
        <div id="content" style="background: linear-gradient(to right,rgba(255,250,250,0.8), rgba(255,250,250,0.8));
                height:88%;width:85%;float:left;">
            <div style="width: 100%;border-bottom: 3px solid #FEF6D2">
                <ul class="breadcrumb">
                    <li><a href="#">></a></li>
                    <li><a id="displaymenu" href="#">书目检索</a></li>
                </ul>
            </div>
            <div style="background-color: snow; margin-top:3%; margin-left: 3%">
                <iframe name="centerText" src="searchBook.jsp" style="border: none" width="90%" height="80%" >

                </iframe>
            </div>
        </div><%-- 主内容 --%>
        <%-- 底部 --%>
        <div>
            <div id="footer" style="background-color:white;clear:both;text-align:center;">
                <%--版权 © runoob.com--%>烟台大学光电学院
            </div>
            <div style="width: 100%;height: 5%; background-color: #FEF6D2">
                &nbsp;
            </div>
        </div><%-- 底部 --%>
    </div>
</body>
<script>
    $(function () {
        $("#leftmenu a").click(function () {
            $("#leftmenu a").removeClass('active');
            this.classList.add('active');
            // this 谁触发的就指谁
            this.target="centerText";
            var display = $(this).html();
            // console.log(display);
            $("#displaymenu").text(display);
        });
    })
</script>
</html>
