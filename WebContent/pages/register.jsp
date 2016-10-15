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
						var name = $('#username').val();
						if(name ==""){
							alert("请输入用户名");
						}else{
							$.ajax({
								url:"${pageContext.request.contextPath}/checkName.do?userName="+name,
								success:function(data){
									if(data=="ok"){
							
										$("#nameimg").attr("src","../images/right.jpg");	
									}else{
								
										$("#nameimg").attr("src","../images/wrong.jpg");
			
									}
								}
							});
							
						}
						
					}		
				);
				$('#password').blur(
						function(){
							var pwd = $('#password').val();
							if(pwd ==""){
								alert("请输入密码");
							}else if (pwd.length<6){
								alert("密码少于6位")
							}
						}		
					);
				$('#password2').blur(
						function(){
							if(!($('#password').val()==$('#password2').val())){
								$('#passwordimg').attr("src",wrongImgUrl);
								alert("两次密码不一致");
							}else{
								$('#passwordimg').attr("src",rightImgUrl);
							}
						}		
					);
			
			$('#submit').click(
				function(){
					if($('#code').val()=="false"){
						alert("请输入正确的验证码!");
						return false;
					}else if($('#username').val()==""||$('#password').val()==""||$('#checkCodeIpt').val()==""){
						alert("请填完整！！");
					return false;}
				}	
			);
			$('#checkCodeIpt').blur(
				function(){
					var code = this.value;
					if(code==""){
						alert("请输入验证码");
						return false;
					}else{
						$.ajax({
							url:"${pageContext.request.contextPath}/checkCode.do?checkCode="+code,
							success:function(data){
								if(data=="ok"){
						
									$("#checkCodeimg").attr("src",rightImgUrl);	
									$("#code").attr("value","true");
								}else{
							
									$("#checkCodeimg").attr("src",wrongImgUrl);
		
								}
							}
						});
					}
				}		
			);
			$("#reset").click(
				function(){
					$("input").val("");
					$('.judge').attr("src","");
				}		
			);
			$("#refresh").click(
				function(){
					$('#checkCode').attr("src","${pageContext.request.contextPath}/validateColor?time="+new Date());
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
        background-image: url('${pageContext.request.contextPath}/images/bg2.jpg');
		background-size:100%;
		background-repeat: no-repeat;
		background-attachment: fixed;
      }

      .form-signin {
        max-width: 340px;
        padding: 19px 29px 0px;
        margin: 0 auto 20px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
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
      	color:blue;
      	font-size: 20px;
      	text-align: left;
      }
      a{
      	color:blue;
      	font-size: 20px;
      	text-align: right;
      }
      h2{
      	color:orange;
      	text-align: center;
      }
      td{
      	color:green;
      	font-size: 18px;
      	font-weight: bold;
      }
</style>
<body>
	<form class="form-signin" action="${pageContext.request.contextPath}/register.do?time=<%=new Date().getTime()%>" method="post">
		<h1>用户注册</h1><br><br>
		
		
		 &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
		
		<table cellpadding="3px" >
			<tr>
				<td>用户名:<font color="red">*</font></td><td><input id="username" name="username" value="" type="text" class="input-block-level" placeholder="用户名:"></td><td><img id="nameimg" src='' class='judge' width='20px'></td>
			</tr>
			<tr>
				<td>密码:<font color="red">*</font></td><td><input id="password" name="password" value="" type="password" class="input-block-level" placeholder="密    码:"></td><td>&nbsp;</td>
			</tr>
			<tr>
				<td>确认密码:<font color="red">*</font></td><td><input id="password2" name="password2" value="" type="password" class="input-block-level" placeholder="密    码:"><img src="" width="20px"></td><td><img class='judge' id="passwordimg" src='' width='20px'></td>
			</tr>
			<tr>
				<td colspan="3">
				账户类型:
				<label class="radio inline">
      	  		<input id="admin" type="radio" name="userType" value="admin" checked /> <b><font color="purple" size="4px" >系统管理员</font></b>
      	  		</label>
   
			<label class="radio inline">
      	  	<input id="user" type="radio" name="userType" value="user"  /> <b><font color="purple" size="4px">用户</font></b>
			</label>	
				</td>
			</tr>
			<tr>
				<td><img id="checkCode" src="${pageContext.request.contextPath}/validateColor"></td>
				<td><a><i><h4 id="refresh">看不清？点我刷新验证码!</h4></i></a></td>
			</tr>
			<tr>
				<td><label id="checkCodeText"><b>验证码:</b></label></td>
				<td><input id="checkCodeIpt" value="" type="text" name="checkCode" placeHolder="请输入:"></td>
				<td><img id="checkCodeimg"class='judge' src='' width='20px'></td>
			</tr>
		</table>
		<label class="checkbox">
        	<font size="5px" id="error" color="red">${error }</font>  
        </label>
         &nbsp;&nbsp;&nbsp;&nbsp;
        <button id="submit" class="btn btn-large btn-success" type="submit">注册</button>
         &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
         &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
		 <button id="reset" class="btn btn-large btn-warning" type="button" >重置</button><br><br>
        <input type="hidden" id="code" value="false">
        <a href="login.jsp"><h4>已有账号？点此登录！</h4></a>
	</form>
	<br><br>
	<h2>@copyright************Mr.J*************@copyright</h2>
</body>
</html>