 <!DOCTYPE HTML PUBLIC "-//W3C//Ddiv HTML 4.01 Transitional//EN">
<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--   <link rel="stylesheet" href="../css/bootstrap.min.css">
 --><link rel="stylesheet" href="../css/bootstrap-datetimepicker.min.css">
 <script type="text/javascript" src="../js/jquery-1.11.0.min.js"></script>
 <script type="text/javascript" src="../js/moment-with-locales.min.js"></script>
  <script type="text/javascript" src="../js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="../js/add.js"></script>
<script type="text/javascript">
  $(function(){
	  /* var Entry_date =  $('#Entry_date').datetimepicker({
         format: 'YYYY-MM-DD',
         locale: moment.locale('zh-cn')
     });
     var termination_date =  $('#termination_date').datetimepicker({
         format: 'YYYY-MM-DD',
         locale: moment.locale('zh-cn')
     });

     Entry_date.on('dp.change', function (e) {
         if ($('#termination_date').val() != '') {
        	 termination_date.data('DateTimePicker').minDate(e.date);
         }
     });
     termination_date.on('click',function () {
         var date = $('#Entry_date').val();
         termination_date.data('DateTimePicker').minDate(date);
     });
 */
	 $.ajax({
		type:'post',
		dataType : 'json',
		url : '../employee/queryAllPlace',
		success : function(data){
             $(data).each(function (index,obj) {
                 $('#place').append("<option value='"+place+"'>"+obj.place+"</option>");
                 });
		  },
	   })
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

 </script>
<title>增加员工信息</title>
<style> 
div{ float:center} 
</style> 
</head> 
</head>
<body style="background-color: #faf0e6">
        	<form action="${pageContext.request.contextPath}/loginOut"
		method="post">

		<input type="submit" value="退出登录" />
	</form>
<div class="container" style="width: 90%">
    <div class="panel panel-default" style="width: 200px; height: 50px; margin: 0 auto;" >
        <div class="panel-heading">
            <span  face="微软雅黑" size="5" style="text-align: center;font-size:18px;color:blue;">添加员工信息</span>
        </div>

        <div class="panel-body">
        <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">员工编号:</label>
                <div class="col-lg-8">
                <input  class="form-control"type="text" id="userid" class="col-lg-8 form-control unEmpty">
                </div>
            </div>
            <div class="col-lg-12"></div>
            <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">员工姓名:</label>
                <div class="col-lg-8">
                    <input  class="form-control"type="text" id="name" class="col-lg-8 form-control unEmpty">
  
                </div>
            </div>
              <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">性别:</label>
                <div class="col-lg-8">
                    <select id="sex" class="form-control">
                   <option></option><option value="1">男</option>
                    <option value="0">女</option>
                 </select> 
                 </div>
            </div>
            <div class="col-lg-12"></div>
            <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">身份证号:</label>
                <div class="col-lg-8">
                    <input  class="form-control"type="text" id="identity_card" class="col-lg-8 form-control unEmpty">
                </div>
            </div>
            
                 <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">管理归属地:</label>
                <div class="col-lg-8">
                    <select  id="place" name="place" class="form-control">
                        <option value="">选择地域</option>
                    </select>
                 </div>
            </div>
            <div class="col-lg-12"></div>
            <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">工资（元）:</label>
                <div class="col-lg-8">
                    <input  class="form-control"type="text" id="wages" class="col-lg-8 form-control unEmpty">
                </div>
            </div>
            <div class="col-lg-12"></div>
            <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">邮箱:</label>
                <div class="col-lg-8">
                    <input  class="form-control"type="text" id="email" class="col-lg-8 form-control unEmpty">
                </div>
            </div>
             <div class="col-lg-12"></div>
            <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">部门编号:</label>
                <div class="col-lg-8">
                <select  id="dept_id" name="dept_id" class="form-control">
                        <option value=""></option>
                    </select>
                </div>
            </div>
              <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">入职日期:</label>
                <div class="col-lg-8">
                <input type="text" id="Entry_date" name="Entry_date" class="col-lg-8 form-control unEmpty">
               </div>
            </div>
                 <div class="form-group col-lg-6">
                <label class="col-lg-4 control-label">离职日期:</label>
                <div class="col-lg-8">
                <input type="text" id="termination_date" name="termination_date" class="col-lg-8 form-control unEmpty">
                </div>
            </div>
              <div class="panel-footer">
        <div class="text-right">
            <button type="button" class="btn btn-default" onclick="check()">提交</button>
            <button type="button" class="btn btn-default"  onclick="revert()">返回</button>
        </div>
    </div>
     </div>
      </div>
     </div>
</body>
</html>