<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>隐患录入</title>

    <link rel="stylesheet" href="../bs/css/bootstrap.css"/>
    <script type="text/javascript" src="../js/jquery.min.js"></script>
    <script type="text/javascript" src="../bs/js/bootstrap.js"></script>

    <!--日历-->
    <link rel="stylesheet" href="../controls/calendar/pikaday.css">
    <script src="../controls/calendar/pikaday.js"></script>

    <!--复杂时日-->
    <link rel="stylesheet" type="text/css" media="all" href="../controls/calendar/daterangepicker-bs3.css"/>
    <script type="text/javascript" src="../controls/calendar/moment.js"></script>
    <script type="text/javascript" src="../controls/calendar/daterangepicker.js"></script>

    <!--选择树-->
    <link rel="stylesheet" href="../controls/selectDropTree/demo.css" type="text/css">
    <link rel="stylesheet" href="../controls/selectDropTree/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="../controls/selectDropTree/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="../controls/selectDropTree/jquery.ztree.excheck.js"></script>
    <!--部门-->
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

    <!--编辑器-->
    <script charset="utf-8" src="../controls/kindEditor/kindeditor-all-min.js"></script>
    <script charset="utf-8" src="../controls/kindEditor/zh-CN.js"></script>
    <script>
        KindEditor.ready(function (K) {
            var editor = K.create('#editor_id', {
                resizeType: 1,
                items: [
                    'table', '|', 'fontsize', 'bold', 'italic', 'underline',
                    'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', '|', 'image']
            });

            // 取得HTML内容
            //var html = editor.html();

            // 同步数据后可以直接取得textarea的value
            editor.sync();
            var html = $('#editor_id').val(); // jQuery
            // 设置HTML内容
            editor.html('HTML内容');
        });
    </script>

    <link rel="stylesheet" href="../css/public/publicSon_style.css"/>

    <!--选择树-->
    <style>
        #treeDemo2 {
            width:410px;
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
            height: 34px;
            line-height:34px;
            width: 80%;
            border-color: rgb(204, 204, 204);
            border-radius: 0 3px 3px 0;
            padding-left: 10px;
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

    <!--详细信息，培训档案-->
    <style>
        .el_parperInfo table {
            width: 95%;
            margin:0 auto;
            font-size:13px;
        }
        .el_parperInfo table tr {
            height: 30px;
            line-height:30px;
            border-bottom: 1px solid #eee;
            border-right:1px solid #eee;
        }
        .el_parperInfo table tr:first-child{
            border-top: 1px solid #eee;
        }
        .el_parperInfo table tr td:nth-child(even){
            text-align:left;
            min-width:100px;
            padding-right:30px;
            margin-right:20px;
            padding-left:10px;
        }
        .el_parperInfo table tr td:nth-child(odd) {
            width: 70px;
            background-color:rgb(250,250,250);
            text-align:center;
            border-right:1px solid #eee;
            border-left:1px solid #eee;
        }
        /*模态大小*/
        #el_setFour .modal-dialog{
            width:70%;
        }
        #el_h3{
            margin-top:20px;
            margin-bottom:10px;
            text-align:center;
            font-weight:500;
        }
    </style>

    <!--验证-->
    <script src="../controls/validate/jquery.validate.js"></script>
    <script src="../controls/validate/messages_zh.js"></script>
    <script>
        $().ready(function() {
            $("#addhdform").validate({
                rules: {
                    reservationtime:"required",//发现日期
                    className:"required",
                    findPerson:"required",
                    checkDepart:"required",
                    location:"required",
                    hgContent:"required",
                    hdbank:"required",
                    hgtype:"required",
                    //还有一个责任单位
                    dutyperson:"required"
                },
                messages: {
                    reservationtime: {required: "不能为空"},
                    className:{required: "不能为空"},
                    findPerson:{required: "不能为空"},
                    checkDepart:{required: "不能为空"},
                    location:{required: "不能为空"},
                    hgContent:{required: "不能为空"},
                    hdbank:{required: "不能为空"},
                    hgtype:{required: "不能为空"},
                    //还有一个责任单位
                    dutyperson:{required: "不能为空"}
                }
            });
        });
    </script>
    <style>
        .error{
            color:red;
        }
    </style>

</head>
<body>

