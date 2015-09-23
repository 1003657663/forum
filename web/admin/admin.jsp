<%@ page import="java.sql.Statement" %>
<%@ page import="com.zzu.AboutDB.ConnectDB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: 宋超
  Date: 2015/9/19
  Time: 15:29
  To change this template use File | Settings | File Templates.
  大板块的版主登录页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  ConnectDB connectDB = new ConnectDB();
  Statement statement = connectDB.getState();
  String name = request.getParameter("name");
  String password = request.getParameter("password");
  if(name!=""&&password!="") {
    try {
      String adminSql = "select * from user where name='" + name + "' and password='" + password + "'";
      ResultSet result = statement.executeQuery(adminSql);
      if(result.first()){
        out.println("登陆成功");
      }
    }catch (SQLException sex){
      sex.printStackTrace();
    }
  }
%>
<html>
<head>
    <title></title>
</head>
<body>
<div style="width: 100%;text-align: center;position: absolute;top: 200px;">
  <h1>后台登陆</h1>
  <form method="post" action="/admin">
    <input type="text" name="name" />
    <input type="password" name="password"/>
    <input type="submit"/>
  </form>
</div>
</body>
</html>
