<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>隐患查询</title>

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
    <!--模态框样式-->
    <style>
        .modal .modal-dialog{
            width:80%;
        }
        #el_Export .modal-dialog{
            width:50%;
            min-width:600px;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="panel panel-default">
        <!--菜单连接标题-->
        <div class="el_stairTitle">
            <span>隐患管理 </span><span>> 隐患查询</span>
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
                                    <span class="el_spans el_chooseSpan">检查单位：</span>
                                    <ul id="log" class="el_modelinput el_chooseInput log"></ul>
                                    <img src="../controls/selectDropTree/smallTriangle.png" class="el_smallTriangle"
                                         width="7"/>
                                    <ul id="treeDemo2" class="ztree"></ul>
                                </div>
                            </div>

                            <div class="col-md-3 el_qlmQuery">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans">隐患级别：</span>
                                    <select class="selectpicker form-control" title="请选择">
                                        <option>--请选择--</option>
                                        <option>无</option>
                                        <option>C级</option>
                                        <option>B级</option>
                                        <option>A级</option>
                                    </select>
                                </div>
                            </div>

                            <div class="col-md-3 el_qlmQuery">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans">隐患类型：</span>
                                    <select class="selectpicker form-control" title="请选择">
                                        <option>--请选择--</option>
                                        <option>采煤</option>
                                        <option>开掘</option>
                                        <option>机电</option>
                                        <option>运输</option>
                                        <option>通风</option>
                                        <option>地测</option>
                                        <option>其他</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row el_queryBoxrow">

                            <div class="col-md-3 el_qlmQuery">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans el_chooseSpan">隐患地点：</span>
                                    <input type="text" class="form-control" name=""/>
                                </div>
                            </div>

                            <div class="col-md-3 el_qlmQuery">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans el_chooseSpan">隐患内容：</span>
                                    <input type="text" class="form-control" name=""/>
                                </div>
                            </div>

                            <div class="col-md-3 el_qlmQuery">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans el_chooseSpan">隐患状态：</span>
                                    <select class="selectpicker form-control" title="请选择">
                                        <option>--请选择--</option>
                                        <option>未四定</option>
                                        <option>四定</option>
                                        <option>四定</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="row el_queryBoxrow">
                            <div class="col-md-3 el_qlmQuery">
                                <div class="input-group" role="toolbar">
                                    <span class="el_spans">发现日期：</span>
                                    <input type="text" id="search_begindate" class="form-control"/>
                                    <script type="text/javascript">
                                        $(function () {
                                            $("#search_begindate").simpleCanleder();
                                        });
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

                    <!--按钮面板-->
                    <div class="panel-body">

                        <div class="panel panel-default">
                            <div class="panel-body el_MainxiaoMain">

                                <div class="el_topButton">
                                    <!-- 按钮触发模态框1-->
                                    <div class="col-md-2">
                                            <button class="btn btn-primary" data-toggle="modal" data-target="#el_Export">
                                                导出
                                            </button>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <!--表格
                            内容都提取到json里边
                        -->
                        <table class="table table-hover table-bordered">
                            <thead>
                            <th>序号</th>
                            <th>级别</th>
                            <th>类型</th>
                            <th>责任单位</th>
                            <th>隐患内容</th>
                            <th>问题/隐患</th>
                            <th>检查日期</th>
                            <th>检查单位</th>
                            <th>检查人</th>
                            <th>状态</th>
                            <th width="100">操作</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>C</td>
                                <td>机电</td>
                                <td>安装二队</td>
                                <td>道超过扩散通风距离（实测长约××m、瓦斯浓度×%),未设置栅栏,揭示警标</td>
                                <td>问题</td>
                                <td>2017-8-12</td>
                                <td>机电科</td>
                                <td>张名</td>
                                <td>未四定</td>
                                <td>
                                    <a href="javascript:void(0)" data-toggle="modal" data-target="#el_FourInfo">详情</a>
                                </td>
                            </tr>

                            </tbody>
                        </table>

                        <!-- 模态框 详细信息-->
                        <div class="modal fade" id="el_FourInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">&times;</button><!--关闭符号-->
                                        <!--标题-->
                                        <h3 class="modal-title">安全隐患详情</h3>
                                    </div>
                                    <form>
                                        <div class="modal-body">
                                            <div class="el_parperInfo">
                                                <table>
                                                    <tr>
                                                        <td>检查日期：</td>
                                                        <td>2017-12-10</td>
                                                        <td>检查人：</td>
                                                        <td>张明</td>
                                                    </tr>
                                                    <tr>
                                                        <td>检查单位：</td>
                                                        <td>机电科</td>
                                                        <td>地点：</td>
                                                        <td>1# 工程部</td>
                                                    </tr>
                                                    <tr>
                                                        <td>隐患类型：</td>
                                                        <td>机电</td>
                                                        <td>隐患级别：</td>
                                                        <td>C</td>
                                                    </tr>
                                                    <tr>
                                                        <td>隐患内容：</td>
                                                        <td colspan="3">道超过扩散通风距离（实测长约××m、瓦斯浓度×%),未设置栅栏,揭示警标<</td>
                                                    </tr>
                                                    <tr>
                                                        <td>责任单位：</td>
                                                        <td>安装二队</td>
                                                        <td>责任负责人</td>
                                                        <td>王建</td>
                                                    </tr>
                                                    <tr>
                                                        <td>整改措施：</td>
                                                        <td colspan="3">道超过扩散通风距离（实测长约××m、瓦斯浓度×%),未设置栅栏,揭示警标<</td>
                                                    </tr>
                                                    <tr>
                                                        <td>整改时间：</td>
                                                        <td>2017-12-1</td>
                                                        <td>分管部门</td>
                                                        <td>王建</td>
                                                    </tr>
                                                    <tr>
                                                        <td>复查人：</td>
                                                        <td>分特</td>
                                                        <td>复查结果</td>
                                                        <td>合格</td>
                                                    </tr>
                                                </table>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button type="button" class="btn btn-primary">提交更改</button>
                                        </div>
                                    </form>

                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
                        </div>

                        <!-- 模态框 导出-->
                        <div class="modal fade" id="el_Export" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">&times;</button><!--关闭符号-->
                                        <!--标题-->
                                        <h3 class="modal-title">导出提示</h3>
                                    </div>
                                    <form>
                                        <div class="modal-body">
                                            <span>是否导出当前信息？</span>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                            <button type="button" class="btn btn-primary">提交更改</button>
                                        </div>
                                    </form>

                                </div><!-- /.modal-content -->
                            </div><!-- /.modal -->
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