<div class="container-fluid">
    <div class="panel panel-default">
        <!--菜单连接标题-->
        <div class="el_stairTitle">
            <span>隐患管理 </span><span>> 隐患录入</span>
        </div>
        <div class="panel-body">

            <form action="hdQuery.html" id="addhdform">
                <div class="modal-body">

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">发现日期：</span>
                        <input type="text" name="reservationtime"
                               id="reservationtime" class="form-control el_modelinput span4" value="08/01/2013 1:00 PM"/>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            $('#reservationtime').daterangepicker({
                                singleDatePicker: true,//设置成单日历
                                timePicker: true,
                                timePickerIncrement: 1,
                                format: 'MM/DD/YYYY h:mm A'
                            }, function (start, end, label) {
                                console.log(start.toISOString(), end.toISOString(), label);
                            });
                        });
                    </script>

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">班&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;次：</span>
                        <select class="selectpicker form-control" name="className" id="className" title="请选择">
                            <option>--请选择--</option>
                            <option>单选</option>
                            <option>多选</option>
                            <option>判断</option>
                        </select>
                    </div>

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">发&nbsp;&nbsp;现&nbsp;&nbsp;人：</span>
                        <input type="text" class="form-control el_modelinput" id="findPerson" name="findPerson"/>
                    </div>

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">检查单位：</span>
                        <select class="selectpicker form-control" name="checkDepart" title="请选择">
                            <option>--请选择--</option>
                            <option>安全小分队</option>
                            <option>矿领导</option>
                            <option>科领导</option>
                            <option>屯兰安监处</option>
                        </select>
                    </div>

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点：</span>
                        <input type="text" class="form-control el_modelinput" name="location"/>
                    </div>

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">隐患内容：</span>
                        <textarea class="form-control" rows="6" name="hgContent"></textarea>
                    </div>

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">隐患级别：</span>
                        <select class="selectpicker form-control" title="请选择" id="bankHigh" name="hdbank">
                            <option>--请选择--</option>
                            <option>无</option>
                            <option>C级</option>
                            <option>B级</option>
                            <option>A级</option>
                        </select>
                    </div>

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">隐患类型：</span>
                        <select class="selectpicker form-control" title="请选择" name="hgtype">
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

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">责任单位：</span>
                        <ul id="log" class="el_modelinput el_chooseInput log form-control">
                            <img src="../controls/selectDropTree/smallTriangle.png" class="el_smallTriangle"
                                 width="7"/>
                        </ul>
                        <ul id="treeDemo2" class="ztree"></ul>
                    </div>

                    <div class="input-group el_modellist" role="toolbar">
                        <span class="el_spans">单位责任人：</span>
                        <input type="text" class="form-control el_modelinput" name="dutyperson"/>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" id="submitButton">完成录入</button>
                </div>
            </form>

        </div>

        <!--完成录入，判断隐患级别是否是B A -->
        <script>
            $("#submitButton").click(function () {
                var bankValue = $("#bankHigh").val();
                if(bankValue == "A级" || bankValue == "B级") {
                    $("#el_setFour").modal();

                }
            })
        </script>

        <!-- 模态框 上级部门汇报-->
        <div class="modal fade" id="el_setFour" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                                aria-hidden="true">&times;</button><!--关闭符号-->
                        <!--标题-->
                        <h3 class="modal-title">重大安全隐患上级部门汇报</h3>
                    </div>

                    <div class="modal-body">
                        <div class="el_parperInfo">
                            <table>
                                <tr>
                                    <td>检查日期：</td>
                                    <td>2017-12-10</td>
                                    <td>检查单位：</td>
                                    <td>机电科</td>
                                    <td>检查人：</td>
                                    <td>张明</td>
                                </tr>
                                <tr>
                                    <td>地点：</td>
                                    <td>1# 工程部</td>
                                    <td>隐患类型：</td>
                                    <td>机电</td>
                                    <td>隐患级别：</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>隐患内容：</td>
                                    <td colspan="5">道超过扩散通风距离（实测长约××m、瓦斯浓度×%),未设置栅栏,揭示警标<</td>
                                </tr>
                            </table>
                        </div>
                        <h3 id="el_h3">重大安全隐患上报报告</h3>
                        <div>
                            <textarea id="editor_id" name="content" style="width:100%;height:300px;"></textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">保存</button>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal -->
        </div>

    </div>
</div>


</body>
</html>