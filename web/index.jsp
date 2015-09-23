<%@ page import="java.sql.Statement" %>
<%@ page import="com.zzu.AboutDB.ConnectDB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%--
 主页jsp
 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>郑大园</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/index-style.css"/>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/head.css"/>
    <script src="${pageContext.request.contextPath}/js/index-js.js"></script>
</head>
<body>
<%@include file="include/head.jsp" %>
<div id="content-main">
    <div id="content-left">
        <div class="context">
            <div class="title-div">
                <h3 class="title-h3">图文</h3>
            </div>

            <div class="content-div">
                <!--小标题-->
                <div class="content-title">
                    <h3>top</h3>
                </div>
                <!--内容-->
                <div class="content-content">
                    <div>
                        <h4>院系内交流</h4>

                        <p>同一个院系的童鞋再次聚会</p>
                    </div>
                </div>
            </div>

            <div class="content-div">
                <!--小标题-->
                <div class="content-title">
                    <h3>bottom</h3>
                </div>
                <!--内容-->
                <div class="content-content">
                    <div>
                        <h4>院系内交流</h4>

                        <p>同一个院系的童鞋再次聚会</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div id="content-right">
        <div class="context">
            <div class="title-div">
                <h3 class="title-h3">好帖</h3>
            </div>

            <div class="content-div">
                <!--小标题-->
                <div class="content-title">
                    <h3>热帖</h3>
                </div>
                <!--内容-->
                <div class="content-content">
                    <div>
                        <h4>院系内交流</h4>

                        <p>同一个院系的童鞋再次聚会</p>
                    </div>
                </div>
            </div>

            <div class="content-div">
                <!--小标题-->
                <div class="content-title">
                    <h3>精华帖</h3>
                </div>
                <!--内容-->
                <div class="content-content">
                    <div>
                        <h4>院系内交流</h4>

                        <p>同一个院系的童鞋再次聚会</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div id="content-center">
        <div class="context">
            <!--大标题-->
            <div class="title-div">
                <h3 class="title-h3">板块</h3>
            </div>
            <!--小标题和内容-->
            <!--小标题-->
            <%--这里获取数据库查询--%>
            <%!Statement statement;%>
            <%
                ConnectDB connectDB = new ConnectDB();
                statement = connectDB.getState();
            %>
            <%--这里动态生成内容--%>
            <%
                //获取有几个大板块
                try {
                    String getBigbanSql = "select * from bigbankuai";
                    ResultSet resultBigban = statement.executeQuery(getBigbanSql);
                    while (resultBigban.next()) {
                        //获取到大板块的名字和id，然后通过id获取其中的小版块
                        String name = resultBigban.getString("name");
                        int bigbanId = resultBigban.getInt("id");
                        int bigAdminID = resultBigban.getInt("admin");
                        //-----------------这里输入html语句大板块标题
                        out.println("<div class=\"content-div\">");
                        out.println("<div class=\"content-title\">");
                        //-------------获取大版主的名字
                        String getBigAdminNameSql = "select name from user where id=" + bigAdminID;
                        Statement statement1 = connectDB.getState();
                        ResultSet resultSet = statement1.executeQuery(getBigAdminNameSql);
                        out.print("<h3>" + name + "</h3>");
                        if (resultSet.first()) {
                            String bigAdminName = resultSet.getString("name");
                            out.print("<p>版主:<a href='#'>"+bigAdminName+"<a/></p>");
                        }
                        out.print("\r\n");
                        out.println("</div>");
                        //-----------------下面数据库获取小版块标题
                        String getSmallbanSql = "select id,name,descript from smallbankuai where parentID=" + bigbanId;
                        Statement statement5 = connectDB.getState();
                        ResultSet resultSmallban = statement5.executeQuery(getSmallbanSql);
                        while (resultSmallban.next()) {
                            int smallId = resultSmallban.getInt("id");
                            String smallbanName = resultSmallban.getString("name");
                            String smallbanDescript = resultSmallban.getString("descript");
                            //-----------------------下面写html--关于小版块
                            out.println("<div class=\"content-content\">");
                            out.println("<a href=\"/div?id="+smallId+"\">");
                            out.println("<div>");
                            out.println("<h4>" + smallbanName + "</h4>");
                            out.println("<p>" + smallbanDescript + "</p>");
                            //----------数据库查找版主
                            String smallAdminSql = "select adminID from power where banID="+smallId;
                            //----------------------读出小版主
                            Statement statement2 = connectDB.getState();
                            //--------------获取小版主ID
                            ResultSet smallAdminResult = statement2.executeQuery(smallAdminSql);
                            Statement statement3 = connectDB.getState();
                            out.print("<p>版主:<span>");
                            while (smallAdminResult.next()){
                                //----------------------通过ID获取小版主的名字
                                int adminID = smallAdminResult.getInt("adminID");
                                String adminNameSql = "select name from user where id="+adminID;
                                ResultSet getAdminName = statement3.executeQuery(adminNameSql);
                                if(getAdminName.first()){
                                    String adminName = getAdminName.getString("name");
                                    out.print(adminName+" ");
                                }
                            }
                            out.print("</span></p>");
                            out.println("</div>");
                            out.println("</a>");
                            out.println("</div>");
                        }
                        out.println("</div>");
                    }
                } catch (SQLException ex) {
                    ex.getStackTrace();
                }
                connectDB.closeDB();
            %>
        </div>
    </div>
</div>


<!-- 这个是弹出登录框 -->
<div id="login-div">
    <div class="login-main-div">
        <form method="post" action="login" name="login-form">
            <ul class="login-main-ul">
                <li><img src="${pageContext.request.contextPath}/images/close.png" width="20px" onclick="hideLogin()"/></li>
                <li><p>登录</p></li>
                <li>昵称:<input type="text" name="name"/></li>
                <li>密码:<input type="password" name="password"/></li>
                <li>
                    <input type="submit" id="login-submit" onclick="return submitLogin()" value="登陆"/>
                </li>
            </ul>
        </form>
        <div class="toast"></div>
    </div>
</div>
<div id="register-div">
    <div class="login-main-div">
        <form method="post" action="register" name="register-form">
            <ul class="login-main-ul">
                <li><img src="${pageContext.request.contextPath}/images/close.png" width="20px" onclick="hideLogin()"/></li>
                <li><p>注册</p></li>
                <li>昵称:<input type="text" name="name" placeholder="不小于两位"/></li>
                <li>密码:<input type="password" name="password" placeholder="不小于6位"/></li>
                <li>邮箱:<input type="text" name="email"/></li>
                <li>
                    <input type="submit" id="register-submit" onclick="return submitRegister()" value="注册"/>
                </li>
            </ul>
        </form>
        <div class="toast"></div>
    </div>
</div>
<div id="foot">

</div>
</body>
</html>
