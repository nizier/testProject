<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../js/jqPaginator.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '../employee/queryAllPlace',
			success : function(data) {
				$(data).each(
						function(index, obj) {
							$('#place').append(
									"<option value='"+place+"'>" + obj.place
											+ "</option>");
						});
			},
		})
		//初始化分页插件
		$.jqPaginator('#pagination', {
			totalPages : 10,
			visiblePages : 8,
			currentPage : 1,
			prev : '<li class="prev"><a href="javascript:;">上一页</a></li>',
			next : '<li class="next"><a href="javascript:;">下一页</a></li>',
			page : '<li class="page"><a href="javascript:;">{{page}}</a></li>',
			  onPageChange : function(num, type) {
				search(num); 
			} 
		});
	})
function search(num) {
	document.getElementById("tbody"); 
	$("#tbody").children().remove();
	var userid=$('#userid').val();
	var name=$('#name').val();
	var sex=$('#sex').val();
	var identity_card=$('#identity_card').val();
	var termination_date=$('#termination_date').val();
	var onwership_place = $("#place").find("option:selected").text(); 
			$.ajax({
			type:"get",
			url:"../employee/search",
			contentType : "application/x-www-form-urlencoded; charset=utf-8",
			data:{
				"userid":userid,
				"name":name,
				"identity_card":identity_card,
				"onwership_place":onwership_place,
				"sex":sex,
				"termination_date":termination_date,
				"limit" : num
			},
			 success: function(obj){
				 var userid=$('#userid').val();
					var name=$('#name').val();
					var sex=$('#sex').val();
					var identity_card=$('#identity_card').val();
					var termination_date=$('#termination_date').val();
					var onwership_place = $("#place").find("option:selected").text(); 
					var count;
							$.ajax({
							type:"get",
							url:"../employee/countEmpTotal",
							contentType : "application/x-www-form-urlencoded; charset=utf-8",
							data:{
								"userid":userid,
								"name":name,
								"identity_card":identity_card,
								"onwership_place":onwership_place,
								"sex":sex,
							},
							 success: function(count){
								 count = eval('(' + count + ')');
								pages = Math.ceil(count / 10);
								$('#pagination').jqPaginator('option', {
										totalPages : pages
									});
					    	 }  
					    	 
					    });  
					getList(obj); 
	    	       }  
	    	 
	    	 });  
}

function getList(obj) {
	obj = eval('(' + obj + ')');
	for (var i = 0; i < obj.length; i++) {//循环遍历出json对象中的每一个数据并显示在对应的td中
		var trStr = '';//动态拼接table
		var dept="";
		if(obj[i].name4 != null && obj[i].name4 != ""){
			dept+=obj[i].name4+" ";
		}
		if(obj[i].name3 != null && obj[i].name3 != ""){
			dept+=obj[i].name3+" ";
		}
		if(obj[i].name2 != null && obj[i].name2 != ""){
			dept+=obj[i].name2+" ";
		}
		if(obj[i].name1 != null && obj[i].name1 != ""){
			dept+=obj[i].name1+" ";
		}
		trStr += '<tr><td width="2%">' + (i + 1) + '</td>';
		trStr += '<td width="7%">' + obj[i].userid + '</td>';//对应数组表的字段值
		trStr += '<td width="4%">' + obj[i].name + '</td>';
		trStr += '<td width="2%">' + (obj[i].sex == 1 ? "男" : "女")
				+ '</td>';
		trStr += '<td width="15%">' + obj[i].identity_card + '</td>';
		trStr += '<td width="8%">' + obj[i].entry_date + '</td>';
		trStr += '<td width="8%">' + obj[i].termination_date + '</td>';
		trStr += '<td width="4%">' + obj[i].onwership_place + '</td>';
		trStr += '<td width="5%">' + obj[i].wages + '</td>';
		trStr += '<td width="13%">' + obj[i].email + '</td>';
		trStr += '<td  width="35%">' + dept+ '</td>';
		trStr += '<td><input type="button" value="查看" onclick="toSearch(\''
				+ obj[i].userid
				+ '\')"/></td>'
				+ '<td><input type="button" value="编辑" onclick="update(\''
				+ obj[i].userid
				+ '\')"/></td>'
				+ '<td><input type="button" value="删除" onclick="deleteUser(\''
				+ obj[i].userid + '\')"/></td>';
		trStr += '</tr>';
		$("#tbody").append(trStr);
	
	}
}
function add() {
	window.open('addEmp.jsp');
}
function dept() {
	window.location.href = 'deptList.jsp';
}
function reportForms() {
	window.location.href = 'reportForm.jsp';
}
function toSearch(userId) {
	window
			.open(
					'selectEmp.jsp?userid=' + userId,
					"Sample",
					"fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no, copyhistory=no,width=550,height=340,left=200,top=300");
}
function update(userId) {
	window.open('updateEmp.jsp?userid=' + userId);
}

