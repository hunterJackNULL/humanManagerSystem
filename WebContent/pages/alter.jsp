<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery-1.11.0.js"></script>

<script type="text/javascript">
	$(
		function(){
			$('#alter').click(
				function(){
					var id = $('#id').val();
					var workId = $('#workId').val();
					var name = $('#name').val();
					var introduction = $('#introduction').val();
					$.ajax({
						url:"${pageContext.request.contextPath}/alter.action",
						data:"data="+"{workId:"+"'"+workId+"'"+
							 ",name:"+"'"+name+"'"+
							 ",introduction:"+"'"+introduction+"'"+
							 ",id:"+"'"+id+"'"+
							 "}",
						success:function(data){ 
							if(data="success")
							$('#message').text("修改成功");
							}
						
					});		
				}
			);
		}		
	);
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
			修改信息
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
						<th>工号</th>
						<th>名称</th>
						<th>简介</th>
						<th>操作</th>
					</tr>
				</thead>
					<tr>
						<td width="100px" height="30px"><input id="workId"  value="${person.workId}" type="text" class="input-block-level" ></td>
						<td width="200px"><input  id="name" value="${person.name }" type="text" class="input-block-level" ></td>
						<td width="300px"><input  id="introduction" value="${person.introduction==null||person.introduction==''?'无':person.introduction }" type="text" class="input-block-level" ></td>
						<td><button class="btn btn-danger" id="alter"  >提交</button> </td>
					</tr>
					<tr>
						<td colspan="4"><h1 id="message"></h1></td>
					</tr>
				</tbody>
			</table>
					<input type="hidden" id="id" value="${person.id }">
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