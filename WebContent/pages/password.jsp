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
	$(document).ready(function(){
		$("ul li:eq(0)").addClass("active");
	});
	$(
		function(){
			$('#submit').click(
				function(){
					$.ajax({
						url:"${pageContext.request.contextPath}/changePassword.do",
						data:"userName="+$('#username').val()+"&"
								+"newPwd="+$('#newpwd').val(),
						success:function(data){
							if(data=="success"){
								$('#message').text("修改成功");
							}
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
		font-size:18px;
		text-align:center;
		color:red;
	}
</style>
</head>
<body>
<div class="data_list">
		<div class="data_list_title">
			密码修改
		</div>
		<form name="myForm" class="form-search" method="post" action="search.action">
				<button class="btn btn-success" type="button" style="margin-right: 50px;" onclick="javascript:window.location='toAdd.action'">添加</button>
				<span class="data_search">
					名称:&nbsp;&nbsp;<input id="s_hrBuildName" name="s_hrBuildName" type="text"  style="width:120px;height: 30px;" class="input-medium search-query" value="${s_hrBuildName }">
					&nbsp;<button type="submit" class="btn btn-info" onkeydown="if(event.keyCode==13) myForm.submit()">搜索</button>
				</span>
		</form>
		<div>
			<table  class="table table-striped table-bordered table-hover datatable">

					<tr>
						<td width="300px">用户名:</td>
						<td width="300px"><input id="username" name="username" value="${currentUser.userName }" type="text" class="input-block-level " disabled="disabled"></td>
						<td width="400px"></td>
					</tr>
					<tr>
						<td>密码:</td>
						<td><input id="oldpwd" name="oldpwd" value="" type="password" class="input-block-level" placeholder="旧密码:"></td>
						<td width="400px">6位到11位，不能有非字母字符</td>
					</tr>
					<tr>
						<td>新密码:</td>
						<td><input id="newpwd" name="newpwd" value="" type="password" class="input-block-level" placeholder="新密码:"></td>
						<td width="400px">6位到11位，不能有非字母字符</td>
					</tr>
					<tr>
						<td>确认密码:</td>
						<td><input id="newpwd2" name="newpwd2" value="" type="password" class="input-block-level" placeholder="再次输入新密码:"></td>
						<td width="400px">6位到11位，不能有非字母字符</td>
					</tr>
					<tr>
						<td><button id="submit" type="button" class="btn btn-danger">提交</button></td>
						<td colspan="3"><h1 id="message"></h1></td>
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