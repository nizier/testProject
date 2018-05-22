<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改密码</title>
</head>
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
} 
$(function(){
    $("#userid").val(getQueryString("userid"));

	$("#oldPassword").change(function(){
		var param = {
	            "userid" :getQueryString("userid"),
	            "password" : $("#oldPassword").val()
	        };
	        $.ajax({
	    		url : '../employee/login',
	            type : "post",
	            data : param,
	            success : function(response) {
	                if (response == "success") {
	                	$("#flag").attr("color","green");
	                	$("#flag").text("√")
	                	} else{
	                	$("#flag").attr("color","red");
                        $("#flag").text("×")
	                }
	            }
	        });
		});
});
function submit(){
	if("×"== $("#flag").text()){
     //	alert("您的原密码输入错误");
		return;
	}
	var newPassword = $("#newPassword").val();
	var checkPassword = $("#checkPassword").val();
	var userid= $("#userid").val();
	if(newPassword==checkPassword){
		var param = {
                "userid" : userid,
                "newPassword" :newPassword
            };
		$.ajax({
            url : "../employee/changePassword",
            type : "post",
            data : param,
            success : function(response) {
                if (response == "success") {
                   alert("修改成功");
                   window.close();
                } else{
                	alert("修改失败");
                }
            }
        });
	}else{
		alert("您输入的两次密码不一致");
	}
}
function ModifyPassword(){
    var userid = $('#userid').val();
	var oldPassword = $('#oldPassword').val();
	var newPassword = $('#newPassword').val();
	var checkPassword = $('#checkPassword').val();
	if(newPassword==checkPassword){
    $.ajax({
		type:'post',
		dataType : 'json',
		url : '../employee/changePassword',
		data:{
		"userid":userid,
		"newPassword":newPassword,
		"oldPassword":oldPassword,
		},
		success : function(data) {
			if(data==1){
				alert('修改密码成功！');
				window.close();
			}else
				alert('修改密码失败！');
		}
		
	});}
	else{
		alert('两次输入的密码不同！请重新输入');
		window.location.href='modifyPassword.jsp';
	}
}

</script>
<form action="${pageContext.request.contextPath}/loginOut" method="post">

	<input type="submit" value="退出登录" />
</form>
<body style="background-color: #faf0e6">
	<table>
		<tr>
			<td>用户名</td>
			<td><input type="userid" id="userid"></td>
    	</tr>
		<tr>
			<td>原密码</td>
			<td><input type="password" id="oldPassword"></td>
			<td><font color="red" size="2" id="flag">*</font></td>
		</tr>
		<tr>
			<td>修改后密码</td>
			<td><input type="password" id="newPassword"></td>
			<td><font color="red" size="2" >*</font></td>
			</tr>
		<tr>
			<td>请重复密码</td>
			<td><input type="password" id="checkPassword"></td>
			<td><font color="red" size="2" id="flagnew">*</font></td>
			
		</tr>
		<tr>
			<td colspan="2"><input type="button" value="确认" onclick="submit()"/></td>
		</tr>
	</table>
</body>
</html>