<%--
  Created by IntelliJ IDEA.
  User: 宋超
  Date: 2015/9/20
  Time: 14:28
  To change this template use File | Settings | File Templates.
  顶部部分的jsp，每个页面都要引入
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<div class="top-toolbar">
  <img src="images/forum.png"/>

  <ul class="login-ul">
    <%!
      String name;
      Boolean isLogin;
    %>
    <%
    //判断是否有isLogin字段
      isLogin = (Boolean) session.getAttribute("isLogin");
      if (isLogin != null) {
        //登陆成功和不成功的判断
        if (isLogin) {
          name = (String) session.getAttribute("name");
    %>
    <a href="/user">
      <li><img width="40px" height="40px" src="user-file/head-photo/1.jpeg"/></li>
      <li>songchao</li>
      <li>exit</li>
    </a>
    <%
      }else{
    %>
    <li class="first-li" onclick="loginDisplay(1)">登陆</li>
    <li onclick="registerDisplay(1)">注册</li>
    <%
      }}else{
    %>
        <li class="first-li" onclick="loginDisplay(1)">登陆</li>
        <li onclick="registerDisplay(1)">注册</li>
    <%
      }
    %>
  </ul>
</div>
</body>
</html>
