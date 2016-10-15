<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<head>
<script type="text/javascript">
$(document).ready(function(){
	$("ul li:eq(0)").addClass("active");
});
</script>
<style type="text/css">
	body{
		background-image: url("${pageContext.request.contextPath}/images/bg4.jpg");
	
	}
</style>
</head>
<body>
<div >
	<div class=blank style="padding-top: 100px;padding-left: 100px;">
		<font color="blue" size="20"><b>欢迎您,${currentUser.role==0?"管理员":"用户"}!</b></font>
	</div>
</div>
</body>