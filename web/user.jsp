<%--
  Created by IntelliJ IDEA.
  User: 宋超
  Date: 2015/9/20
  Time: 13:30
  To change this template use File | Settings | File Templates.
  个人主页jsp
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人空间</title>
    <link type="text/css" rel="stylesheet" href="/css/head.css"/>
</head>
<body>
<%@include file="include/head.jsp"%>
<%
  if(isLogin==null||!isLogin){
    String message = "您还没有登陆";
    out.print("<script>");
    out.print("if(confirm(\""+message+"\")){");
    out.print("location.href='/'");
    out.print("}else{location.href='/'}");
    out.print("</script>");
    return;
  }else{
    name = (String) session.getAttribute("name");
  }
%>
</body>
</html>
