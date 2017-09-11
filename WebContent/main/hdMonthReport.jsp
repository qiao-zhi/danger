<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>
<%@ include file="/tag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>yorge的用户管理</title>

<%@ include file="/controls/cssJs.jsp"%>
<!--下拉树-->
<link rel="stylesheet"
	href="<%=path%>/controls/selectDropTree/demo.css" type="text/css">
<link rel="stylesheet"
	href="<%=path%>/controls/selectDropTree/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="<%=path%>/controls/selectDropTree/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="<%=path%>/controls/selectDropTree/jquery.ztree.excheck.js"></script>
	
<script src="<%=path %>/js/tree.js"></script>
<!--索引责任单位-->
<script type="text/javascript">
        var setting3 = {
            view: {
                selectedMulti: false
            },
            check: {
                enable: true,
                chkStyle: "radio",
                radioType: "all"
            },
            data: {
            	simpleData : {
					enable : true,
					idKey : "departmentId",
					pIdKey : "upDepartmentId",
					rootPId : "10",
				}
            },
            callback: {
                onCheck: onCheck
            }
        };

        var code, log3, className = "dark";

        function onCheck(e, treeId, treeNode) {
        	$("#unitId").val(treeNode.name);
            showLog3(treeNode.name);
        }

        function showLog3(str) {
            if (!log3) log3 = $("#log3");
            /*清空内部的东西*/
            if ($("#log3 > li").length > 0) {
                $("#log3").children("li").remove();
            }
            log3.append("<li class='" + className + "'>" + str + "</li>");

            /*判断是否插入进入，若插入进入，关闭树框*/
            if ($("#log3 > li").length > 0) {
                $("#treeDemo3").hide();
            }
        }

        function checkNode(e) {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo3"),
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
        	searchUnitTree();
        	var zNodes = eval("("+$("#hidden_tree").val()+")"); 
            $.fn.zTree.init($("#treeDemo3"), setting3, zNodes);
            $("#checkTrue").bind("click", {type: "checkTrue"}, checkNode);
            $("#checkFalse").bind("click", {type: "checkFalse"}, checkNode);

            $("#treeDemo3").hide();
            $("#log3").click(function () {
                $('#treeDemo3').toggle();
            })
        });
    </script>

<link rel="stylesheet" href="<%=path%>/css/public/public_style.css" />

<style>
/* 表的基本信息 */
#tableDiv {
	width: 100%;
	overflow-x: scroll;
}

#table {
	min-width: 1500px;
	max-width: 200%;
	width: 150%;
}

/* 索引日期 */
#calendarIndex{
position:relative;
bottom:4px;
}

#optsdate22 {
	position: absolute;
	top: 0;
	left: 200px;
}

#optsdate2, #optsdate22 {
	width: 100px;
	margin-top: 5px;
}
</style>

<!--选择树-->
<style>
#treeDemo3 {
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
#log3 {
	background-color: white;
	height: 25px;
	width: 100%;
	border-color: rgb(204, 204, 204);
	border-radius: 0 3px 3px 0;
	padding-left: 10px;
	padding-top: 2px;
	box-shadow: 0 1px 1px #eee inset;
}

#log3:active {
	border-color: #66afe9;
	-webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
	box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075), 0 0 8px
		rgba(102, 175, 233, .6);
}

#log3 li {
	background-color: white;
	padding: 0;
	height: 20px;
	line-height: 20px;
}
</style>

</head>

