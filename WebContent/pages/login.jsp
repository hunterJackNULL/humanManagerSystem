<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录界面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/javascript/jquery-1.11.0.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">

	$(
		function(){
			rightImgUrl = "../images/right.jpg";
			wrongImgUrl = "../images/wrong.jpg";
			$('#username').blur(
					function(){
						if($('#username').val()==""){
							alert("请输入用户名");
						}
					}		
				);
				$('#password').blur(
						function(){
							if($('#password').val()==""){
								alert("请输入密码");
							}
						}		
					);
				$('#checkCode').blur(
						function(){
							var code = this.value;
							if(code==""){
								alert("请输入验证码");
							}else{
								$.ajax({
									url:"${pageContext.request.contextPath}/checkCode.do?checkCode="+code,
									success:function(data){
								
										if(data=="ok"){
											$("#checkCodeimg").attr({"src":rightImgUrl,"width":"100px"});	
										
											$("#code").attr("value","true");
											
										}else{
									
											$("#checkCodeimg").attr({"src":wrongImgUrl,"width":"100px"});
				
										}
										$("#checkCodeimg").show(200);
									}
								});
							}
						}		
					);
			$('#submit').click(
				function(){
					if($('#code').val()=="false"){
						alert("请输入正确的验证码!");
						return false;
					}else if($('#username').val()==""||$('#password').val()==""||$('#checkCode').val()==""){
						alert("请填完整！！");
					return false;}
				}	
			);
			$("#reset").click(
				function(){
					$("input").val("");
					$('#checkCodeimg').attr({"src":"","width":"0px"});
					$('#checkCodeimg').hide(20);
				}		
			);
			$("#refresh").click(
				function(){
					$('#checkCodePicture').attr("src","${pageContext.request.contextPath}/validateColor?time="+new Date());
					return false;
				}		
			)
		}		
	)
</script>

</head>
<style type="text/css">
	  body {
        padding-top: 100px;
        padding-bottom: 20px;
        background-image: url('${pageContext.request.contextPath}/images/beauty.jpg');
        background-position: center;
		background-repeat: no-repeat;
		background-attachment: fixed;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 0px;
        margin: 0 auto 20px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"]{
      	opacity:0.8;
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
        
      } 
      h1{
      	color: red;
      	text-align: center;
      }
      #checkCodeText{
      	color:orange;
      	font-size: 16px;
      	text-align: left;
      }
      a{
      	color:blue;
      	font-size: 20px;
      	text-align: right;
      }
      h2{
      	color:white;
      	text-align: center;
      }
</style>
<body>
	<form class="form-signin" action="${pageContext.request.contextPath}/login.do?time=<%= new Date().getTime() %>" method="post">
		<h1>人事管理系统</h1><br><br>
		<input id="username" name="username" value="" type="text" class="input-block-level" placeholder="用户名:">
		<input id="password" name="password" value="" type="password" class="input-block-level" placeholder="密    码:"><br>
		 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
		<label class="radio inline">
      	  	<input id="admin" type="radio" name="userType" value="admin" checked /> <b><font color="purple" size="4px" >系统管理员</font></b>
		</label>
		 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
		<label class="radio inline">
      	  	<input id="user" type="radio" name="userType" value="user"  /> <b><font color="purple" size="4px">用户</font></b>
		</label>	
		<table>
			<tr>
				<td ><img id="checkCodePicture" alt="checkCode" src="${pageContext.request.contextPath}/validateColor"></td>
				<td ><a><i><h4 id="refresh">看不清？点我刷新验证码!</h4></i></a></td>
			</tr>
		</table>
		<table>
			<tr>
				<td><label id="checkCodeText"><b>验证码:</b></label></td>
				<td><input id="checkCode" type="text" class="input" name="checkCode" placeHolder="请输入:"></td>
				<td><img id="checkCodeimg" src=""  width="0px" hidden="hidden"></img></td>
			</tr>
		</table>
		<label class="checkbox">
        	<font size="5px" id="error" color="red">${error }</font>  
        </label>
         &nbsp;&nbsp;&nbsp;&nbsp;
        <button id="submit" class="btn btn-large btn-success" type="submit">登录</button>
        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <button id="reset" class="btn btn-large btn-warning" type="button" >重置</button><br><br>
        <input type="hidden" id="code" value="false">
        <a href="register.jsp"><h4>还没有账号？点此注册！</h4></a>
	</form>
	<br><br>
	<h2>@copyright************Mr.J*************@copyright</h2>
</body>
</html>