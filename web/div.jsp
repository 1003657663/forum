<%@ page import="com.zzu.myClass.ConnectDB" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%--
  Created by IntelliJ IDEA.
  User: chao
  Date: 2015/9/22
  Time: 0:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--全局变量--%>
<%!
  int id;
  String smallbanName;
%>
<%
  //-----获取板块的id
  id = Integer.parseInt(request.getParameter("id"));
  //-----获取板块名字
  ConnectDB connectDB = new ConnectDB();
  Statement statement0 = connectDB.getState();
  String banNameSql = "select name from smallbankuai where id="+id;
  try {
    ResultSet resultSet0 = statement0.executeQuery(banNameSql);
    if (resultSet0.first()) {
      smallbanName = resultSet0.getString("name");
    }
  }catch (SQLException ex){
    ex.printStackTrace();
  }
%>
<html>
<head>
    <title><%out.print(smallbanName);%></title>
    <link type="text/css" rel="stylesheet" href="/css/index-style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/head.css"/>
</head>
<body>
<%@include file="include/head.jsp"%>
<%
  Statement statement = connectDB.getState();
  String getTieziSql = "select * from tiezi where bankuaiID="+id;
  ResultSet resultSet = statement.executeQuery(getTieziSql);
  while (resultSet.next()) {
    String title = resultSet.getString("title");
    String context = resultSet.getString("context");
    out.println("<p>"+title+"</p>");
  }
%>
</body>
</html>
