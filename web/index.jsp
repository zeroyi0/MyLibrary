<%--
  Created by IntelliJ IDEA.
  User: Linfeng
  Date: 2019/4/18
  Time: 12:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>登录</title>
  <script src="https://cdn.bootcss.com/jquery/2.2.2/jquery.js"></script>
  <%--bootstrap--%>
  <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <%-- 开启响应式 --%>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    .bkground {
      background-image: url("imgs/login2.jpg")
    }
    .loginPostion {
      margin:auto;;
      margin-top: 10%
    }
    input {
      border: #FEF6D2;
    }
    .loginArea {
      width: 430px;
    }
    /* 媒体查询，用于做响应式布局 */
    @media screen and (max-width: 450px){
      .loginArea {
        width: 90%;
      }
    }
  </style>
</head>
<body class="bkground">
<%-- 位置 --%>
<div class="container loginArea loginPostion">
  <%-- 面板 --%>
  <div class=" panel">
    <div class="panel-heading"style="background-color: #FEF6D2">
      <h3 class="panel-title text-center" style="padding: 5px">用户登录</h3>
    </div>
    <div class="panel-body">
      <%-- 账号密码 --%>
      <div style="padding:7% 10% 0 10%;">
        <form role="form" id="loginForm" action="./login.do" method="post">
          <div class="input-group">
            <span class="input-group-addon" style="background-color: #FEF6D2">
            <%-- 字体图标 --%>
            <span class="glyphicon glyphicon-user"></span></span>
            <%-- placeholder 属性提供可描述输入字段预期值的提示信息（hint）--%>
            <%
                Cookie[] cookies = request.getCookies();
                String userName = "";
                String passWord = "";
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("userName")) {
                            userName = cookie.getValue();
                            continue;
                        }
                        if (cookie.getName().equals("passWord")) {
                            passWord = cookie.getValue();
                            break;
                        }
                    }
                }
            %>
            <input type="text"class="form-control" placeholder="输入账号" id="userName" name="userName" value="<%=userName%>">
          </div>
          <br>
          <div class="input-group" style="margin-bottom: -4%">
            <span class="input-group-addon" style="background-color: #FEF6D2">
            <%-- 字体图标 --%>
            <span class="glyphicon glyphicon-lock"></span></span></span>
            <input type="password" class="form-control" placeholder="输入密码" id="passWord" name="passWord" value="<%=passWord%>">
          </div>
          <br>
        </form>
      </div><%-- 账号密码 --%>
      <%-- 注册 --%>
      <div  style="margin-left: 12%;color: rosybrown;margin-bottom: 1%">
        <a href="/biandan/register.jsp" style="text-decoration: none"> 注册</a>
        <%--复选框--%>
        <span style="margin-left: 55%;">
          <input id="rememberMe" value="rememberMe" type="checkbox" checked><span> 记住密码 </span>
        </span>
      </div>
      <%-- 按钮 --%>
      <button onclick="login()" id="fat-btn" class="btn text-warning" data-loading-text="Loading..."
              type="button" style="width: 80%; margin-left: 10% ; background-color: #FEF6D2; margin-bottom: 1%"> 登录
      </button>
      <%-- 忘记密码 --%>
      <div  style="margin-left: 74%;color: rosybrown; font-size: 13px">
          <a href="/biandan/forgetPwd.jsp" style="text-decoration: none"> 忘记密码?</a>
    </span>
      </div>
    </div><%-- 面板 --%>
  </div><%-- 位置 --%>
</body>
<script>
  function remember() {
      
  }
    function isEmpty(obj) {
        return obj === "" || obj == null;
    }
  // dom 对象 var dobj = document.getElementById("id")
  // jQuery 对象 var jqobj = $("#id");
  // dom 转 jQuery: jqobj = $(dobj);
  // jQuery 转 dom: dobj = jqobj[0]
    function login() {
        // console.log($("#rememberMe").val());
        var userName = $("#userName").val();
        var passWord = $("#passWord").val();
        if (isEmpty(userName)) {
            alert("用户名不允许为空！");
            return;
        }
        if (isEmpty(passWord)) {
            alert("密码不允许为空！");
            return;
        }
        // 加载状态按钮
        $('#fat-btn').button('loading');
        $.ajax({
            url:"./loginCheck.do",
            type: "post",
            data:{
                userName: userName,
                passWord: passWord,
                rememberMe: $("#rememberMe")[0].checked
            },
            success: function (res) {
                // JSON.parse(res);
                if (res.code == 200) {
                    <%--${form}--%>
                    $("#loginForm").submit();
                } else {
                    alert(res.errMsg);
                    // window.location.href="index.jsp";
                    return;
                }
            },
            complete: function (res) {
                $('#fat-btn').button('reset');
            }
        })
    }
</script>
</html>