function deleteUser(userid) {
	var msg = "您确定要删除该员工吗？";
	if (confirm(msg) == true) {
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '../employee/delete',
			data : {
				"userid" : userid
			},
			success : function(data) {
				if (data > 0) {
					alert('删除成功！');
					window.location.reload();
				} else {
					alert('删除失败！');
				}
			},
		});
	}
}

</script>
</head>
<title>员工管理系统</title>
        	<form action="${pageContext.request.contextPath}/loginOut"
		method="post">

		<input type="submit" value="退出登录" />
	</form>
<body style="background-color: #faf0e6">
	<div style="height: 220px;">&nbsp;</div>
	<div style="width: 220px; height: 50px; margin: 0 auto;">
		<font face="华文新魏" size="5"
			style="text-align: center; font-size: 25px; color: blue;">员工信息管理系统</font>
	</div>

	<!-- <div align="center"><input  style="margin-top:20px;" type="button"  value="退出"  onclick="loginOut()" /></div>  -->
	<table align="center" border="1" bordercolor="#000000"
		cellspacing="30px" style="border-collapse: collapse">
		<thead>
			<tr>
				<td align="center">员工编号<input type="text" id="userid"></td>
				<td align="center">员工姓名<input class="form-control" type="text"
					id="name"></td>
				<td align="center">身份证号<input class="form-control" type="text"
					id="identity_card"></td>
			</tr>
			<tr>
				<td align="center">性别 <select id="sex"><option></option>
						<option value="1">男</option>
						<option value="0">女</option>
				</select></td>
				<td align="center">管理归属地 <select id="place" name="place"
					class="form-control">
						<option value=""></option>
				</select></td>
				<td>是否离职 <select id="termination_date"><option></option>
						<option value="Yes">是</option>
						<option value="No">否</option>
				</select></td>
			</tr>
			<tr>
				<td align="center"><input
					style="font-size: 8px; color: black; background-color: lightblue;"
					type="button" value="查询" onclick="search(1)" /></td>
				<td align="center"><input
					style="font-size: 10px; color: black; background-color: lightblue;"
					type="button" value="新增" onclick="add()" /></td>
				<td align="center"><input
					style="font-size: 15px; color: black; background-color: lightblue;"
					type="button" value="生成报表" onclick="reportForms()" /></td>
				<td align="center"><input
					style="font-size: 10px; color: black; background-color: lightblue;"
					type="button" value="部门列表" onclick="dept()" /></td>
			</tr>

		</thead>
	</table>

	<p></p>


	<table align="center" border="1" bordercolor="#000000"
		cellspacing="30px" style="border-collapse: collapse">

		<thead>
			<tr>
				<td>序号</td>
				<td>员工编号</td>
				<td>员工姓名</td>
				<td>性别</td>
				<td align="center">身份证号</td>
				<td>入职日期</td>
				<td>离职日期</td>
				<td>管理归属地</td>
				<td>工资（元）</td>
				<td align="center">邮箱</td>
				<td align="center">部门</td>
				<td>操作</td>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>

	</table>
	<ul class="pagination" id="pagination"></ul>
</body>
</html>
