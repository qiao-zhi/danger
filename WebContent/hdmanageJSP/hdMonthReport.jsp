<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>隐患月报</title>

    <link rel="stylesheet" href="../bs/css/bootstrap.css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../bs/js/bootstrap.js"></script>

    <!--分页-->
    <link rel="stylesheet" type="text/css" href="../controls/easyUI/themes/default/easyui.css"/>
    <link rel="stylesheet" href="../controls/easyUI/easyui-lang-zh_CN.js"/>
    <link rel="stylesheet" href="../controls/easyUI/themes/icon.css"/>
    <script type="text/javascript" src="../controls/easyUI/jquery.easyui.min.js"></script>

    <!--下拉树-->
    <link rel="stylesheet" href="../controls/selectDropTree/demo.css" type="text/css">
    <link rel="stylesheet" href="../controls/selectDropTree/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="../controls/selectDropTree/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="../controls/selectDropTree/jquery.ztree.excheck.js"></script>
    <!--索引中选择部门-->
    <script type="text/javascript">
        var setting2 = {
            view: {
                selectedMulti: false
            },
            check: {
                enable: true,
                chkStyle: "radio",
                radioType: "all"
            },
            data: {
                simpleData: {
                    enable: true
                }
            },
            callback: {
                onCheck: onCheck
            }
        };

        var zNodes2 = [
            {id: 1, pId: 0, name: "随意勾选 1", open: true},
            {id: 11, pId: 1, name: "无 radio 1-1", nocheck: true},
            {id: 12, pId: 1, name: "随意勾选 1-2", open: true},
            {id: 121, pId: 12, name: "随意勾选 1-2-1"},
            {id: 122, pId: 12, name: "随意勾选 1-2-2"},
            {id: 123, pId: 12, name: "无 radio 1-2-3", nocheck: true},
            {id: 13, pId: 1, name: "随意勾选 1-3"},
            {id: 2, pId: 0, name: "禁止勾选 2", open: true},
            {id: 21, pId: 2, name: "禁止勾选 2-1", doCheck: false},
            {id: 22, pId: 2, name: "禁止勾选 2-2", open: true},
            {id: 221, pId: 22, name: "禁止勾选 2-2-1"},
            {id: 222, pId: 22, name: "禁止勾选 2-2-2", doCheck: false},
            {id: 223, pId: 22, name: "禁止勾选 2-2-3", doCheck: false},
            {id: 23, pId: 2, name: "禁止勾选 2-3", doCheck: false}
        ];

        var code, log, className = "dark";

        function onCheck(e, treeId, treeNode) {
            showLog(treeNode.name);
        }

        function showLog(str) {
            if (!log) log = $("#log");
            /*清空内部的东西*/
            if ($("#log > li").length > 0) {
                $("#log").children("li").remove();
            }
            log.append("<li class='" + className + "'>" + str + "</li>");

            /*判断是否插入进入，若插入进入，关闭树框*/
            if ($("#log > li").length > 0) {
                $("#treeDemo2").hide();
            }
        }

        function checkNode(e) {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo2"),
                type = e.data.type,
                nodes = zTree.getSelectedNodes();
            if (type.indexOf("All") < 0 && nodes.length == 0) {
                alert("请先选择一个节点");
            }

            if (type == "checkAllTrue") {
                zTree.checkAllNodes(true);
            } else if (type == "checkAllFalse") {
                zTree.checkAllNodes(false);
            } else {
                var callbackFlag = $("#callbackTrigger").attr("checked");
                for (var i = 0, l = nodes.length; i < l; i++) {
                    if (type == "checkTrue") {
                        zTree.checkNode(nodes[i], true, null, callbackFlag);
                    } else if (type == "checkFalse") {
                        zTree.checkNode(nodes[i], false, null, callbackFlag);
                    } else if (type == "checkTruePS") {
                        zTree.checkNode(nodes[i], true, true, callbackFlag);
                    } else if (type == "checkFalsePS") {
                        zTree.checkNode(nodes[i], false, true, callbackFlag);
                    }
                }
            }
        }

        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo2"), setting2, zNodes2);
            $("#checkTrue").bind("click", {type: "checkTrue"}, checkNode);
            $("#checkFalse").bind("click", {type: "checkFalse"}, checkNode);

            $("#treeDemo2").hide();
            $("#log").click(function () {
                $('#treeDemo2').toggle();
            })
        });
    </script>

    <!--日历-->
    <link rel="stylesheet" href="../controls/calendar/pikaday.css">
    <script src="../controls/calendar/pikaday.js"></script>

    <!--年月-->
    <script src="../controls/calendar/yearMonth/SimpleCanleder.js"></script>
    <link href="../controls/calendar/yearMonth/SimpleCanleder.css" rel="stylesheet">

    <link rel="stylesheet" href="../css/public/public_style.css"/>

    <!--选择树-->
    <style>
        #treeDemo2 {
            width: 215px;
            overflow: visible;
            padding: 10px;
            height: auto;
            position: absolute;
            top: 14px;
            border: 1px solid #ccc;
            z-index: 100;
        }

        /*单选*/
        #log {
            background-color: white;
            height: 25px;
            width: 100%;
            border-color: rgb(204, 204, 204);
            border-radius: 0 3px 3px 0;
            padding-left: 10px;
            padding-top: 2px;
            box-shadow: 0 1px 1px #eee inset;
        }

        #log:active {
            border-color: #66afe9;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
        }

        #log li {
            background-color: white;
        }
    </style>

    <!--日期-->
    <style>
        #datepicker{
            position:absolute;
            top:0;
            left:200px;
        }
        #datepicker2,#datepicker{
            width:100px;
        }
        .el_spans2{
            position:relative;
            bottom:5px;
            left:4px;
        }
        #tableDiv{
            width:100%;
            overflow-x: scroll;
        }
        #table{
            min-width:1500px;
            max-width:200%;
            width:150%;
        }
    </style>

    <!--选择树-->
    <style>
        #treeDemo2 {
            width: 215px;
            overflow: visible;
            padding: 10px;
            height: auto;
            position: absolute;
            top: 14px;
            border: 1px solid #ccc;
            z-index: 100;
        }

        /*单选*/
        #log {
            background-color: white;
            height: 25px;
            width: 100%;
            border-color: rgb(204, 204, 204);
            border-radius: 0 3px 3px 0;
            padding-left: 10px;
            padding-top: 2px;
            box-shadow: 0 1px 1px #eee inset;
        }

        #log:active {
            border-color: #66afe9;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px rgba(102, 175, 233, .6);
        }

        #log li {
            background-color: white;
            padding:0;
            height:20px;
            line-height:20px;
        }
    </style>

