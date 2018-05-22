function adduser() {
	var userid = $('#userid').val();
	var name = $('#name').val();
	var sex = $('#sex').val();
	var identity_card = $('#identity_card').val();
	var Entry_date = $('#Entry_date').val();
	var termination_date = $('#termination_date').val();
	var onwership_place = $("#place").find("option:selected").text(); 
//	var onwership_place = $('#place').val();
	var wages = $('#wages').val();
	var email = $('#email').val();
	//var dept_id = $('#dept_id').val();
	var dept_id = $("#dept_id").find("option:selected").text(); 
	$.ajax({
		type : "post",
		url : "../employee/add",
		data : {
			"userid" : userid,
			"name" : name,
			"sex" : sex,
			"identity_card" : identity_card,
			"Entry_date" : Entry_date,
			"termination_date" : termination_date,
			"onwership_place" : onwership_place,
			"wages" : wages,
			"email" : email,
			"password" : 111111,
			"dept_id" : dept_id
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
	window.location.href = 'empList.jsp';
}
function check() {
	var userid = $("#userid").val();
	var name = $("#name").val();
	var identityCard = $("#identity_card").val();
	var entryDate = $("#Entry_date").val();
	var termination = $("#termination_date").val();
	var wages = $("#wages").val();
	var email = $("#email").val();
	// 校验ID
	var checkId = /^\d{10}$/;
	var checkIdentityCard = /^\d{15}|\d{18}$/;
	var checkEntryDate = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
	var checkTermination = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
	var checkWages = /^[0-9]+\.{0,1}[0-9]{0,2}$/;
	var checkEmail = /\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
	if (checkId.test(userid) === false) {
		alert("id为10位非空数字");
	} else {
		$
				.ajax({
					type : "post",
					url : "../employee/toadd",
					data : {
						"userid" : userid,
					},
					success : function(data) {
						if (data == "success") {

							// 校验身份证号
							if (checkIdentityCard.test(identityCard) === false) {

								alert("身份证为15或18位数字");
								return false;
							}
							// 校验入职日期
							else if (checkEntryDate.test(entryDate) === false) {
								alert("您输入的入职日期格式错误 例：2010-02-10");
								return false;
							}

							// 校验离职日期
							else if (!checkTermination.test(termination)
									&& termination != "") {
								alert("你输入的离职日期不正确，应该为2010-02-10的格式，或者为空");
								return false;

							} else if (checkTermination.test(termination)
									&& termination < entryDate) {
								alert("你输入的离职日期不对，入职日期应该在离职日期之前");
								return false;
							}

							// 校验工资
							else if (checkWages.test(wages) === false) {
								alert("你输入的工资格式错误，应为整数或小数");
								return false;
							} else if (checkEmail.test(email) === false
									&& "" != email) {
								alert("邮箱格式错误");
								return false;
							} else {
								adduser();
							}
						} else
							alert('用户已存在，不能添加！');
					}
				});

	}
}