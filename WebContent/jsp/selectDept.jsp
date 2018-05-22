<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../js/deptList.js"></script>
<script type="text/javascript">
function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
} 
$(function(){$.ajax({
		type:'post',
		dataType : 'json',
		url : '../employee/selectDept',
		data:{
		"dept_id":getQueryString("dept_id")
		},
		success : function(response){
		viewSearch(response)	 }
	   });
});
function viewSearch(obj){
	    $("#dept_id").val(obj.dept_id);
		$("#dept_name").val(obj.name);
		$("#parent_id").val(obj.parent_id);
		$("#parent_name").val(obj.parent_name);
		$("#dept_level").val(obj.dept_level);
		$("#dept_totalName").val(obj.name1+','+obj.name2+','+obj.name3+','+obj.name4);	
	 }

</script>
<title>员工部门详情</title>
</head>
<body style="background-color: #faf0e6">
<div style="height: 50px; width: 2000px ;">&nbsp;</div>
		<div style="width: 200px; height: 50px; margin: 0 auto;">
			<font face="微软雅黑" size="5" style="text-align: center;font-size:18px;color:blue;">员工部门信息详情</font>
		</div>
	
 <table align="center"border="1" bordercolor="#000000" cellspacing="40px" style="border-collapse:collapse">  
  <thead>  
         <tr><td align="center" >部门编号<input style="background:transparent; border:none;"type="text" id="dept_id" disabled="disabled"></td>
            <td  align="center">部门名称<input style="background:transparent; border:none;"type="text" id="dept_name" disabled="disabled"></td></tr>
        <tr><td align="center">上级部门ID <input style="background:transparent; border:none;"type="text" id="parent_id" disabled="disabled"></td>
        <td align="center">上级部门名称<input style="background:transparent; border:none;"type="text" id="parent_name" disabled="disabled"></td></tr>
        <tr><td align="center">部门级别 <input style="background:transparent; border:none;"type="text" id="dept_level" disabled="disabled" ></td></tr>
         <tr><td  align="center">部门全名称<input style="width: 400px ;background:transparent;border:none;" type="text" id="dept_totalName" disabled="disabled"></td></tr>
        
    <thead>  
      
</table> 
  

</body>
</html>