</head>
<body>

<div class="container-fluid">
    <div class="panel panel-default">
        <!--菜单连接标题-->
        <div class="el_stairTitle">
            <span>隐患管理 </span><span>> 隐患月报</span>
        </div>

        <div class="panel-body el_main">

            <!--内容-->
            <div class=" col-md-12">

                <!--索引-->
                <div class="row el_queryBox">
                    <form action="">
                        <div class="row el_queryBoxrow">

                            <div class="col-md-3 el_qlmQuery el_qlmQuery2">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans el_spans2">时间：</span>
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
                                        $("#datepicker2").val("选择时间");
                                    </script>
                                    <span class="el_spans2">&nbsp;&nbsp;到</span>
                                    <input type="text" id="datepicker" class="form-control el_modelinput"/>
                                    <script type="text/javascript">
                                        var picker = new Pikaday(
                                            {
                                                field: document.getElementById('datepicker'),
                                                firstDay: 1,
                                                minDate: new Date('1995-01-01'),
                                                maxDate: new Date('2050-12-31'),
                                                yearRange: [1995, 2050]
                                            });
                                        $("#datepicker").val("选择时间");
                                    </script>
                                </div>
                            </div>

                            <div class="col-md-3 el_qlmQuery">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans">责任单位：</span>
                                    <select class="selectpicker form-control" title="请选择">
                                        <option>--请选择--</option>
                                        <option>全部</option>
                                        <option>开掘</option>
                                        <option>其他</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-3 el_qlmQuery">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans el_chooseSpan">检查单位：</span>
                                    <ul id="log" class="el_modelinput el_chooseInput log"></ul>
                                    <img src="../controls/selectDropTree/smallTriangle.png" class="el_smallTriangle"
                                         width="7"/>
                                    <ul id="treeDemo2" class="ztree"></ul>
                                </div>
                            </div>

                        </div>

                        <!--提交查询按钮-->
                        <button type="submit" class="btn btn-default el_queryButton btn-sm">查询</button>
                    </form>

                </div>   <!--结束 查询表单提交-->

                <!--显示内容-->
                <div class="panel panel-default el_Mainmain">

                    <!--按钮面板-->
                    <div class="panel-body">

                        <div class="panel panel-default">
                            <div class="panel-body el_MainxiaoMain">

                                <div class="el_topButton">
                                    <!-- 按钮触发模态框1-->
                                    <div class="col-md-2">
                                        <a style="text-decoration:none;color:white;" href="addExam.html">
                                            <button class="btn btn-primary">
                                                导出
                                            </button>
                                        </a>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!--表格
                            内容都提取到json里边
                        -->
                        <div id="tableDiv">
                        <table class="table table-hover table-bordered" id="table">
                            <thead>
                            <th>序号</th>
                            <th>检查日期</th>
                            <th>检查单位</th>
                            <th>地点</th>
                            <th>类别</th>
                            <th>级别</th>
                            <th>状态</th>
                            <th width="300">隐患内容</th>
                            <th>责任单位</th>
                            <th>四定措施</th>
                            <th>四定时间</th>
                            <th>责任单位负责人</th>
                            <th>复查时间</th>
                            <th>复查人</th>
                            <th>复查结果</th>
                            <th>分管部门</th>
                            <th>消号事件</th>
                            <th>隐患问题</th>
                            <th>矿外委</th>
                            <th width="300">形成原因</th>
                            <th>分管负责人</th>
                            <th>罚款</th>
                            <th>扩建负责人</th>
                            <th>罚款</th>
                            <th>责任负责人</th>
                            <th>罚款</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>2017-12-10</td>
                                <td>****d单位</td>
                                <td>****厂</td>
                                <td>安全设施</td>
                                <td>C</td>
                                <td>已整改</td>
                                <td>道超过通风距离道超过通风距离道超过通风距
                                    离道超过通风距离道超过通风距离道超过通风距离</td>
                                <td>****d单位</td>
                                <td>****二队</td>
                                <td>已处理</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>2017-12-10</td>
                                <td>张子高</td>
                                <td>****d单位</td>
                                <td>2017-12-10</td>
                                <td>问题</td>
                                <td>问题</td>
                                <td>道超过通风距离道超过通风距离道超过通
                                    风距离道超过通风距离道超过通风距
                                </td>
                                <td>张子高</td>
                                <td>0</td>
                                <td>张子高</td>
                                <td>0</td>
                                <td>张子高</td>
                                <td>0</td>
                            </tr>

                            </tbody>
                        </table>
                        </div>
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