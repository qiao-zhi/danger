<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>权限管理</title>

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
    <script>
        var setting = {	};

        var zNodes =[
            { name:"试卷及考试管理", open:true,
                children: [
                    { name:"考试管理"},
                    { name:"试卷管理"},
                    { name:"创建试卷"},
                    { name:"监考中心"},
                ]
            },
            { name:"题库管理", open:false,
                children: [
                    { name:"试题管理"},
                    { name:"题库信息管理"}
                ]
            },
            { name:"成绩管理", open:false,
                children: [
                    { name:"成绩信息管理"},
                    { name:"员工成绩"}
                ]
            },
            { name:"外来单位管理", open:false,
                children: [
                    { name:"外来单位信息管理"},
                    { name:"外来单位员工管理"},
                    { name:"违章管理"},
                    { name:"工程管理"}
                ]
            },
            { name:"部门管理", open:false,
                children: [
                    { name:"部门信息管理"},
                    { name:"员工管理"}
                ]
            },
            { name:"培训管理", open:false,
                children: [
                    { name:"培训内容管理"}
                ]
            },
            { name:"系统管理", open:false ,
                children: [
                    { name:"用户管理"},
                    { name:"角色管理"},
                    { name:"权限管理"},
                    { name:"权限管理"},
                    { name:"日志管理"}
                ]
            }
        ];

        $(document).ready(function(){
            $.fn.zTree.init($("#treeDemo"), setting, zNodes);
        });
    </script>

    <link rel="stylesheet" href="../css/public/public_style.css"/>

</head>
<body>
<div class="container-fluid">
    <div class="panel panel-default">
        <!--菜单连接标题-->
        <div class="panel-heading"><span>系统管理</span><span>>权限管理</span></div>

        <div class="panel-body el_main">
            <!--树-->
            <div class="el_leftTree">
                <!--标题类，添加了一个颜色-->
                <span class="el_treeTitle">菜单</span>
                <ul id="treeDemo" class="ztree"></ul>
            </div>

            <!--内容-->
            <div class="col-md-10 el_qlmContent">

                <!--索引-->
                <div class="row el_queryBox">
                    <form action="">
                        <div class="col-md-3 el_qlmQuery">
                            <div class="input-group" role="toolbar">
                                <span class="el_spans">权限名称：</span>
                                <input type="text" class="form-control" name=""/>
                            </div>
                        </div>

                        <div class="col-md-3 el_qlmQuery el_qlmQueryR">
                            <div class="input-group" role="toolbar">
                                <span class="el_spans">权限状态：</span>
                                <label class="el_radioBox"><input type="radio" name="el_state"> 启用</label>&nbsp;
                                <label class="el_radioBox"><input type="radio" name="el_state"> 禁用</label>
                            </div>
                        </div>

                        <!--提交查询按钮-->
                        <button type="submit" class="btn btn-default el_queryButton btn-sm">查询</button>
                    </form>

                </div>   <!--结束 查询表单提交-->

                <!--显示内容-->
                <h4 class="el_mainHead">权限管理</h4>
                <div class="panel panel-default el_Mainmain">

                    <div class="panel-body">

                        <!--表格
                            内容都提取到json里边
                        -->
                        <table class="table table-hover table-bordered">
                            <thead>
                            <tr>
                                <th>序号</th>
                                <th>权限名称</th>
                                <th>权限状态</th>
                                <th>权限类别</th>
                                <th>权限描述</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>上传资料人员</td>
                                <td>启用</td>
                                <td>2</td>
                                <td>上传本部门的所有培训资料</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>上传资料人员</td>
                                <td class="danger">禁用</td>
                                <td>2</td>
                                <td>上传本部门的所有培训资料</td>
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

            </div>

        </div>

    </div>
</div>

</body>
</html>