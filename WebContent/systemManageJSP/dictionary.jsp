<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>字典管理</title>

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
    <!--左边的树-->
    <script>
        var setting5 = {
            data: {
                key: {
                    title: "t"
                },
                simpleData: {
                    enable: true
                }
            },
            callback: {
                beforeClick: beforeClick,
            }
        };


        var zNodes5 = [
            {id: 1, pId: 0, name: "字典列表", t: "我很普通，随便点我吧", open: true},
            {id: 11, pId: 1, name: "叶子节点 - 1", t: "我很普通，随便点我吧"},
            {id: 111, pId: 11, name: "叶子节点 - 1", t: "我很普通，随便点我吧"},
            {id: 112, pId: 11, name: "叶子节点 - 1", t: "我很普通，随便点我吧"},
            {id: 12, pId: 1, name: "叶子节点 - 2"},
            {id: 13, pId: 1, name: "叶子节点 - 3"},
            {id: 2, pId: 0, name: "NB的父节点", open: false},
            {id: 21, pId: 2, name: "叶子节点2 - 1"},
            {id: 22, pId: 2, name: "叶子节点2 - 2"},
            {id: 23, pId: 2, name: "叶子节点2 - 3"},
            {id: 3, pId: 0, name: "郁闷的父节点", open: false},
            {id: 31, pId: 3, name: "叶子节点3 - 1"},
            {id: 32, pId: 3, name: "叶子节点3 - 2"},
            {id: 33, pId: 3, name: "叶子节点3 - 3"}
        ];

        /*选择节点。用与在添加字典是，判断是否有选择节点*/
        var NodeNums = 0;
        var NodeName = 0;
        var className = "dark";
        function beforeClick(treeId, treeNode, clickFlag) {
            className = (className === "dark" ? "" : "dark");
            //节点名：
            NodeName = treeNode.name
            NodeNums++;//用于添加字典
            return (treeNode.click != false);
        }

        $(document).ready(function () {
            $.fn.zTree.init($("#treeDemo"), setting5, zNodes5);
        });
    </script>
    <!--修改模态框中的上级字典-->
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

        var log, className = "dark";

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

    <link rel="stylesheet" href="../css/public/public_style.css"/>

    <!--选择树-->
    <style>
        /*选择角色,选择部门,配置角色*/
        #treeDemo2 {
            width: 310px;
            overflow: visible;
            padding: 10px;
            height: auto;
            position: absolute;
            top: 14px;
            border: 1px solid #ccc;
            z-index: 100;
        }
        .el_smallTriangle {
            right: 117px;
            top: 14px;
            width:8px;
        }
        /*单选*/
        #log {
            background-color: white;
            height: 34px;
            width: 350px;
            border-color: rgb(204, 204, 204);
            border-radius: 0 3px 3px 0;
            padding-left: 10px;
            padding-top: 7px;
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

