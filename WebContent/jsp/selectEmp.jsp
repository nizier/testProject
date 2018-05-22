<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../js/empList.js"></script>
<script type="text/javascript">
function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
} 
$(function(){$.ajax({
		type:'post',
		dataType : 'json',
		url : '../employee/query',
		data:{
		"userid":getQueryString("userid")
		},
		success : function(response){
		viewSearch(response)	 }
	   });
});
function viewSearch(obj){
	/* var sexname="男";
	 if ("0"==obj[0].sex){
		 sexname="女";
	 } */
	    $("#userid").val(obj[0].userid);
		$("#name").val(obj[0].name);
		$("#sex").val((obj[0].sex)=1?"男":"女");
		$("#identity_card").val(obj[0].identity_card);
		$("#entry_date").val(obj[0].entry_date);
		$("#termination_date").val(obj[0].termination_date);
		$("#place").val(obj[0].onwership_place);
		$("#wages").val(obj[0].wages);
		$("#email").val(obj[0].email);
		$("#dept").val(obj[0].name1+','+obj[0].name2+','+obj[0].name3+','+obj[0].name4);	
	 }
	 function revert(){
	window.location.href='empList.jsp';
}
</script>
<title>员工详细信息</title>
</head>
<body style="background-color: #faf0e6">
<div style="height: 10px;">&nbsp;</div>
		<div style="width: 200px; height: 60px; margin: 0 auto;">
			<font face="华文新魏" size="10" style="text-align: center;font-size:25px;color:blue;">员工详细信息</font>
		</div>
		<p></p>
 <!-- <table class="table table-condensed">  --> 
  <table align="center"border="1" bordercolor="#000000" cellspacing="30px" style="border-collapse:collapse">  
     <thead>  
         <tr><td >员工编号<input style="background:transparent; border:none;"type="text" id="userid" disabled="disabled"></td>
            <td >员工姓名<input style="background:transparent; border:none;"type="text" id="name" disabled="disabled"></td></tr>
        <tr><td>性别 <input style="background:transparent; border:none;"type="text" id="sex" disabled="disabled"></td>
        <td>身份证号<input style="background:transparent; border:none;"type="text" id="identity_card" disabled="disabled"></td></tr>
        <tr><td>入职日期 <input style="background:transparent; border:none;"type="text" id="entry_date" disabled="disabled" ></td>
        <td>离职日期<input style="background:transparent; border:none;"type="text" id="termination_date" disabled="disabled"></td></tr>
        <tr><td>管理归属地
         <input style="background:transparent; border:none;"type="text" id="place" disabled="disabled"></td>
        <td>工资（元）<input style="background:transparent; border:none;" type="text" id="wages" disabled="disabled"></td></tr>
        <tr><td>邮箱<input style="background:transparent; border:none;" type="text" id="email" disabled="disabled"></td></tr>
        <tr><td >部门<input style="width: 400px ;background:transparent;" type="text" id="dept" disabled="disabled"></td></tr>
         
    </thead>  
</table>  
</body>
</html>