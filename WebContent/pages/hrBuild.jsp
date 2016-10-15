<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>人员管理</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery-1.11.0.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		$("ul li:eq(0)").addClass("active");
	});
	function hrBuildDelete(id) {
		if(confirm("您确定要删除这条信息吗？")) {
			window.location="delete.action?id="+id;
		}
	}
</script>
<style type="text/css">
	body{
		background-image: url("${pageContext.request.contextPath}/images/bg4.jpg");
	}
	th{
		text-align:center;
		color:orange;
	}
	td{
		text-align:center;
		color:red;
	}
</style>
</head>
<body>
<div class="data_list">
		<div class="data_list_title">
			人员管理
		</div>
		<form name="myForm" class="form-search" method="post" action="search.action">
				<button class="btn btn-success" type="button" style="margin-right: 50px;" onclick="javascript:window.location='toAdd.action'">添加</button>
				<span class="data_search">
					名称:&nbsp;&nbsp;<input id="s_hrBuildName" name="s_hrBuildName" type="text"  style="width:120px;height: 30px;" class="input-medium search-query" value="${s_hrBuildName }">
					&nbsp;<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) myForm.submit()">搜索</button>
				</span>
		</form>
		<div>
			<table class="table table-striped table-bordered table-hover datatable">
				<thead>
					<tr>
						<th>编号</th>
						<th>工号</th>
						<th>名称</th>
						<th>简介</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach  varStatus="i" var="hrBuild" items="${hrBuildList }">
					<tr>
						<td>${i.count+(page-1)*pageSize }</td>
						<td>${hrBuild.workId }</td>
						<td>${hrBuild.name }</td>
						<td>${hrBuild.introduction==null||hrBuild.introduction==""?"无":hrBuild.introduction }</td>
						<td><button class="btn btn-mini btn-info" id="alter" value="${hrBuild.id }" onclick="javascript:window.location='person.action?id=${hrBuild.id }'">修改信息</button> 
						<button class="btn btn-mini btn-danger" id="delete" value="${hrBuild.id }" onclick="hrBuildDelete(${hrBuild.id})">删除信息</button></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div align="center"><font color="red">${error }</font></div>
		<div class="pagination pagination-centered">
			<ul>
				${pageCode }
			</ul>
		</div>
</div>
</body>
</html>
