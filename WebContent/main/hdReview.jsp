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
<link rel="stylesheet" href="<%=path%>/controls/selectDropTree/demo.css"
	type="text/css">
<link rel="stylesheet"
	href="<%=path%>/controls/selectDropTree/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript"
	src="<%=path%>/controls/selectDropTree/jquery.ztree.core.js"></script>
<script type="text/javascript"
	src="<%=path%>/controls/selectDropTree/jquery.ztree.excheck.js"></script>

<script src="<%=path%>/js/tree.js"></script>
<!--索引责任单位-->
<script type="text/javascript">
	var setting3 = {
		view : {
			selectedMulti : false
		},
		check : {
			enable : true,
			chkStyle : "radio",
			radioType : "all"
		},
		data : {
			simpleData : {
				enable : true,
				idKey : "departmentId",
				pIdKey : "upDepartmentId",
				rootPId : "10",
			}
		},
		callback : {
			onCheck : onCheck
		}
	};

	var code, log3, className = "dark";

	function onCheck(e, treeId, treeNode) {
		$("#unitId").val(treeNode.name);
		showLog3(treeNode.name);
	}

	function showLog3(str) {
		if (!log3)
			log3 = $("#log3");
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
		var zTree = $.fn.zTree.getZTreeObj("treeDemo3"), type = e.data.type, nodes = zTree
				.getSelectedNodes();
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

	$(document).ready(function() {
		searchUnitTree();
    	var zNodes = eval("("+$("#hidden_tree").val()+")"); 
		$.fn.zTree.init($("#treeDemo3"), setting3, zNodes);
		$("#checkTrue").bind("click", {
			type : "checkTrue"
		}, checkNode);
		$("#checkFalse").bind("click", {
			type : "checkFalse"
		}, checkNode);

		$("#treeDemo3").hide();
		$("#log3").click(function() {
			$('#treeDemo3').toggle();
		})
	});
</script>

<link rel="stylesheet" href="<%=path%>/css/public/public_style.css" />

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

<!--验证-->
<script src="<%=path%>/controls/validate/jquery.validate.js"></script>
<script src="<%=path%>/controls/validate/messages_zh.js"></script>
<script>
	$().ready(function() {
		$("#reviewform").validate({
			rules : {
				recheckdate : "required",//发现日期
				recheckresult : "required",
				comment : {
					required : function() {
						if ($("#noqualified").prop("checked")) {
							return true;
						} else {
							return false;
						}
					}
				}
			},
			messages : {
				recheckdate : {
					required : "不能为空"
				},
				recheckresult : {
					required : "不能为空"
				},
				comment : {
					required : "请填写不合格原因"
				}
			}
		});
	});
</script>
<style>
.error {
	color: red;
}

#table {
	min-width: 1200px;
	max-width: 200%;
	width: 120%;
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
						<span>隐患管理 </span><span>> 隐患复查</span>
					</div>

					<div class="panel-body el_main">

						<!--内容-->
						<div class=" col-md-12">

							<!--索引-->
							<div class="row el_queryBox">
								<form action="${baseurl }/queryView_findDangerSF.action"
									method="post" id="queryForm">
									<div class="row el_queryBoxrow">

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans el_chooseSpan">检查单位：</span> <select
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

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans">隐患级别：</span> <select
													class="selectpicker form-control" title="请选择"
													name="dangergrade">
													<option value="">--请选择--</option>
													<option vaule="无"
														<c:if test="${'无' eq dangergrade}">selected</c:if>>无</option>
													<option vaule="A"
														<c:if test="${'A' eq dangergrade}">selected</c:if>>A</option>
													<option vaule="B"
														<c:if test="${'B' eq dangergrade}">selected</c:if>>B</option>
													<option vaule="C"
														<c:if test="${'C' eq dangergrade}">selected</c:if>>C</option>
												</select>
											</div>
										</div>

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans">隐患类型：</span> <select
													class="selectpicker form-control" title="请选择" name="type">
													<option value="">--请选择--</option>
													<option value="采煤"
														<c:if test="${'采煤' eq type}">selected</c:if>>采煤</option>
													<option value="开掘"
														<c:if test="${'开掘' eq type}">selected</c:if>>开掘</option>
													<option value="机电"
														<c:if test="${'机电' eq type}">selected</c:if>>机电</option>
													<option value="运输"
														<c:if test="${'运输' eq type}">selected</c:if>>运输</option>
													<option value="通风"
														<c:if test="${'通风' eq type}">selected</c:if>>通风</option>
													<option value="地测"
														<c:if test="${'地测' eq type}">selected</c:if>>地测</option>
													<option value="其他"
														<c:if test="${'其他' eq type}">selected</c:if>>其他</option>
												</select>
											</div>
										</div>
									</div>

									<div class="row el_queryBoxrow">

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans el_chooseSpan">隐患地点：</span> <input
													type="text" class="form-control" name="address"
													value="${address }" />
											</div>
										</div>

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans el_chooseSpan">隐患内容：</span> <input
													type="text" class="form-control" name="content"
													value="${content }" />
											</div>
										</div>

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans el_chooseSpan">隐患状态：</span> <select
													class="selectpicker form-control" title="请选择"
													name="dangerstatus">
													<option value="已整改"
														<c:if test="${'已整改' eq dangerstatus}">selected</c:if>>已整改</option>
													<option value="已复查"
														<c:if test="${'已复查' eq dangerstatus}">selected</c:if>>已复查</option>
												</select>
											</div>
										</div>
									</div>

									<div class="row el_queryBoxrow">

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans">发现日期：</span> <input
													class="datainp wicon form-control" id="optsdate2"
													type="text" placeholder="请选择发现日期" value="${findtime }"
													name="findtime" readonly />
											</div>
										</div>

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans el_chooseSpan">责任单位：</span> <input
													id="unitId" type="hidden" name="unit" value="${unit}" />
												<ul id="log3" class="el_modelinput el_chooseInput log"></ul>
												<img
													src="${baseurl }/controls/selectDropTree/smallTriangle.png"
													class="el_smallTriangle" width="7" />
												<ul id="treeDemo3" class="ztree"></ul>
											</div>
										</div>
										<!-- 从unitId 的input 隐藏域拿过来的值，放ul到文本框上。并且，把下边的树节点选中。 -->
										<script>
											var hiV = $("#unitId").val();
											if ($("#log3 > li").length > 0) {//先清空
												$("#log3").children("li").remove();
											}
											//插入值
											$("#log3").append("<li class='" + className + "'>" + hiV + "</li>");
											
										</script>

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<span class="el_spans el_chooseSpan">责任人&nbsp;&nbsp;&nbsp;：</span>
												<input type="text" class="form-control" name="manager"
													value="${manager }" />
												<!-- 隐藏的当前页大小与页号 -->
												<input type="hidden" name="currentPage" id="currentPage" />
												<input type="hidden" name="currentCount" id="currentCount" />
											</div>
										</div>
									</div>

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
												<button class="btn btn-primary" data-toggle="modal"
													data-target="#el_Export">导出</button>
											</div>
										</div>
									</div>

									<!--表格   内容都提取到json里边
                        -->
									<table class="table table-hover table-bordered"
										style="overflow-x: scorll" id="table">
										<thead>
											<tr>
												<th>序号</th>
												<th>检查日期</th>
												<th>地点</th>
												<th>检查单位</th>
												<th>类型</th>
												<th>级别</th>
												<th>状态</th>
												<th>隐患内容</th>
												<th width="60">责任单位</th>
												<th width="60">负责人</th>
												<th>整改时间(跟踪 )</th>
												<th>整改措施</th>
												<th>整改时间(四定)</th>
												<th>四定时间</th>
												<th width="100">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="danger"
												items="${result.pageBean.productList }" varStatus="status">
												<tr>
													<td>${ status.index + (result.pageBean.currentPage-1)*10+1}
														<input type="hidden" value="${danger.findperson }"
														class="hidden_findperson">
													</td>
													<td><fmt:formatDate value="${danger.findtime }"
															pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
													<td>${danger.address }</td>
													<td>${danger.checkunit }</td>
													<td>${danger.type }</td>
													<td>${danger.dangergrade }</td>
													<td>${danger.dangerstatus }</td>
													<td>${danger.content}</td>
													<td>${danger.unit}</td>
													<td>${danger.dutyperson}</td>
													<td><fmt:formatDate value="${danger.rechecktime}"
															pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
													<td>${danger.rectificationmeasure }</td>
													<td><fmt:formatDate
															value="${danger.rectificationtime }"
															pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
													<td><fmt:formatDate value="${danger.sidingtime }"
															pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
													<td><c:if test="${danger.dangerstatus eq '已整改'}">
															<!-- 变活， 1 ：隐患id ，1 ：跟踪id -->
															<a href="javascript:void(0)"
																onClick="el_setFour(this,${danger.dangerid},${danger.followid })">复查</a>
														</c:if> <c:if test="${danger.dangerstatus ne '已整改'}">
															<!-- <--需要改一下。2   换成id -->
															<a href="javascript:void(0)" data-toggle="modal"
																data-target="#el_FourInfo"
																onClick="allInfo(this,${danger.followid})">详情</a>
														</c:if></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>

									<!-- 模态框 复查-->
									<div class="modal fade" id="el_setFour" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<!--关闭符号-->
													<!--标题-->
													<h3 class="modal-title">安全隐患-问题复查</h3>
												</div>

												<div class="modal-body">
													<h3>安全隐患基本信息:</h3>
													<div class="el_parperInfo">
														<table>
															<tr>
																<td>检查日期：</td>
																<td id="fccheckdate"></td>
																<td>检查人：</td>
																<td>张明</td>
															</tr>

															<tr>
																<td>检查单位：</td>
																<td id="fccheckunit"></td>
																<td>地点：</td>
																<td id="fccheckaddress"></td>
															</tr>
															<tr>
																<td>隐患类型：</td>
																<td id="fcdangertype"></td>
																<td>隐患级别：</td>
																<td id="fcdangerlevel"></td>
															</tr>
															<tr>
																<td>责任单位：</td>
																<td id="fcdutyunit"></td>
																<td>隐患内容：</td>
																<td id="fcdangercontent"></td>
															</tr>
															<tr>
																<td>整改时间：(四定)</td>
																<td colspan="3" id="fczhenggaitime"></td>
															</tr>
															<tr>
																<td>整改措施：</td>
																<td colspan="3" id="fczhenggaicuoshi"></td>
															</tr>
														</table>
													</div>
													<form action="" id="reviewform">

														<div class="input-group el_modellist" role="toolbar">
															<span class="el_spans">处理时间：</span> <input
																class="datainp wicon form-control el_modelinput span4"
																id="optsdate" name="rechecktable.recheckdate"
																type="text" readonly>
														</div>

														<!-- 飞哥 -->


														<div class="input-group el_modellist" role="toolbar">
															<span class="el_spans el_chooseSpan">复查结果：</span> <label
																class="el_radioBox el_radioBox2"> <input
																type="radio" name="rechecktable.recheckresult" checked
																value="0"> 合格
															</label> <label class="el_radioBox el_radioBox2"> <input
																type="radio" name="rechecktable.recheckresult" value="1"
																id="noqualified">不合格
															</label>
														</div>

														<div class="input-group el_modellist" role="toolbar">
															<span class="el_spans">复&nbsp;&nbsp;查&nbsp;&nbsp;人：</span>
															<input class="form-control  el_modelinput"
																id="recheckman" name="rechecktable.recheckman"></input>
														</div>

														<div class="input-group el_modellist" role="toolbar">
															<span class="el_spans">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注：</span>
															<textarea class="form-control texta" rows="10"
																name="rechecktable.comment"></textarea>
														</div>

														<input type="hidden" name="rechecktable.dangerid"
															id="rechecktabledangerid" /> <input type="hidden"
															name="rechecktable.followid" id="rechecktablefollowid" />

														<div class="modal-footer">
															<button type="button" class="btn btn-primary"
																onclick="addRecheck()">保存</button>
															<button type="button" class="btn btn-default"
																data-dismiss="modal">关闭</button>
														</div>
													</form>
												</div>

											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal -->
									</div>
									<!-- 飞哥 -->
									<script>
					                    function el_setFour(obj,dangerId,followId) {
					                    	
					                        $("#rechecktabledangerid").val(dangerId);
					                        $("#rechecktablefollowid").val(followId);
					                        
					                		$tds = $(obj).parents('tr').children('td');
					                    	$("#fccheckdate").text($tds.eq(1).html());
					                    	$("#fccheckunit").text($tds.eq(3).html());
					                    	$("#fccheckaddress").text($tds.eq(2).html());
					                    	$("#fcdangertype").text($tds.eq(4).html());
					                    	$("#fcdutyunit").text($tds.eq(8).html());
					                    	$("#fcrecheckman").text($tds.eq(7).html());//需要隐藏
					                    	$("#fczhenggaicuoshi").text($tds.eq(11).html());
					                    	$("#fccheckman").text($tds.eq(7).html());//需要隐藏
					                    	$("#fcplace").text($tds.eq(4).html());//需要隐藏
					                    	$("#fcdangerlevel").text($tds.eq(5).html());
					                    	$("#fcdangercontent").text($tds.eq(7).html());
					                    	$("#fczhenggaitime").text($tds.eq(10).html());
					                    	
					                    	//打开模态框
					                    	$('#el_setFour').modal();
					                    }
					                </script>
									<script type="text/javascript">
									                    	function addRecheck(){
									                    		/* alert($("#reviewform").serialize()); */
									                    		$.ajax({
									                    			url : '${pageContext.request.contextPath}/recheck_addRecheck.action',
									                    			data : $("#reviewform").serialize(),
									                    			type : 'POST',
									                    			dataType : 'json',
									                    			success : function(data) {
									                    				if(data.result==0){
									                    					alert("添加失败，请重新添加");
									                    					return;
									                    				}
									                    				alert("添加成功！")
									                    				window.location.reload();
									                    				}
									                    		
									                    		})
									                    				
									                    	}
									                    </script>


									<!-- 模态框 详细信息-->
									<div class="modal fade" id="allInfo" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<!--关闭符号-->
													<!--标题-->
													<h3 class="modal-title">安全隐患-复查详情</h3>
												</div>
												<form>
													<div class="modal-body">
														<div class="el_parperInfo">
															<h3>&nbsp;&nbsp;安全隐患基本信息</h3>
															<table>
																<tr>
																	<td>检查日期：</td>
																	<td id="xxcheckdate"></td>
																	<td>检查人：</td>
																	<td id="xxcheckperson"></td>
																</tr>
																<tr>
																	<td>检查单位：</td>
																	<td id="xxcheckunit"></td>
																	<td>地点：</td>
																	<td id="xxcheckaddress"></td>
																</tr>
																<tr>
																	<td>隐患类型：</td>
																	<td id="xxdangertype"></td>
																	<td>隐患级别：</td>
																	<td id="xxdangerlevel"></td>
																</tr>
																<tr>
																	<td>隐患内容：</td>
																	<td id="xxdangercontent" colspan="3"></td>
																</tr>
																<tr>
																	<td>责任单位：</td>
																	<td id="xxdutyunit"></td>
																	<td>责任人</td>
																	<td id="xxdutyperson"></td>
																</tr>
															</table>

															<br />
															<h3>&nbsp;&nbsp;复查信息</h3>
															<table>
																<tr>
																	<td>复查时间：</td>
																	<td id="xxrechecktime"></td>
																	<td>复查人</td>
																	<td id="xxrecheckperson"></td>
																</tr>
																<tr>
																	<td>复查结果：</td>
																	<td id="xxrecheckresult"></td>
																	<td>备注</td>
																	<td id="xxrecheckcomment"></td>
																</tr>
															</table>
														</div>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">关闭</button>
													</div>
												</form>

											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal -->
									</div>
									<script>
										function allInfo() {
											$('#allInfo').modal();
										}
									</script>
									<!-- 飞哥 -->
									<script>
					                    function allInfo(obj,followid) {
					                    	$tds = $(obj).parents('tr').children('td');
					                    	//获取隐藏的发现人并给模态框赋值
					                    	/* var findperson_hidden = $(obj).parents('tr').find(".hidden_findperson").val(); */
					                    	var findperson_hidden = $tds.find(".hidden_findperson").val();

					                    	$("#xxcheckperson").text(findperson_hidden);
					                    	
					                    	$("#xxcheckdate").text($tds.eq(1).html());
					                    	$("#xxcheckunit").text($tds.eq(3).html());
					                    	$("#xxdangertype").text($tds.eq(4).html());
					                    	$("#xxcheckaddress").text($tds.eq(2).html());
					                    	$("#xxdutyunit").text($tds.eq(8).html());
					                    	$("#xxdutyperson").text($tds.eq(9).html());
					                    	
					                    	$("#xxzhenggaicuoshi").text($tds.eq(10).html());
					                    	$("#xxcheckman").text($tds.eq(7).html());//需要隐藏
					                    	$("#xxplace").text($tds.eq(4).html());//需要隐藏
					                    	$("#xxdangerlevel").text($tds.eq(5).html());
					                    	$("#xxdangercontent").text($tds.eq(7).html());
					                    	$("#xxzhenggaitime").text($tds.eq(11).html());
					                        
					                    	
					                        $.ajax({    	
					                    			url : '${pageContext.request.contextPath}/recheck_getRecheck.action',
					                    			data : {"followid" : followid},
					                    			type : 'POST',
					                    			dataType : 'json',
					                    			success : function(data) {
					                    				$("#xxrecheckperson").text(data.result.recheckman);
					                    				$("#xxrecheckcomment").text(data.result.comment);
					                    				$("#xxrechecktime").text(data.result.recheckdate);
					                    				$("#xxrecheckresult").text(data.result.recheckresult>0?"合格":"不合格");
					                    			}
					                        })
					                        $('#allInfo').modal();
					                    }
					                </script>

									<!-- 模态框 导出-->
									<div class="modal fade" id="el_Export" tabindex="-1"
										role="dialog" aria-labelledby="myModalLabel"
										aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<!--关闭符号-->
													<!--标题-->
													<h3 class="modal-title">导出提示</h3>
												</div>
												<form>
													<div class="modal-body">
														<span>是否导出当前信息？</span>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-primary">导出</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal">关闭</button>
													</div>
												</form>

											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal -->
									</div>


									<div id="paginationIDU"></div>
									<script>
										$('#paginationIDU').pagination(
												{
													//			组件属性
													"total" :${result.pageBean.totalCount},//数字 当分页建立时设置记录的总数量 1
													"pageSize" : 8,//数字 每一页显示的数量 10
													"pageNumber" : ${result.pageBean.currentPage},//数字 当分页建立时，显示的页数 1
													"pageList" : [ 8 ],//数组 用户可以修改每一页的大小，
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