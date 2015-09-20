/**
 * Created by chao on 2015/9/18.
 * 主页用的js
 */


function submitRegister(){
    if(!checkEmpty(1)){
        return false;
    }
    var xhr = new XMLHttpRequest();
    var url = "/register";
    var subButton = document.getElementById("register-submit");
    var loginToast = document.getElementsByClassName("toast").item(1);
    var name = document.forms["register-form"].elements["name"].value;
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            subButton.disabled = false;
            subButton.value = "注册";
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
                //返回成功
                var getStr = xhr.responseText;
                if (getStr == "true") {
                    loginToast.innerText = "注册成功";
                    setTimeout(hideLogin,700);
                    var loginUl = document.getElementsByClassName("login-ul").item(0);
                    loginUl.innerHTML = "<a href='/user'><li>"+name+"</li></a>";
                }else if(getStr == "exist"){
                    loginToast.innerText = "用户名已存在";
                } else if (getStr == "false") {
                    loginToast.innerText = "注册失败";
                } else {
                    loginToast.innerText = "异常";
                }
            } else {
                loginToast.innerText = "服务器异常代码:"+xhr.status;
            }
            loginToast.style.display = 'block';
        }
    };
    xhr.open("post",url,true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    var registerForm = document.getElementsByName("register-form").item(0);
    xhr.send(serialize(registerForm));
    subButton.value = "正在注册..";
    subButton.disabled = true;
    return false;
}
function submitLogin(){
    if(!checkEmpty(0)){
        return false;
    }
    var xhr = new XMLHttpRequest();
    var loginButton = document.getElementById("login-submit");
    var loginToast = document.getElementsByClassName("toast").item(0);
    var name = document.forms["login-form"].elements["name"].value;
    xhr.onreadystatechange = function(){
        if(xhr.readyState==4){
            loginButton.value = "登陆";
            loginButton.disabled = false;
            //获取结果成功
            if ((xhr.status >= 200 && xhr.status < 300) || xhr.status == 304) {
                var result = xhr.responseText;
                if(result=="true"){
                    //登陆成功
                    loginToast.innerText="登陆成功";
                    setTimeout(hideLogin,700);
                    //登陆成功之后把登陆按钮变成用户名
                    var loginUl = document.getElementsByClassName("login-ul").item(0);
                    loginUl.innerHTML = "<a href='/user'><li>"+name+"</li></a>";
                }else if(result=="false"){
                    //登陆失败
                    loginToast.innerText="用户名或密码错误";
                }else if(result=="null"){
                    //登陆异常
                    loginToast.innerText="登陆异常";
                }
            }else{
                loginToast.innerText="服务器异常代码:"+xhr.status;
            }
            loginToast.style.display = 'block';
        }
    };
    var loginForm = document.getElementsByName("login-form").item(0);
    var url = "/login";
    xhr.open("post",url,true);
    xhr.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
    xhr.send(serialize(loginForm));
    loginButton.value = "正在登陆..";
    loginButton.disabled = true;
    return false;
}

var timer = null;
function animation(element,location,x,time){
    //计算每一次走多远，用线性方法
    var x2;
    switch (location){
        case 0:
            //left
            x2 = element.offsetLeft;
            break;
        case 1:
            //top
            x2 = element.offsetTop;
            break;
        case 2:
            //right
            break;
        case 3:
            //bottom
            break;
    }
    var leng = x-x2;
    var per = leng/time;
    //走多少步
    var step = time/(1000/25.0);
    //每一步走多远
    var everyLen = leng/step;
    //走每一步的时间
    var everyTime = 1000/25.0;
    timer = setInterval(function () {
        switch (location) {
            case 0:
                //left
                element.style.left = element.offsetLeft + everyLen;
                if (leng > 0) {
                    if (element.offsetLeft >= x) {
                        clearInterval(timer);
                    }
                }else if(leng<0){
                    if(element.offsetLeft<=x){
                        clearInterval(timer);
                    }
                }else{
                    clearInterval(timer);
                }
                break;
            case 1:
                //top
                element.style.top = element.offsetTop+everyLen;
                if (leng > 0) {
                    if (element.offsetTop >= x) {
                        clearInterval(timer);
                    }
                }else if(leng<0){
                    if(element.offsetTop<=x){
                        clearInterval(timer);
                    }
                }else{
                    clearInterval(timer);
                }
                break;
            case 2:
                //right
                break;
            case 3:
                //bottom
                break;
            default :
                break;
        }
    },everyTime);
}

