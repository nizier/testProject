function search() {
	
	 document.getElementById("tbody"); 
	 $("#tbody").children().remove();
	var dept_id = $('#dept_id').val();
	var dept_name = $('#dept_name').val();
	var dept_level = $('#dept_level').val();
	$.ajax({
				type : "post",
				url : "../employee/searchDept",
				data : {
					"dept_id" : dept_id,
					"dept_name":dept_name,
					"dept_level":dept_level
				},
				success : function(obj) {
					obj = eval('(' + obj + ')');
					for (var i = 0; i < obj.length; i++) {// 循环遍历出json对象中的每一个数据并显示在对应的td中
						var trStr = '';// 动态拼接table
						var dept="";
						var str="";
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
						trStr += '<tr><td align="center" width="5%">' + (i + 1)
								+ '</td>';
						trStr += '<td align="center" width="10%">'
								+ obj[i].dept_id + '</td>';// 对应数组表的字段值
						trStr += '<td align="center" width="10%">'
								+ obj[i].dept_name + '</td>';
						if(obj[i].parent_name != null && obj[i].parent_name != ""){
							str+=obj[i].parent_name+" ";
						}
						trStr += '<td align="center" width="15%">'
								+ str + '</td>';
						trStr += '<td align="center" width="8%">'
								+ obj[i].dept_level + '</td>';
						trStr += '<td  width="35%">' + dept+ '</td>';
						trStr += '<td align="center"><input type="button" value="查看" onclick="toSearch(\''
								+ obj[i].dept_id
								+ '\')"/>'
								+ '<input type="button" value="编辑" onclick="update(\''
								+ obj[i].dept_id
								+ '\')"/>'
								+ '<input type="button" value="删除" onclick="deleteDept(\''
								+ obj[i].dept_id + '\')"/></td>';
						trStr += '</tr>';
						$("#tbody").append(trStr);
					}
				},
				error : function(error) {
					alert(error);
				}
			});
}
function add() {
	window.open('addDept.jsp');
}

function toSearch(dept_id) {

	window.open('selectDept.jsp?dept_id=' + dept_id,"Sample","fullscreen=no,toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=no,resizable=no, copyhistory=no,width=550,height=340,left=200,top=300");
}
function update(dept_id) {
	window.open('updateDept.jsp?dept_id=' + dept_id);
}

function deleteDept(dept_id) {
	$.ajax({
		type : "post",
		url : "../employee/checkDeptlevel",
		data : {
			"dept_id" : dept_id,
		},
		success : function(data) {
			if (data == "success") {
				var msg = "您确定要删除该员工吗？";
				if (confirm(msg) == true) {
					$.ajax({
						type : 'post',
						dataType : 'json',
						url : '../employee/deleteDept',
						data : {
							"dept_id" : dept_id
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
			}else{
			alert('该部门下有子部门，不能随意修改删除该部门!');
		}
		
		}
	});
}
