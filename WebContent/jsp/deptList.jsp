<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<title>员工管理系统</title>
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../js/deptList.js"></script>
</head>
        	<form action="${pageContext.request.contextPath}/loginOut"
		method="post">

		<input type="submit" value="退出登录" />
	</form>
<body style="background-color: #faf0e6">
	<div style="height: 200px;">&nbsp;</div>
	<div style="width: 200px; height: 50px; margin: 0 auto;">
		<font face="微软雅黑" size="5"
			style="text-align: center; font-size: 18px; color: blue;">部门信息列表</font>
	</div>
	<table align="center" border="1" bordercolor="#000000"
		cellspacing="30px" style="border-collapse: collapse">

		<thead>
			<tr>
				<td align="center">部门编号<input class="form-control" type="text"
					id="dept_id"></td>
				<td align="center">部门名称<input class="form-control" type="text"
					id="dept_name"></td>
				<td align="center">部门级别 <select id="dept_level"><option value=""></option>
						<option value="1">1级</option>
						<option value="2">2级</option>
						<option value="3">3级</option>
						<option value="4">4级</option>
				</select></td>
			</tr>
			<tr>
				<td align="center"><input
					style="font-size: 16px; color: black; background-color: lightblue;"
					type="button" value="查询" onclick="search()" /></td>
				<td align="center"><input
					style="font-size: 16px; color: black; background-color: lightblue;"
					type="button" value="新增" onclick="add()" /></td>
			</tr>
		</thead>
	</table>
	<p></p>
	<table align="center" border="1" bordercolor="#000000"
		cellspacing="30px" style="border-collapse: collapse">

		<thead>
			<tr>
				<td align="center">序号</td>
				<td align="center">部门编号</td>
				<td align="center">部门名称</td>
				<td align="center">上级部门名称</td>
				<td align="center">部门级别</td>
				<td align="center">部门全名称</td>
				<td align="center">操作</td>
			</tr>
		</thead>
		<tbody id="tbody">
		</tbody>

	</table>
</body>
</html>