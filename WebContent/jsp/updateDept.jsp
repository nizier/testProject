<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
	function getQueryString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
		var r = window.location.search.substr(1).match(reg);
		if (r != null)
			return unescape(r[2]);
		return null;
	}
	$(function() {
		view();
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '../employee/queryAllparentId',
			success : function(data) {
				$(data).each(function(index, obj) {
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
										 }
									})
								}else {
									$("#parent_name").hide();
									$("#dept_level").hide();
								
							 }
						});
	})
	
function view(){ 
		$.ajax({
			type : 'post',
			dataType : 'json',
			url : '../employee/selectDept',
			data : {
				"dept_id" : getQueryString("dept_id")
			},
			success : function(response) {
				 viewSearch(response);
				 
			}
		});
}

	function viewSearch(obj) {
		$("#dept_id").val(obj.dept_id);
		$("#dept_name").val(obj.name);
		$("#parent_id").find("option:selected").text(obj.parent_id); 
		$("#parent_name").find("option:selected").text(obj.parent_name); 
		$("#dept_level").find("option:selected").text(obj.dept_level);

		
	}

function deptcheck() {
	 debugger;
	 var dept_id = $('#dept_id').val();
	 var newDept_level = $("#dept_level").find("option:selected").text();
	 $.ajax({
			type : "post",
			url : "../employee/queryDeptlevel",
			data : {
				"dept_id" : dept_id,
			},
			success : function(data) {
				data = eval('(' + data + ')');
				var oldDept_level=data.dept_level;
				if (newDept_level==oldDept_level) {
					var dept_id = $('#dept_id').val();
					var parent_id = $("#parent_id").find("option:selected").text(); 
					 var dept_name = $('#dept_name').val();
					 var dept_level = $("#dept_level").find("option:selected").text();
				 	$.ajax({
							type : "post",
							url : "../employee/checkDept",
							data : {
								"dept_id" : dept_id,
								"dept_name" : dept_name,
								"parent_id" : parent_id,
								"dept_level" : dept_level
							},
							success : function(data) {
								if (data == "success") {
									updateDept();
								} else {
									alert('部门名称重复！');
									 window.location.reload();
								    }
							    }
						      });
				           } else{
					 
					 CheckDeptLevel();
					 
					}
			}
	})
}
 function CheckDeptLevel() {
	 var dept_id = $('#dept_id').val();
	  $.ajax({
		      
				type : "post",
				url : "../employee/checkDeptlevel",
				data : {
					"dept_id" : dept_id,
				},
				success : function(data) {
					if (data == "success") {
					 alert('该部门下有子部门，不能随意修改其部门级别!');
					 window.location.reload();
					 }
				}
			})
 }
function updateDept() {
		var dept_id = $('#dept_id').val();
		var parent_id = $("#parent_id").find("option:selected").text();
		var dept_name = $('#dept_name').val();
		var dept_level = $("#dept_level").find("option:selected").text();
		//var dept_level = $('#dept_level').val();
		var msg = "您确定要修改该部门信息吗？";
		if (confirm(msg) == true) {
			$.ajax({
				type : "get",
				url : "../employee/updateDept",
				data : {
					"dept_id" : dept_id,
					"dept_name" : dept_name,
					"parent_id" : parent_id,
					"dept_level" : dept_level
				},
				success : function(data) {
					if (data != 0) {
						alert('修改成功！');
						window.close();
					} else
						alert('修改失败！');
				}

			});
		}
	}
	function revert() {
		window.location.href = 'deptList.jsp';
	}
</script>
        	<form action="${pageContext.request.contextPath}/loginOut"
		method="post">

		<input type="submit" value="退出登录" />
	</form>
<title>修改部门信息</title>
</head>
<body style="background-color: #faf0e6">
	<div style="height: 150px;">&nbsp;</div>
	<div style="width: 200px; height: 60px; margin: 0 auto;">
		<font face="华文新魏" size="10"
			style="text-align: center; font-size: 20px; color: blue;">填入要修改的部门信息</font>
	</div>
	<p></p>
	<table align="center" border="1" bordercolor="#000000"
		cellspacing="40px" style="border-collapse: collapse">
		<thead>
			<tr>
				<td align="center">部门编号<input
					style="background: transparent; border: none;" type="text"
					id="dept_id" disabled="disabled"></td>
				<td align="center">部门名称<input style="background: transparent;"
					type="text" id="dept_name"></td>
			</tr>
			<tr>
				<td>上级部门ID <select id="parent_id" name="parent_id"
					class="form-control">
						<option value="">请选择</option>
				</select></td>
				<td>上级部门名称 <select id="parent_name" name="parent_name">
						<option value=""></option>
				</select></td>
			</tr>
			<tr>
				<td align="center">部门级别 <select id="dept_level">
				<option value=""></option>
				
				</select></td>
		<thead>
	</table>
	<div align="center">
		<input type="button" value="提交" onclick="deptcheck()"> <input
			type="button" value="返回" onclick="revert();">
	</div>

</body>
</html>