<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:"post",
		url:"../employee/classify",
		 success: function(obj){
	     obj = eval('(' + obj + ')');
    	 for (var i = 0; i <obj.length; i++) {//循环遍历出json对象中的每一个数据并显示在对应的td中
    	 var trStr = '';//动态拼接table
    	 trStr += '<tr><td align="center" width="10%">' + obj[i].selection + '</td>';//对应数组表的字段值
    	 trStr += '<td align="center" width="5%">' + obj[i].man + '</td>';
    	 trStr += '<td align="center" width="5%">' + obj[i].woman + '</td>';
    	 trStr += '</tr>';  
         $("#form").append(trStr);
    	 } 
    	 },
    	 error: function (error) {
    	 alert(error);
    	 }
        });  
});
</script>
 <form action="${pageContext.request.contextPath}/loginOut"
		method="post">

		<input type="submit" value="退出登录" />
	</form>
<title>生成报表</title>
</head>
<body style="background-color: #faf0e6">
<div style="height: 150px;">&nbsp;</div>
		<div style="width: 200px; height: 60px; margin: 0 auto;">
			<font face="华文新魏" size="15" style="text-align: center;font-size:24px;color:blue;">员工地域统计显示</font>
		</div>
 <table align="center" border="1" bordercolor="#000000" cellspacing="15px" style="border-collapse:collapse">  
    <thead>  
        <tr><td align="center">地域</td><td align="center">男</td><td align="center">女</td></tr>
       </thead> 
       <tbody id="form">
       </tbody>    
</table>  
</body>
</html>