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
<style>
.error {
	color: red;
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
						<span>隐患管理 </span><span>> 现场处理</span>
					</div>

					<div class="panel-body el_main">

						<!--内容-->
						<div class=" col-md-12">

							<!--索引-->
							<div class="row el_queryBox">

								<form action="${baseurl }/queryView_findDanger.action"
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
													<option value="未四定"
														<c:if test="${'未四定' eq dangerstatus}">selected</c:if>>未四定</option>
													<option value="已现场处理"
														<c:if test="${'已现场处理' eq dangerstatus}">selected</c:if>>已现场处理</option>
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

										<div class="col-md-3 el_qlmQuery">
											<div class="input-group" role="toolbar">
												<%-- <span class="el_spans el_chooseSpan">责任人&nbsp;&nbsp;&nbsp;：</span>
												<input type="text" class="form-control" name="manager"
													value="${manager }" /> --%>
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
												<div class="col-md-3">
													<button class="btn btn-primary" data-toggle="modal"
														data-target="#el_Export">导出</button>
												</div>
											</div>

										</div>
									</div>

									<!--表格
                            内容都提取到json里边
                        -->
									<table class="table table-hover table-bordered">
										<thead>
											<tr>
												<th>序号</th>
												<th>检查日期</th>
												<th>检查单位</th>
												<th>检查人</th>
												<th>隐患内容</th>
												<th>级别</th>
												<th>类型</th>
												<th>责任单位</th>
												<th>地点</th>
												<th>状态</th>
												<th width="130">操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="danger"
												items="${result.pageBean.productList }" varStatus="status">
												<tr>
													<td>${ status.index + (result.pageBean.currentPage-1)*8+1}
														<!-- 隐藏一个发现班次 --> <input type="hidden" class="findclass"
														value="${danger.classtype }">
													</td>
													<td><fmt:formatDate value="${danger.findtime }"
															pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate></td>
													<td>${danger.checkunit }</td>
													<td>${danger.findperson }</td>
													<td>${danger.content }</td>
													<td>${danger.dangergrade }</td>
													<td>${danger.type }</td>
													<td>${danger.unit }</td>
													<td>${danger.address }</td>
													<td>${danger.dangerstatus }</td>
													<td><c:if test="${danger.dangerstatus eq '未四定' }">
															<a href="javascript:void(0)"
																onClick="el_setFour(this,${danger.dangerid})">现场处理</a>
														</c:if> <!-- 隐藏域 用于存放隐患id --> <input type="hidden" id="dangerId"
														value="${danger.dangerid }" /> <c:if
															test="${danger.dangerstatus eq '已现场处理' }">
															<a href="javascript:void(0)" onClick="allInfo(this)">详情</a>
														</c:if></td>
												</tr>

											</c:forEach>

										</tbody>
									</table>

									<!-- 模态框 现场处理-->
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
													<h3 class="modal-title">安全隐患-现场处理录入</h3>
												</div>

												<div class="modal-body">
													<h3>基本信息:</h3>
													<div class="el_parperInfo">
														<table>
															<tr>
																<td>检查日期：</td>
																<td id="checkdate"></td>
																<td>检查人：</td>
																<td id="checkperson"></td>
															</tr>
															<tr>
																<td>检查单位：</td>
																<td id="checkunit"></td>
																<td>地点：</td>
																<td id="xg_address"></td>
															</tr>
															<tr>
																<td>隐患状态：</td>
																<td id="dangerstatus1"></td>
																<td>隐患级别：</td>
																<td id="dangergrade1"></td>
															</tr>
															<tr>
																<td>责任单位：</td>
																<td id="unit"></td>
																<td>发现班次：</td>
																<td id="classtype1"></td>
															</tr>
															<tr>
																<td>隐患内容：</td>
																<td colspan="3" id="dangercontent"></td>
															</tr>
														</table>
													</div>
													<br /> <br />
													<h3>&nbsp;&nbsp;录入现场处理信息:</h3>
													<form
														action="${pageContext.request.contextPath }/danger/spot_add.action"
														id="handleform" method="POST">
														<input type="hidden" id="indangerid"
															name="spotdispose.dangerid" />
														<div class="input-group el_modellist" role="toolbar">
															<span class="el_spans">安全技术措施：</span> <label
																class="el_radioBox el_radioBox2"> <input
																type="radio" name="spotdispose.hassafemeasure"
																id="noqualified" checked value="1"> 有
															</label> <label class="el_radioBox el_radioBox2"> <input
																type="radio" name="spotdispose.hassafemeasure" value="0">无
															</label>
														</div>

														<div class="input-group el_modellist" role="toolbar">
															<span class="el_spans">处理措施：</span>
															<textarea id="mtchulicuoshi" class="form-control texta"
																rows="10" name="spotdispose.disposemeasure"></textarea>
														</div>

														<div class="input-group el_modellist" role="toolbar">
															<span class="el_spans">处理时间：</span> <input
																class="datainp wicon" id="optsdate" type="text"
																placeholder="开始日期" value="" readonly
																name="spotdispose.disposedate">
														</div>


														<div class="input-group el_modellist" role="toolbar">
															<span class="el_spans">处&nbsp;&nbsp;理&nbsp;人：</span> <input
																id="mtchuliren" type="text"
																class="form-control el_modelinput"
																name="spotdispose.disposeperson" />
														</div>

														<div class="modal-footer">
															<!-- <button  type="submit" class="btn btn-primary">保存</button> -->
															<button id="submitButton" onclick="saveButton()"
																type="button" class="btn btn-primary">保存</button>
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
													<h3 class="modal-title">安全隐患-现场处理详情</h3>
												</div>
												<form>
													<div class="modal-body">
														<div class="el_parperInfo">
															&nbsp;&nbsp;安全隐患基本信息
															<table>
																<tr>
																	<td>检查日期：</td>
																	<td id="xqcheckdate"></td>
																	<td>检查人：</td>
																	<td id="xqcheckperson"></td>
																</tr>
																<tr>
																	<td>检查单位：</td>
																	<td id="xqcheckunit"></td>
																	<td>地点：</td>
																	<td id="xqaddress"></td>
																</tr>
																<tr>
																	<td>隐患类型：</td>
																	<td id="xqdangertype"></td>
																	<td>隐患级别：</td>
																	<td id="xqdangergrade"></td>
																</tr>
																<tr>
																	<td>隐患内容：</td>
																	<td id="xqdangercontent" colspan="3"></td>
																</tr>
																<tr>
																	<td>责任单位：</td>
																	<td id="xqunit"></td>
																	<!-- <td>责任负责人</td>
																	<td id="xqmanger"></td> -->
																</tr>
															</table>

															<br /> &nbsp;&nbsp;现场处理信息
															<table>
																<tr>
																	<td>处理时间：</td>
																	<td id="yhdealdate"></td>
																	<td>安全技术措施：</td>
																	<td id="yhtecmeasure"></td>
																	<!-- <td>复查结果</td>
                                                        <td>合格</td> -->
																</tr>
																<tr>
																	<td>处理人</td>
																	<td id="yhdealperson"></td>
																</tr>
																<tr>
																	<td>处理措施：</td>
																	<td id="yhdealmeasure"></td>
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

									<!--分页-->
									<div id="paginationIDU"></div>

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

<script src="<%=path%>/js/hd/handle.js"></script>

</html>