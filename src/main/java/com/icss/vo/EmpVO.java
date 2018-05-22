package com.icss.vo;

/** 
 * @ClassName: EmployeeVO 
 * @Description: TODO(定义员工类） 
 * @author wuyanfeng 
 * @date 2017��7��13�� ����1:00:23 
 *  
 */
public class EmpVO {
	/**
	 * @Fields code_id : 
	 */
	private int code_id;
	/**
	 * @Fields userid : 员工id
	 */
	private String userid;  
		
	/**
	 * @Fields name : 员工姓名
	 */
	private String name;
	
	/**
	 * @Fields sex : 员工性别
	 */
	private String sex;
	
	/**
	 * @Fields identity_card : 身份证号
	 */
	private String identity_card;
	/**
	 * @Fields entry_date : 入职日期
	 */
	private String entry_date;
		
	/**
	 * @Fields termination_date : 离职日期 
	 */
	private String termination_date;
	/**
	 * @Fields onwership_place : 归属地
	 */
	private String onwership_place;
	/**
	 * @Fields wages :工资
	 */
	private int wages;
	/**
	 * @Fields emails : 邮箱
	 */
	private String email;
	/**
	 * @Fields password : 密码
	 */
	
	private String password;
	/**
	 * @Fields dept_id : 部门id
	 */
	
	/**
	 * @Fields dept_id : 部门编号 
	 */
	private String dept_id;
	/**
	 * @Fields name1 : 上级部门名称
	 */
	private String name1;
	private String name2;
	private String name3;
	private String name4;
	private int limit; 
	 public String getDept_id() {
		return dept_id;
	}
	public void setDept_id(String dept_id) {
		this.dept_id = dept_id;
	}
	public String getPassword() {
	  return password;
	 }
	 public void setPassword(String password) {
	  this.password = password;
	 }

	//���ö���ķ���
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdentity_card() {
		return identity_card;
	}

	public void setIdentity_card(String identity_card) {
		this.identity_card = identity_card;
	}

	public String getTermination_date() {
		return termination_date;
	}

	public void setTermination_date(String termination_date) {
		this.termination_date = termination_date;
	}

	public int getCode_id() {
		return code_id;
	}

	public void setCode_id(int code_id) {
		this.code_id = code_id;
	}

	public String getEntry_date() {
		return entry_date;
	}

	public void setEntry_date(String entry_date) {
		this.entry_date = entry_date;
	}

	public String getOnwership_place() {
		return onwership_place;
	}

	public void setOnwership_place(String onwership_place) {
		this.onwership_place = onwership_place;
	}

	public int getWages() {
		return wages;
	}

	public void setWages(int wages) {
		this.wages = wages;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	public String getName1() {
		return name1;
	}
	public void setName1(String name1) {
		this.name1 = name1;
	}
	public String getName2() {
		return name2;
	}
	public void setName2(String name2) {
		this.name2 = name2;
	}
	public String getName3() {
		return name3;
	}
	public void setName3(String name3) {
		this.name3 = name3;
	}
	public String getName4() {
		return name4;
	}
	public void setName4(String name4) {
		this.name4 = name4;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}

}