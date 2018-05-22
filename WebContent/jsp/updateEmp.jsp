<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
function getQueryString(name) { 
	var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i"); 
	var r = window.location.search.substr(1).match(reg); 
	if (r != null) return unescape(r[2]); return null; 
} 
$(function(){
	viewSearch();
	$.ajax({
		type:'post',
		dataType : 'json',
		url : '../employee/queryAllPlace',
		success : function(data){
	        $(data).each(function (index,obj) {
	            $('#place').append("<option value='"+place+"'>"+obj.place+"</option>");
	            });
		     },
	      });
		 $.ajax({
			type : 'post',
			dataType : 'json',
			url : '../employee/queryAlldeptId',
			success : function(data) {
				$(data).each(function(index, obj) {
							$('#dept_id').append(
									"<option value='"+dept_id+"'>"
											+ obj.dept_id + "</option>");
							
						});
			  }
		});
		
})
function viewSearch() {
	
	$.ajax({
		type:'get',
		dataType : 'json',
		url : '../employee/queryAllById',
		data:{
		"userid":getQueryString("userid")
		},
		success : function(response){
		view(response);
		 }
	   });
	}   
function view(obj){
	    $("#userid").val(obj.userid);
		$("#name").val(obj.name);
		$("#sex").val(obj.sex);
		$("#identity_card").val(obj.identity_card);
		$("#entry_date").val(obj.entry_date);
		$("#termination_date").val(obj.termination_date);
		$("#place").find("option:selected").text(obj.onwership_place); 
		$("#wages").val(obj.wages);
		$("#email").val(obj.email);	
		$("#dept_id").find("option:selected").text(obj.dept_id); 
	//	$("#dept_id").val(obj.dept_id);	

	 }
function check() {
    var identityCard = $("#identity_card").val();
    var entryDate = $("#entry_date").val();
    var termination = $("#termination_date").val();
    var wages = $("#wages").val();
    var email = $("#email").val();
    //校验ID
    var checkId =/^\d{10}$/;
    var checkIdentityCard =/^\d{15}|\d{18}$/;
    var checkEntryDate =/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
    var checkTermination =/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
    var checkWages =/^[0-9]+\.{0,1}[0-9]{0,2}$/;
    var checkEmail =/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
    					 				
       //校验身份证号
 	 if(checkIdentityCard.test(identityCard) === false){
      
        alert("身份证为15或18位数字");
        return false;
    }
    //校验入职日期
    else if(checkEntryDate.test(entryDate) === false){
        alert("您输入的入职日期格式错误 例：2010-02-10");
        return false;
    }
    
  //校验离职日期
    else if(!checkTermination.test(termination)&& termination!=""){
			alert("你输入的离职日期不正确，应该为2010-02-10的格式，或者为空");
			return false;
		
      }
    else if(checkTermination.test(termination)&&termination<entryDate){
		alert("你输入的离职日期不对，入职日期应该在离职日期之前");
		return false;	
	}
   
  //校验工资
    else if(checkWages.test(wages) === false){
        alert("你输入的工资格式错误，应为整数或小数");
        return false;
    }
     else if(checkEmail.test(email) === false && ""!=email){
        alert("邮箱格式错误");
        return false;
    }
     else{
    	 updateUser();
    	 }
 	}
 function updateUser(){
	var userid=$('#userid').val();
	var name=$('#name').val();
	var sex=$('#sex').val();
	var identity_card=$('#identity_card').val();
	var entry_date=$('#entry_date').val();
	var termination_date=$('#termination_date').val();
	var onwership_place = $("#place").find("option:selected").text(); 
	var wages=$('#wages').val();
	var email=$('#email').val();
	var dept_id = $("#dept_id").find("option:selected").text(); 
	var msg = "您确定要修改该员工信息吗？";
	 if (confirm(msg) == true) {
			$.ajax({
			type:"post",
			url:"../employee/updateUser",
			data:{
			"userid":userid,
			"name":name,
			"sex":sex,
			"identity_card":identity_card,
			"entry_date":entry_date,
			"termination_date":termination_date,
			"onwership_place":onwership_place,
			"wages":wages,
			"email":email,
			"dept_id":dept_id
			},
		success : function(data) {
		if(data!=0){
			alert('修改成功！');
			 window.close();
		}else
			alert('修改失败！');
	}
	
});}
}
function revert(){
	window.location.href='empList.jsp';
}
</script>
        	<form action="${pageContext.request.contextPath}/loginOut"
		method="post">

		<input type="submit" value="退出登录" />
	</form>
<title>员工信息修改</title>
</head>
<body style="background-color: #faf0e6">
<div style="height: 150px;">&nbsp;</div>
		<div style="width: 200px; height: 60px; margin: 0 auto;">
			<font face="华文新魏" size="10" style="text-align: center;font-size:20px;color:blue;">填入要修改的员工信息</font>
		</div>
		<p></p>
<table align="center" frame=void  bordercolor="#000000" cellspacing="10px" style="border-collapse:collapse">  
    <thead>  
        <tr><td align="center">员工编号<input style="background:transparent; border:none;"type="text" id="userid" disabled="disabled"></td></tr>
        <tr><td align="center">员工姓名<input class="form-control" type="text" id="name" ></td>
        <td align="center">性别
        <select id="sex" ><option value="1">男</option><option value="0">女</option>
        </select></td></tr>
        <tr><td>身份证号<input class="form-control" type="text" id="identity_card" ></td>
        <td>入职日期 <input type="text" id="entry_date" ></td></tr>
        <tr><td>离职日期<input type="text" id="termination_date" ></td>
        <td align="center">管理归属地
        <select  id="place" name="place" class="form-control">
                        <option value="">选择地域</option>
                    </select></td></tr>
        <tr><td>工资（元）<input class="form-control" type="text" id="wages" ></td>
        <td>邮箱<input class="form-control" type="text" id="email" ></td></tr>
        <tr><td>部门
        <select  id="dept_id" name="dept_id" class="form-control">
                        <option value=""></option>
                    </select></td></tr>
               <tr><td><input type="button" value="提交" onclick="check()"/></td>
            <td><input type="button" value="返回" onclick="revert()"/></td></tr>  
    </thead>  
</table>  
</body>
</html>