//---------------用来显示登陆和注册窗口的方法
function loginDisplay(a){
    if(a==1) {
        var registerDiv = document.getElementById("register-div");
        if(registerDiv.style.display=='block'){
            registerDiv.style.display='none';
        }
        var loginDiv = document.getElementById("login-div");
        loginDiv.style.display = 'block';
    }
}
function registerDisplay(a){
    if(a==1) {
        var loginDiv = document.getElementById("login-div");
        if(loginDiv.style.display=='block'){
            loginDiv.style.display='none';
        }
        var registerDiv = document.getElementById("register-div");
        registerDiv.style.display = 'block';
    }
}
//--------用来隐藏登陆和注册窗口的方法
function hideLogin() {
    var loginDiv = document.getElementById("login-div");
    var registerDiv = document.getElementById("register-div");
    var loginToast = document.getElementsByClassName("toast");
    for (var i = 0; i < loginToast.length; i++) {
        loginToast[i].style.display = 'none';
        loginToast[i].innerText = "";
    }
    loginDiv.style.display = 'none';
    registerDiv.style.display = 'none';
}
//------检查登陆和注册窗口内输入是否为空的方法,其中的a参数代表1表示注册窗口检测，0表示登陆窗口检测
function checkEmpty(a){
    if(a==0) {
        var loginForm = document.forms["login-form"];
        var name = loginForm.elements["name"].value;
        var password = loginForm.elements["password"].value;
        if (name==""||name.length<2) {
            alert("用户名有误");
            return false;
        }
        if(password.value==""||password.length<6){
            alert("密码格式有误");
            return false;
        }
        return true;
    }
    if(a==1){
        var register = document.forms["register-form"];
        var name = register.elements["name"].value;
        var password = register.elements["password"].value;
        var email = register.elements["email"].value;
        if(name==""||name.length<2){
            alert("用户名格式有误");
            return false;
        }
        if(password==""||password.length<6){
            alert("密码格式有误");
            return false;
        }
        if(email==""||email.indexOf('@')==-1){
            alert("邮箱输入有误");
            return false;
        }
        return true;
    }
}

//----------表单序列化函数
function serialize(form) {
    var parts = [],
        field = null,
        i,
        len,
        j,
        optLen,
        option,
        optValue;

    for (i = 0, len = form.elements.length; i < len; i++) {
        field = form.elements[i];

        switch (field.type) {
            case "select-one":
            case "select-multiple":

                if (field.name.length) {
                    for (j = 0, optLen = field.options.length; j < optLen; j++) {
                        option = field.options[j];
                        if (option.selected) {
                            optValue = "";
                            if (option.hasAttribute) {
                                optValue = (option.hasAttribute("value") ? option.value : option.text);
                            } else {
                                optValue = (option.attributes["value"].specified ? option.value : option.text);
                            }
                            parts.push(encodeURIComponent(field.name) + "=" + encodeURIComponent(optValue));
                        }
                    }
                }
                break;

            case undefined:
            //字段集
            case "file":
            //文件输入
            case "submit":
            //提交按钮
            case "reset":
            //重置按钮
            case "button":
                //自定义按钮
                break;

            case "radio":
            //单选按钮
            case "checkbox":
                //复选框
                if (!field.checked) {
                    break;
                }
            /* 执行默认操作 */

            default:
                //不包含没有名字的表单字段
                if (field.name.length) {
                    parts.push(encodeURIComponent(field.name) + "=" + encodeURIComponent(field.value));
                }
        }
    }
    return parts.join("&");
}