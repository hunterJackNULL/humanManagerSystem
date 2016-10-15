<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>人事管理系统</title>
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/jQuery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery-1.11.0.js"></script>
<script type="text/javascript">
	$(
		function(){
			$('#home').click(
				function(){
					if(!confirm("确定要退出吗?")){
						return false;
					}
					
				}		
			);
			
		}		
	);
</script>
<style type="text/css">
	  .bs-docs-sidenav {
    background-color: #fff;
    border-radius: 6px;
    box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
    padding: 0;
    width: 228px;
}

.bs-docs-sidenav > li > a {
    border: 1px solid #e5e5e5;
    display: block;
    padding: 8px 14px;
    margin: 0 0 -1px;
}
.bs-docs-sidenav > li:first-child > a {
    border-radius: 6px 6px 0 0;
}
.bs-docs-sidenav > li:last-child > a {
    border-radius: 0 0 6px 6px;
}
.bs-docs-sidenav > .active > a {
    border: 0 none;
    box-shadow: 1px 0 0 rgba(0, 0, 0, 0.1) inset, -1px 0 0 rgba(0, 0, 0, 0.1) inset;
    padding: 9px 15px;
    position: relative;
    text-shadow: 0 1px 0 rgba(0, 0, 0, 0.15);
    z-index: 2;
}
.bs-docs-sidenav .icon-chevron-right {
    float: right;
    margin-right: -6px;
    margin-top: 2px;
    opacity: 0.25;
}
.bs-docs-sidenav > li > a:hover {
    background-color: #f5f5f5;
}
.bs-docs-sidenav a:hover .icon-chevron-right {
    opacity: 0.5;
}
</style>

</head>
<body>
<div class="container-fluid" style="padding-right: 0px;padding-left: 0px;">
	<div region="north" style="height: 100px;background-image: url('${pageContext.request.contextPath}/images/top.gif')">
		<div align="left" style="width: 80%;height:100px ;float: left;padding-top: 40px;padding-left: 30px;" ><b><font color="red" size="6" >人事管理系统</font></b></div>
		<div style="padding-top: 50px;padding-right: 20px;"><h3>当前用户：&nbsp;<font color="red">${currentUser.userName }</font></h4></div>
	</div>
</div>
	<div>
		<div class="row-fluid">
			<div class="span2 bs-docs-sidebar" >
				<ul class="nav nav-list bs-docs-sidenav">
					<li><a href="${pageContext.request.contextPath}/blank.action"><i class="icon-chevron-right"></i>首页</a></li>
					<!--  <li><a href="${pageContext.request.contextPath}/hrBuild?action=list"><i class="icon-chevron-right"></i>人员管理</a></li>
					<li><a href="${pageContext.request.contextPath}/password?action=preChange"><i class="icon-chevron-right"></i>修改密码</a></li>-->
					<li><a href="${pageContext.request.contextPath}/list.action"><i class="icon-chevron-right"></i>人员管理</a></li>
					<li><a href="${pageContext.request.contextPath}/password.do"><i class="icon-chevron-right"></i>修改密码</a></li>
					<li><a id="home" href="${pageContext.request.contextPath}/logout.do"><i class="icon-chevron-right"></i>退出系统</a></li>
				</ul>
			</div>
					<div class="span8">
					
						<jsp:include page="${mainPage==null?'blank.jsp':mainPage}"></jsp:include>
					</div>
			</div>
		</div>
</body>
</html>