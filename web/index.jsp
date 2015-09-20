<%--
 主页jsp
 --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>郑大园</title>
    <link type="text/css" rel="stylesheet" href="/css/index-style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/head.css"/>
    <script src="/js/index-js.js"></script>
</head>
<body>
<%@include file="include/head.jsp"%>
<div id="content-main">
    <div id="content-first">
        <h3>最新帖子</h3>

        <p>今天捡到一个钱包</p>

        <p>天气真棒</p>

        <p>啦啦啦，德玛西亚</p>

        <p>今天捡到一个钱包</p>

        <p>天气真棒</p>

        <p>啦啦啦，德玛西亚</p>

        <p>今天捡到一个钱包</p>

        <p>天气真棒</p>

        <p>啦啦啦，德玛西亚</p>

        <p>今天捡到一个钱包</p>

        <p>天气真棒</p>

        <p>啦啦啦，德玛西亚</p>

        <p>今天捡到一个钱包</p>

        <p>天气真棒</p>

        <p>啦啦啦，德玛西亚</p>
    </div>
    <div id="content-right">
        <div id="content-second">
            <h3>图文</h3>

            <div>
                top
            </div>
            <div>
                bottom
            </div>
        </div>
        <div id="content-third">
            <div>
                <h3>精华帖</h3>

                <p>今天捡到一个钱包</p>

                <p>天气真棒</p>

                <p>啦啦啦，德玛西亚</p>
            </div>
            <div>
                <h3>热帖</h3>

                <p>今天捡到一个钱包</p>

                <p>天气真棒</p>

                <p>啦啦啦，德玛西亚</p>
            </div>
        </div>
    </div>
</div>

<!-- 这个是弹出登录框 -->
<div id="login-div">
    <div class="login-main-div">
        <form method="post" action="login" name="login-form">
            <ul class="login-main-ul">
                <li><img src="/images/close.png" width="20px" onclick="hideLogin()"/></li>
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
                <li><img src="/images/close.png" width="20px" onclick="hideLogin()"/></li>
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
</body>
</html>
