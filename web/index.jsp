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
            <div class="content-div">
                <!--小标题-->
                <div class="content-title">
                    <h3>全校交流专区</h3>
                </div>
                <!--内容-->
                <div class="content-content">
                    <a href="#">
                        <div>
                            <h4>院系内交流</h4>
                            <p>同一个院系的童鞋再次聚会</p>
                            <p>版主:<span>小青峰</span></p>
                        </div>
                    </a>
                </div>
            </div>

            <div class="content-div">
                <div class="content-title">
                    <h3>学习交流</h3>
                </div>
                <div class="content-content">
                    <div>
                        <h4>院系内交流</h4>
                        <p>同一个院系的童鞋再次聚会</p>
                    </div>
                    <div>
                        <h4>院系内交流</h4>
                        <p>同一个院系的童鞋再次聚会</p>
                    </div>

                    <div>
                        <h4>院系内交流</h4>
                        <p>同一个院系的童鞋再次聚会</p>
                    </div>
                </div>
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
<div id="foot">

</div>
</body>
</html>
