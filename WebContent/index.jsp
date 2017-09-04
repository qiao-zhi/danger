<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>yorge的用户管理</title>

    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="bs/js/bootstrap.js"></script>
    <link rel="stylesheet" href="bs/css/bootstrap.css"/>

    <!--分页-->
    <link rel="stylesheet" type="text/css" href="controls/easyUI/themes/default/easyui.css"/>
    <link rel="stylesheet" href="controls/easyUI/easyui-lang-zh_CN.js"/>
    <link rel="stylesheet" href="controls/easyUI/themes/icon.css"/>
    <script type="text/javascript" src="controls/easyUI/jquery.easyui.min.js"></script>

    <link rel="stylesheet" href="css/public/indexpublic_style.css"/>

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

    <!--箭头-->
    <style>
        #heading1{
            position:relative;
        }
        #leftArrow{
            width:25px;
            position:absolute;
            top:0;
            right:0;
        }
        #rightArrow{
            position:absolute;
            width:25px;
            top:50px;
            left:0;
        }
        #leftArrow:hover,#rightArrow:hover{
            box-shadow: 0 1px 3px #c33d19;
            border:1px solid orangered;
        }
    </style>
</head>

<body>
<!--头-->
<div id="el_header">
    <div id="el_headerLeftLogo">
        屯兰矿安全隐患排查管理系统
    </div>
    <img src="image/rightArrow.png" id="rightArrow"/>
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

<!--中部-->
<div class="html_middle">

    <!--放菜单-->
    <div class="el_left">
        <!--左边索引模块-->
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

            <!--隐患管理-->
            <div class="panel panel-default el_bigMenu" value="0">
                <div class="panel-heading" role="tab" id="heading1">
                    <img src="image/leftArrow.png" id="leftArrow"/>
                    <a role="button" data-toggle="collapse" data-parent="#accordion"
                       href="#collapse1" aria-expanded="true" aria-controls="collapse1" class="el_title">
                        隐患管理
                    </a>
                </div>
                <div id="collapse1" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading1">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a id="#hdInsert" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                隐患录入
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#handle" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                现场处理
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#hdfour" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                隐患四定
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#hdtrace" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                隐患跟踪
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#hdReview" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                隐患复查
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#hdQuery" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                隐患查询
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#hdDayReport" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                隐患日报
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#hdStatistic" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                隐患统计
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#hdMonthReport" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                隐患月报
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#queryUser5" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                隐患分类
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#queryUser6" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                短信提醒
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

            <!--系统管理-->
            <div class="panel panel-default el_bigMenu" value="1">
                <div class="panel-heading" role="tab" id="heading2">
                    <a role="button" data-toggle="collapse" data-parent="#accordion"
                       href="#collapse2" aria-expanded="true" aria-controls="collapse2" class="el_title">
                        系统管理
                    </a>
                </div>
                <div id="collapse2" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="heading2">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <a id="#departManage" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                机构管理
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#users" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                用户管理
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#dictionary" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                字典管理
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a id="#authority" class="towmenu" aria-controls="profile" role="tab" data-toggle="tab">
                                查看权限
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>

    <!-- 菜单，跳转到iframe的js -->
    <script>
        $(".towmenu").click(function () {
            var towmenuId = $(this).prop("id");
            towmenuId = towmenuId.substring(1);
            var onemenuValue= $(this).parents(".el_bigMenu").attr("value");
            if(onemenuValue == 0) {
                $(".el_right").prop("src", "hdmanageJSP/" + towmenuId + ".jsp");
            }
            if(onemenuValue == 1) {
                $(".el_right").prop("src", "systemManageJSP/" + towmenuId + ".jsp");
            }
        })

        
        /*菜单隐藏功能*/
        $("#rightArrow").hide();
        $("#leftArrow").click(function () {
            $(".el_left").hide();
            $(".el_right").css("width","100%");
            $("#rightArrow").show();
            //$(".el_left").animate({width: '-20'});
        })
        $("#rightArrow").click(function () {
            $(".el_left").show();
            $(".el_right").css("width","90%");
            $("#rightArrow").hide();
        })

    </script>

    <!--放主界面内容-->
    <iframe src="hdmanageJSP/hdfour.jsp" class="el_right"></iframe>

</div>

<!--放脚-->
<footer class="footer">
    <div class="center">Copyright © 2017-2018   All Rights Reserved. &nbsp;&nbsp;屯兰矿安全隐患排查管理系统   &nbsp;&nbsp; 技术支持联系方式：0351-6998011</div>
    <div class="center">版权所有 备案证号：晋ICP备050024564号</div>
</footer>
</body>
</html>