</head>
<body>
<div class="container-fluid">
    <div class="panel panel-default">
        <!--菜单连接标题-->
        <div class="panel-heading"><span>系统管理</span><span>>字典管理</span></div>

        <div class="panel-body el_main">
            <!--树-->
            <div class="el_leftTree">
                <!--标题类，添加了一个颜色-->
                <span class="el_treeTitle">字典</span>
                <ul id="treeDemo" class="ztree"></ul>
            </div>

            <!--内容-->
            <div class="el_qlmContent">

                <!--索引-->
                <div class="row el_queryBox">
                    <form action="">
                        <div class="col-md-3 el_qlmQuery">
                            <div class="input-group" role="toolbar">
                                <span class="el_spans">字典名称：</span>
                                <input type="text" class="form-control" name=""/>
                            </div>
                        </div>

                        <div class="col-md-3 el_qlmQuery el_qlmQueryR">
                            <div class="input-group" role="toolbar">
                                <span class="el_spans">字典状态：</span>
                                <label class="el_radioBox"><input type="radio" name="el_state"> 启用</label>&nbsp;
                                <label class="el_radioBox"><input type="radio" name="el_state"> 禁用</label>
                            </div>
                        </div>

                        <!--提交查询按钮-->
                        <button type="submit" class="btn btn-default el_queryButton btn-sm">查询</button>
                    </form>

                </div>   <!--结束 查询表单提交-->

                <!--显示内容-->
                <h4 class="el_mainHead">字典管理</h4>
                <div class="panel panel-default el_Mainmain">

                    <div class="panel-body">

                        <!--按钮面板-->
                        <div class="panel panel-default">
                            <div class="panel-body el_MainxiaoMain">

                                <div class="el_topButton">
                                    <button class="btn btn-primary" onclick="el_addDictinary()">
                                        添加字典
                                    </button>

                                    <button type="button" class="btn btn-primary" onclick="piliangdelcfm()">
                                        批量删除
                                    </button>
                                </div>
                            </div>
                        </div>

                        <!--表格
                            内容都提取到json里边
                        -->
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th><input type="checkbox" id="el_checkQuanxuan"/></th>
                                <th>序号</th>
                                <th>字典名称</th>
                                <th>字典状态</th>
                                <th>描述</th>
                                <th width="150">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td><input type="checkbox" class="el_checks"/></td>
                                <td>1</td>
                                <td>项目状态</td>
                                <td>启用</td>
                                <td>项目状态</td>
                                <td>
                                    <a href="" data-toggle="modal" data-target="#modifyUserInfo">修改</a>&nbsp;
                                    <a class="el_delButton" onClick="delcfm()">删除</a><br/>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox" class="el_checks"/></td>
                                <td>1</td>
                                <td>项目状态</td>
                                <td class="danger">禁用</td>
                                <td>项目状态</td>
                                <td>
                                    <a href="" data-toggle="modal" data-target="#modifyUserInfo">修改</a>&nbsp;
                                    <a class="el_delButton" onClick="delcfm()">删除</a><br/>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <!--第一列，复选框基本事件-->
                        <script>
                            $("#el_checkQuanxuan").change(function () {
                                if ($(this).prop("checked") == true) {
                                    $(".el_checks").prop("checked", "true");
                                } else {
                                    $(".el_checks").removeAttr("checked");
                                }
                            })
                        </script>

                        <!--分页-->
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

                <!-- 模态框 添加字典-->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button><!--关闭符号-->
                                <!--标题-->
                                <h4 class="modal-title" id="myModalLabel2">添加字典</h4>
                            </div>
                            <form>
                                <div class="modal-body">

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">上级字典：</span>
                                        <input type="text" class="form-control el_modelinput el_chooseInput"
                                               id="addDefaultDepart" name="" disabled/>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">字典名称：</span>
                                        <input type="text" class="form-control" name=""/>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">字典状态：</span>
                                        <label class="el_radioBox"><input type="radio" name="el_state" checked>
                                            启用</label>&nbsp;
                                        <label class="el_radioBox"><input type="radio" name="el_state"> 禁用</label>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">字典描述：</span>
                                        <textarea class="form-control el_modelinput" rows="2"></textarea>
                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="button" class="btn btn-primary">保存</button>
                                </div>
                            </form>

                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <script>
                    function el_addDictinary() {
                        //判断是否已经选择了树,跟据上边的NodeNums
                        if (NodeNums == 0) {
                            alert("请选选择一个树！")
                        } else {
                            /*给模态框中，添加默认部门*/
                            $("#addDefaultDepart").prop("value", NodeName);
                            $('#myModal').modal();
                        }
                    }
                </script>

                <!-- 模态框 修改字典信息-->
                <div class="modal fade" id="modifyUserInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button><!--关闭符号-->
                                <!--标题-->
                                <h4 class="modal-title" id="myModalLabel24">修改字典信息</h4>
                            </div>
                            <form>
                                <div class="modal-body">

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">上级字典：</span>
                                        <ul id="log" class="el_modelinput el_chooseInput log"></ul>
                                        <img src="../controls/selectDropTree/smallTriangle.png" class="el_smallTriangle"
                                             width="7"/>
                                        <ul id="treeDemo2" class="ztree"></ul>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">字典名称：</span>
                                        <input type="text" class="form-control" name=""/>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">字典状态：</span>
                                        <label class="el_radioBox"><input type="radio" name="el_state"> 启用</label>&nbsp;
                                        <label class="el_radioBox"><input type="radio" name="el_state"> 禁用</label>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">字典描述：</span>
                                        <textarea class="form-control el_modelinput" rows="2"></textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="button" class="btn btn-primary">保存</button>
                                </div>
                            </form>

                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>

                <!-- 模态框   信息删除确认 -->
                <div class="modal fade" id="delcfmModel">
                    <div class="modal-dialog">
                        <div class="modal-content message_align">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">×</span></button>
                                <h4 class="modal-title">删除提示</h4>
                            </div>
                            <div class="modal-body">
                                <p>您确认要删除该条信息吗？</p>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" id="url"/>
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <a onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                <script>
                    function delcfm() {
                        $('#delcfmModel').modal();
                    }
                    function urlSubmit() {
                        var url = $.trim($("#url").val());//获取会话中的隐藏属性URL
                        window.location.href = url;
                    }
                </script>

                <!-- 模态框   批量信息删除确认 -->
                <div class="modal fade" id="delcfmModel2">
                    <div class="modal-dialog">
                        <div class="modal-content message_align">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                        aria-hidden="true">×</span></button>
                                <h4 class="modal-title">批量删除提示</h4>
                            </div>
                            <div class="modal-body">
                                <p>您确认要这些字典吗？</p>
                            </div>
                            <div class="modal-footer">
                                <input type="hidden" id="url2"/>
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <a onclick="urlSubmit()" class="btn btn-success" data-dismiss="modal">确定</a>
                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal-dialog -->
                </div><!-- /.modal -->
                <script>
                    function piliangdelcfm() {
                        //累计选择的个数，若大于1，才执行，否则提示
                        var nums = 0;
                        $.each($(".el_checks"), function (i, el_check) {
                            if ($(this).prop("checked")) {
                                nums++;
                            }
                        });
                        if (nums > 1) {
                            $('#delcfmModel2').modal();
                        } else {
                            alert("请至少选择两列，才能执行此操作！")
                        }
                    }
                    function urlSubmit() {
                        var url = $.trim($("#url2").val());//获取会话中的隐藏属性URL
                        window.location.href = url;
                    }
                </script>

            </div>

        </div>

    </div>
</div>

</body>
</html>