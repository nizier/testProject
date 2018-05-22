<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../js/add.js"></script>
<script type="text/javascript">
	$(function() {
		$("#parent_name").hide(); 
		$("#dept_level").hide();//初始化的时候第二个下拉列表隐藏  
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '../employee/queryAllparentId',
			success : function(data) {
				$(data).each(
						function(index, obj) {
							$('#parent_id').append(
									"<option value='"+parent_id+"'>"
											+ obj.parent_id + "</option>");
						});

			}
		});

		$("#parent_id").change(
				function() {//如果第一个下拉列表的值改变则调用此方法 
					var parentId = $("#parent_id").find("option:selected")
							.text();
					if (parentId != null && "请选择" != parentId) {
						$.ajax({
							type : 'post',
							dataType : 'json',
							url : '../employee/queryParentName',
							data : {
								"dept_id" : parentId
							},
							success : function(data) {
								$("#parent_name option").remove();
								$("#dept_level option").remove();
								$("#parent_name").append(
										"<option value='"+parent_name+"'>"
												+ data.parent_name
												+ "</option>");
								$("#dept_level").append(
										"<option value='"+dept_level+"'>"
												+ (data.dept_level*1+1)
												+ "</option>");
								$("#parent_name").show();//把第二个下拉列表展示
								$("#dept_level").show();
							},
						});

					} else {
						$("#parent_name").hide();
						$("#dept_level").hide();
						
					};
					
				});
		
	})
	function check() {
		var dept_id = $('#dept_id').val();
		// 校验部门ID
		var checkId = /^\d{4}$/;
		if (checkId.test(dept_id) === false) {
			alert("部门id为4位非空数字");
		} else {
			$.ajax({
				type : "post",
				url : "../employee/addDeptCheck",
				data : {
					"dept_id" : dept_id,
				},
				success : function(data) {
					if (data == "success") {
						deptCheck();
					} else {
						alert('部门已存在，不能添加！');
					}
				},
			})
		}
	}
	function deptCheck() {
		debugger;
		var parent_id = $("#parent_id").find("option:selected").text();
		var dept_name = $('#dept_name').val();
		$.ajax({
			type : "post",
			url : "../employee/deptCheck",
			data : {
				"dept_name" : dept_name,
				"parent_id" : parent_id,
			},
			success : function(data) {
				if (data == "success") {
					addDept();
				} else {
					alert('部门名称重复！');
				}
			}
		});
	}
	function addDept() {
		var dept_id = $('#dept_id').val();
		var dept_name = $('#dept_name').val();
		var parent_id = $("#parent_id").find("option:selected").text();
		var dept_level = $('#dept_level').val();
		$.ajax({
			type : "post",
			url : "../employee/addDept",
			data : {
				"dept_id" : dept_id,
				"dept_name" : dept_name,
				"parent_id" : parent_id,
				"dept_level" : dept_level
			},
			success : function(data) {
				if (data > 0) {
					alert('添加成功！');
					window.close();
				} else
					alert('添加失败！');
			}
		});
	}
	function revert() {
		window.location.href = 'deptList.jsp';
	}
</script>
	<form action="${pageContext.request.contextPath}/loginOut"
		method="post">

		<input type="submit" value="退出登录" />
	</form>
<title>增加员工部门信息</title>
</head>
<body style="background-color: #faf0e6">
	<div style="height: 200px;">&nbsp;</div>
	<div style="width: 200px; height: 50px; margin: 0 auto;">
		<font face="微软雅黑" size="5"
			style="text-align: center; font-size: 18px; color: blue;">部门信息</font>
	</div>
		<table align="center" border="1" bordercolor="#000000"
			cellspacing="40px" style="border-collapse: collapse">

			<thead>
				<tr>
					<td align="center">部门 ID  <input class="form-control" type="text"
						id="dept_id">*</td>
					<tr><td align="center">部 门 名 称<input class="form-control" type="text"
						id="dept_name">*</td>
				</tr>
				<tr>
					<td>上级部门ID <select id="parent_id" name="parent_id"
						class="form-control">
							<option value="">请选择</option>
					</select>*</td></tr>
					<tr><td>上级部门名称 <select id="parent_name" name="parent_name">
							<option value=""></option>
					</select></td>
				</tr>
				<tr>
					<td align="center">部门级别 <select id="dept_level" name="dept_level">
							<option value=""></option>
					</select></td>
				</tr>
			</thead>
		</table>
		<div align="center">
			<input type="button" value="提交" onclick="check();"> <input
				type="button" value="返回" onclick="revert();">
		</div>


</body>
</html>