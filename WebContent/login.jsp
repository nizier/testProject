<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">

<script type="text/javascript">
$(function(){
	$("#userid").change(function(){
		var userid = $('#userid').val();
		var param = {
	            "userid" :userid,
	        };
	        $.ajax({
	    		url : 'employee/queryId',
	            type : "post",
	            data : param,
	            success : function(response) {
	                if (response == "success") {
	                	$("#useridflag").attr("color","green");
	                	$("#useridflag").text("√")
	                	} else{
	                	$("#useridflag").attr("color","red");
                        $("#useridflag").text("×")
	                }
	            }
	        });
		});

	$("#password").change(function(){
		var userid = $('#userid').val();
		var password = $('#password').val();
		var param = {
	            "userid" :userid,
	            "password" :password,
	        };
	        $.ajax({
	    		url : 'employee/login',
	            type : "post",
	            data : param,
	            success : function(response) {
	                if (response == "success") {
	                	$("#passwordflag").attr("color","green");
	                	$("#passwordflag").text("√")
	                	} else{
	                	$("#passwordflag").attr("color","red");
                        $("#passwordflag").text("×")
	                }
	            }
	        });
		});
});
function login(){
	if(("√"== $("#useridflag").text())&&("√"== $("#passwordflag").text())){
		window.location.href='jsp/empList.jsp';
	}
	else{
		alert("登录失败,用户名或密码错误，请重新输入");
	}
}
function Modify(userId){
	window.open ('jsp/modifyPassword.jsp?userid='+userId,"Sample","fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no, copyhistory=no,width=550,height=340,left=200,top=300");

}
</script>
<title>登录页面</title>
</head>
<body style="background-color: #faf0e6">
	<div style="height: 150px;">&nbsp;</div>
	<div style="width: 200px; height: 60px; margin: 0 auto;">
		<font face="华文彩云" size="10"
			style="text-align: center; font-size: 24px; color: blue;">欢迎登录员工系统</font>
	</div>
	<p></p>
	<!-- <table class="table table-condensed">  -->
	<table align="center" frame=void bordercolor="#000000"
		cellspacing="50px" style="border-collapse: collapse">
		<thead>
			<tr>
				<td align="center" style="font-size: 17px;" >用户名<input class="form-control"
					style="font-size: 10px;" type="text" id="userid"></td>
				<td><font color="red" size="4" id="useridflag">*</font></td>
					
			</tr>

			<tr>
				<td align="center" style="font-size: 17px;">密码&nbsp;&nbsp;&nbsp;<input
					class="form-control" style="font-size: 10px;" type="password"
					id="password"></td>
				<td><font color="red" size="4" id="passwordflag">*</font></td>
					
			</tr>
			<tr>
				<td align="center"><input
					style="font-size: 17px; color: black; background-color: lightblue;"
					type="button" value="登陆" onclick="login();" /></td>
			</tr>
			<tr>
				<td align="center"><input
					style="font-size: 17px; color: black; background-color: lightblue;"
					type="button" value="密码修改" onclick="Modify($('#userid').val())" /></td>
			</tr>
		</thead>
	</table>
</body>
</html>