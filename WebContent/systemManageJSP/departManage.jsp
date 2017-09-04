<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>机构管理</title>

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
            {id: 1, pId: 0, name: "***部门", t: "我很普通，随便点我吧", open: true},
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
            $.fn.zTree.init($("#treeDemo5"), setting5, zNodes5);
        });
    </script>

    <!--用于三级联动-->
    <script src="../controls/liandong/distpicker.data.js"></script>
    <script src="../controls/liandong/distpicker.js"></script>

    <link rel="stylesheet" href="../css/public/public_style.css"/>

</head>
<body>
<div class="container-fluid">
    <div class="panel panel-default">
        <!--菜单连接标题-->
        <div class="panel-heading"><span>系统管理</span><span>>机构管理</span></div>
        <div class="panel-body el_main">
            <!--树-->
            <div class="el_leftTree">
                <!--标题类，添加了一个颜色-->
                <span class="el_treeTitle">部门</span>
                <ul id="treeDemo5" class="ztree"></ul>
            </div>

            <!--内容-->
            <div class="el_qlmContent">

                <!--索引-->
                <div class="row el_queryBox">
                    <form action="">

                        <div class="col-md-4 el_qlmQuery">
                            <div class="input-group" role="toolbar">
                                <span class="el_spans">部门名称：</span>
                                <input type="text" class="form-control" name=""/>
                            </div>
                        </div>

                        <!--提交查询按钮-->
                        <button type="submit" class="btn btn-default el_queryButton btn-sm">查询</button>
                    </form>

                </div>   <!--结束 查询表单提交-->

                <!--显示内容-->
                <h3 class="el_mainHead">机构信息</h3>
                <div class="panel panel-default el_Mainmain">

                    <!--按钮面板-->
                    <div class="panel-body">

                        <div class="panel panel-default">
                            <div class="panel-body el_MainxiaoMain">

                                <div class="el_topButton">
                                    <!-- 按钮触发模态框1 -->
                                    <div class="col-md-2">
                                        <button class="btn btn-primary" onclick="el_addDictinary()">
                                            添加单位
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
                            <th>单位编号</th>
                            <th>单位名称</th>
                            <th>单位负责人</th>
                            <th>联系方式</th>
                            <th>上级单位</th>
                            <th width="150">操作</th>
                            </thead>
                            <tbody>
                            <tr>
                                <td>-阿斯顿</td>
                                <td> 速度</td>
                                <td>刘洋</td>
                                <td>234213424140</td>
                                <td>****单位</td>
                                <td>
                                    <a href="" data-toggle="modal" data-target="#myModal2">修改</a>&nbsp;&nbsp;&nbsp;
                                    <a class="el_delButton" onClick="delcfm()">删除</a><br/>
                                </td>
                            </tr>
                            </tbody>
                        </table>

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

                <!-- 模态框 部门添加-->
                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button><!--关闭符号-->
                                <!--标题-->
                                <h4 class="modal-title" id="myModalLabel21">添加部门信息</h4>
                            </div>
                            <form>
                                <div class="modal-body">
                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">单位编号：</span>
                                        <input type="text" class="form-control el_modelinput" name=""/>
                                        <span></span>
                                    </div>
                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">单位名称：</span>
                                        <input type="text" class="form-control el_modelinput" name=""/>
                                        <span></span>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">联系方式：</span>
                                        <input type="text" class="form-control" name=""/>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">上级部门：</span>
                                        <input type="text" class="form-control el_modelinput el_chooseInput"
                                               id="addDefaultDepart" name="" disabled/>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">单位负责人：</span>
                                        <input type="text" class="form-control" name=""/>
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
                            $("#addDefaultDepart").prop("value",NodeName);
                            $('#myModal').modal();
                        }
                    }
                </script>


                <!-- 模态框 部门修改-->
                <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-hidden="true">&times;</button><!--关闭符号-->
                                <!--标题-->
                                <h4 class="modal-title" id="myModalLabel2">添加部门信息</h4>
                            </div>
                            <form>
                                <div class="modal-body">
                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">单位编号：</span>
                                        <input type="text" class="form-control el_modelinput" name=""/>
                                        <span></span>
                                    </div>
                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">单位名称：</span>
                                        <input type="text" class="form-control el_modelinput" name=""/>
                                        <span></span>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">联系方式：</span>
                                        <input type="text" class="form-control" name=""/>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">上级部门：</span>
                                        <input type="text" class="form-control el_modelinput el_chooseInput"
                                                name="" disabled/>
                                    </div>

                                    <div class="input-group el_modellist" role="toolbar">
                                        <span class="el_spans">单位负责人：</span>
                                        <input type="text" class="form-control" name=""/>
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
                                <h4 class="modal-title">提示</h4>
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

            </div>

        </div>

    </div>
</div>


</body>
</html>