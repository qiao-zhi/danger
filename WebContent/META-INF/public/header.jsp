<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%String path = request.getContextPath();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>头</title>

    <link rel="stylesheet" href="<%=path %>/css/public/header.css"/>

    <!--时钟-->
    <script>
        /*获得系统当前时间*/
        $(function () {
            var d = new Date(), str = '';
            str += d.getFullYear() + '年'; //获取当前年份
            str += d.getMonth() + 1 + '月'; //获取当前月份（0——11）
            str += d.getDate() + '日' + ' ';
            str += d.getHours() + '时';
            str += d.getMinutes() + '分';
            str += d.getSeconds() + '秒';
            $("#time").html(str);

            function current() {
                var d = new Date(), str = '';
                str += d.getFullYear() + '年'; //获取当前年份
                str += d.getMonth() + 1 + '月'; //获取当前月份（0——11）
                str += d.getDate() + '日' + ' ';
                str += d.getHours() + '时';
                str += d.getMinutes() + '分';
                str += d.getSeconds() + '秒';
                return str;
            }

            setInterval(function () {
                $("#time").html(current)
            }, 1000);
        });
    </script>

</head>

<body>
<!--头-->
<div id="el_header">
    <div id="el_headerLeftLogo">
        屯兰矿安全隐患排查管理系统
    </div>
    <div id="el_headerRightinfo">
        <div id="el_systemTime">
            <P id="time"></P>
        </div>

        <div id="el_opration">
            <ul>
                <li>
                    <img src="" width="15" alt="">
                    <span>欢迎：</span>
                    <span id="el_currentUser">系统管理员</span>
                </li>
                <li>
                    <span>修改密码</span>
                </li>
                <li>
                    <span>退出系统</span>
                </li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>