<body>
	<!--头-->
	<jsp:include page="../public/header.jsp"></jsp:include>

	<!--中部-->
	<div class="html_middle">

		<!--放菜单-->
		<div id="leftbackground">
			<jsp:include page="../public/menu.jsp"></jsp:include>
			<img src="<%=path%>/image/leftArrow.jpg" id="leftArrow" />
		</div>
		<img src="<%=path%>/image/rightArrow.jpg" id="rightArrow" />

		<!--放主界面内容-->
		<div class="el_right">

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
								<form action="${baseurl }/queryView_findDangerSFR1.action"
									method="post" id="queryForm">
									<div class="row el_queryBoxrow">

										<div class="col-md-3 el_qlmQuery" id="calendarIndex">
											<div class="input-group" role="toolbar">
												<span class="el_spans">时间：</span> 
												<input type="text"
													name="startTime" id="optsdate2" value="${startTime }"
													class="datainp wicon form-control el_modelinput" readonly placeholder="起始时间"/>
													
												<span>&nbsp;&nbsp;&nbsp;&nbsp;到</span> 
												
												<input type="text"
													name="endTime" id="optsdate22" value="${endTime }"
													class="datainp wicon form-control el_modelinput" readonly placeholder="结束时间"/>
											</div>
										</div>
										
										<div class="col-md-3 el_qlmQuery" style="margin-left:50px;">
											<div class="input-group" role="toolbar">
												<span class="el_spans el_chooseSpan">责任单位：</span> <input
													type="hidden" name="unit" />
												<ul id="log3" class="el_modelinput el_chooseInput log"></ul>
												<img src="${baseurl }/controls/selectDropTree/smallTriangle.png"
													class="el_smallTriangle" width="7" />
												<ul id="treeDemo3" class="ztree"></ul>
											</div>
										</div>

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans el_chooseSpan">检查单位：</span>
												<select
													class="selectpicker form-control" name="checkunit"
													id="checkUnitId" title="请选择">
													<option value="0">--请选择--</option>
													<option value="安全小分组"
														<c:if test="${'安全小分组' eq checkunit}">selected</c:if>>安全小分组</option>
													<option value="矿领导"
														<c:if test="${'矿领导' eq checkunit}">selected</c:if>>矿领导</option>
													<option value="科领导"
														<c:if test="${'科领导' eq checkunit}">selected</c:if>>科领导</option>
													<option value="屯兰安监处"
														<c:if test="${'屯兰安监处' eq checkunit}">selected</c:if>>屯兰安监处</option>
													<option value="五人小组"
														<c:if test="${'五人小组' eq checkunit}">selected</c:if>>五人小组</option>
													<option value="省厅"
														<c:if test="${'省厅' eq checkunit}">selected</c:if>>省厅</option>
													<option value="山西焦煤"
														<c:if test="${'山西焦煤' eq checkunit}">selected</c:if>>山西焦煤</option>
													<option value="西山煤电"
														<c:if test="${'西山煤电' eq checkunit}">selected</c:if>>西山煤电</option>
													<option value="西山煤电安监局"
														<c:if test="${'西山煤电安监局' eq checkunit}">selected</c:if>>西山煤电安监局</option>
												</select>
												
											</div>
										</div>

									</div>
									<!-- 隐藏的当前页大小与页号 -->
									<input type="hidden" name="currentPage" id="currentPage" /> <input
										type="hidden" name="currentCount" id="currentCount" />
									<!--提交查询按钮-->
									<button type="submit"
										class="btn btn-default el_queryButton btn-sm">查询</button>
								</form>

							</div>
							<!--结束 查询表单提交-->

							<!--显示内容-->
							<div class="panel panel-default el_Mainmain">

								<!--按钮面板-->
								<div class="panel-body">

									<div class="panel panel-default">
										<div class="panel-body el_MainxiaoMain">

											<div class="el_topButton">
												<!-- 按钮触发模态框1-->
												<div class="col-md-2">
													<a style="text-decoration: none; color: white;"
														href="addExam.html">
														<button class="btn btn-primary">导出</button>
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
												<tr>
													<th>序号</th>
													<th>检查日期</th>
													<th>检查单位</th>
													<th>地点</th>
													<th>类别</th>
													<th>级别</th>
													<th>状态</th>
													<th width="300">隐患内容</th>
													<th>责任单位</th>
													<th>整改措施</th>
													<th>四定时间</th>
													<th>责任单位负责人</th>
													<th>复查时间</th>
													<th>复查人</th>
													<th>复查结果</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="danger"
													items="${result.pageBean.productList }" varStatus="status">
													<tr>
														<td>${ status.index + (result.pageBean.currentPage-1)*8+1}</td>
														<td><fmt:formatDate value="${danger.findtime}"
																pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
														<td>${danger.checkunit }</td>
														<td>${danger.address}</td>
														<td>${danger.type }</td>
														<td>${danger.dangergrade }</td>
														<td>${danger.dangerstatus }</td>
														<td>${danger.content }</td>
														<td>${danger.unit }</td>
														<td>${danger.rectificationmeasure }</td>
														<td><fmt:formatDate value="${danger.sidingtime}"
																pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
														<td>${danger.manager}</td>
														<td><fmt:formatDate value="${danger.recheckdate}"
																pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
														<td>${danger.recheckman}</td>
														<c:if test="${danger.recheckresult eq 0 }">
															<td>合格</td>
														</c:if>
														<c:if test="${danger.recheckresult eq 1 }">
															<td style="background-color: #D1EEEE">不合格</td>
														</c:if>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<div id="paginationIDU"></div>
									<script>
										$('#paginationIDU').pagination(
												{
													//			组件属性
													"total" :${result.pageBean.totalCount},//数字 当分页建立时设置记录的总数量 1
													"pageSize" : 10,//数字 每一页显示的数量 10
													"pageNumber" : ${result.pageBean.currentPage},//数字 当分页建立时，显示的页数 1
													"pageList" : [ 10 ],//数组 用户可以修改每一页的大小，
													//功能
													"layout" : [ 'list', 'sep',
															'first', 'prev',
															'manual', 'next',
															'last', 'links' ],
													"onSelectPage" : function(
															pageNumber, b) {
														$("#currentPage").val(pageNumber);
														$("#currentCount").val(b);
														$("#queryForm").submit();
													}
												});
									</script>

								</div>
							</div>

						</div>


					</div>
				</div>

			</div>


		</div>
	</div>

	<!--放脚-->
	<jsp:include page="../public/footer.jsp"></jsp:include>
</body>
</html>