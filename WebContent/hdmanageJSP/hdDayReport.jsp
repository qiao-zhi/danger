<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>隐患日报</title>

    <link rel="stylesheet" href="../bs/css/bootstrap.css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../bs/js/bootstrap.js"></script>

    <!--分页-->
    <link rel="stylesheet" type="text/css" href="../controls/easyUI/themes/default/easyui.css"/>
    <link rel="stylesheet" href="../controls/easyUI/easyui-lang-zh_CN.js"/>
    <link rel="stylesheet" href="../controls/easyUI/themes/icon.css"/>
    <script type="text/javascript" src="../controls/easyUI/jquery.easyui.min.js"></script>

    <!--日历-->
    <link rel="stylesheet" href="../controls/calendar/pikaday.css">
    <script src="../controls/calendar/pikaday.js"></script>

    <link rel="stylesheet" href="../css/public/public_style.css"/>

</head>
<body>

<div class="container-fluid">
    <div class="panel panel-default">
        <!--菜单连接标题-->
        <div class="el_stairTitle">
            <span>隐患管理 </span><span>> 隐患日报</span>
        </div>

        <div class="panel-body el_main">

            <!--内容-->
            <div class=" col-md-12">

                <!--索引-->
                <div class="row el_queryBox">
                    <form action="">
                        <div class="row el_queryBoxrow">

                            <div class="col-md-3 el_qlmQuery">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans">日期：</span>
                                    <input type="text" id="datepicker2" class="form-control el_modelinput"/>
                                    <script type="text/javascript">
                                        var picker = new Pikaday(
                                            {
                                                field: document.getElementById('datepicker2'),
                                                firstDay: 1,
                                                minDate: new Date('1995-01-01'),
                                                maxDate: new Date('2050-12-31'),
                                                yearRange: [1995, 2050]
                                            });
                                        $("#datepicker2").val("请填写整改时间");
                                    </script>
                                </div>
                            </div>

                        </div>

                        <!--提交查询按钮-->
                        <button type="submit" class="btn btn-default el_queryButton btn-sm">查询</button>
                    </form>

                </div>   <!--结束 查询表单提交-->

                <!--显示内容-->
                <div class="panel panel-default el_Mainmain">

                    <div class="el_ReportTime">
                        <span>时间：</span>
                        <span>2014-12-15</span>
                    </div>

                    <!--按钮面板-->
                    <div class="panel-body">

                        <!--表格
                            内容都提取到json里边
                        -->
                        <table class="table table-hover table-bordered">
                            <thead>
                            <th>责任单位</th>
                            <th>序号</th>
                            <th>存在的隐患问题</th>
                            <th>隐患类型</th>
                            <th>级别</th>
                            <th>隐患发现人</th>
                            <th>解决时间</th>
                            <th>负责人</th>
                            <th>督办人</th>
                            <th>复查时间</th>
                            <th>复查人</th>
                            <th>是否消号</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td rowspan="2">综采一队</td>
                                <td>1</td>
                                <td>道超过通风距离</td>
                                <td>机电</td>
                                <td>C</td>
                                <td>张子高</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>张子高</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>否</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>道超过通风距离</td>
                                <td>机电</td>
                                <td>C</td>
                                <td>张子高</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>张子高</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>否</td>
                            </tr>

                            <tr>
                                <td rowspan="2">综采二队</td>
                                <td>1</td>
                                <td>道超过通风距离</td>
                                <td>机电</td>
                                <td>C</td>
                                <td>张子高</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>张子高</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>否</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>道超过通风距离</td>
                                <td>机电</td>
                                <td>C</td>
                                <td>张子高</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>张子高</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>否</td>
                            </tr>

                            </tbody>
                        </table>

                        <div id="paginationIDU"></div>
                        <script>
                            $('#paginationIDU').pagination({
                                //			组件属性
                                "total": 1000,//数字 当分页建立时设置记录的总数量 1
                                "pageSize": 10,//数字 每一页显示的数量 10
                                "pageNumber": 1,//数字 当分页建立时，显示的页数 1
                                "pageList": [10, 20],//数组 用户可以修改每一页的大小，
                                //功能
                                "layout": ['list', 'sep', 'first', 'prev', 'manual', 'next', 'last', 'links'],
                                "onSelectPage": function (pageNumber, b) {
                                    alert("pageNumber=" + pageNumber);
                                    alert("pageSize=" + b);
                                }
                            });
                        </script>

                    </div>
                </div>

            </div>

        </div>
    </div>

</div>
</body>
</html>