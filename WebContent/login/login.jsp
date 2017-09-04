<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>登录模板</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="../js/jquery-1.11.js"></script>
    <script type="text/javascript" src="../controls/login/js/login.js"></script>
    <script type="text/javascript" src="../controls/login/js/gVerify.js"></script>
    <link href="../controls/login/css/login2.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<h1>隐患排查系统登录<sup>V2017</sup></h1>

<div class="login">
    <!--头部-->
    <div class="header">
        <div class="switch" id="switch">系统登录</div>
    </div>

    <div class="web_qr_login" id="web_qr_login">

        <!--登录-->
        <div class="web_login" id="web_login">

            <div class="login-box">

                <div class="login_form">
                    <form action="" name="loginform" accept-charset="utf-8" id="login_form" class="loginForm"
                          method="post"><input type="hidden" name="did" value="0"/>
                        <input type="hidden" name="to" value="log"/>
                        <div class="uinArea" id="uinArea">
                            <label class="input-tips" for="u">帐 &nbsp;号：</label>
                            <div class="inputOuter" id="uArea">
                                <input type="text" id="u" name="username" class="inputstyle"/>
                            </div>
                        </div>
                        <!--密码-->
                        <div class="pwdArea" id="pwdArea">
                            <label class="input-tips" for="p">密 &nbsp;码：</label>
                            <div class="inputOuter" id="pArea">
                                <input type="password" id="p" name="p" class="inputstyle"/>
                            </div>
                        </div>
                        <!--验证码-->
                        <div class="yzmArea" id="verifyArea">
                            <label class="input-tips" for="code_input">验证码：</label>
                            <div class="inputOuter" id="yArea">
                                <input type="text" id="code_input" name="y" class="inputstyle"/>
                                <div id="v_container"></div>
                            </div>
                        </div>
                        <!--登录按钮-->

                        <div id="loginbuttondiv" class="inputOuter">
                            <input type="submit" value="登 录" class="button_blue" id="my_button"/>
                        </div>
                    </form>
                </div>

            </div>

        </div>
        <!--登录end-->
    </div>
</div>

</body>
<script>
    var verifyCode = new GVerify("v_container");

    document.getElementById("my_button").onclick = function () {
        var res = verifyCode.validate(document.getElementById("code_input").value);
        if (res) {
            alert("验证码正确");
        } else {
            alert("验证码错误");
        }
    }
</script>
</html>