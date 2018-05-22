/**   
 * @Title: EmpLoginVO.java 
 * @Package com.icss.vo 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author Administrator  
 * @date 2017年8月2日 下午7:53:14 
 * @version V1.0   
 */
package com.icss.vo;

/** 
 * @ClassName: EmpLoginVO 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author Administrator 
 * @date 2017年8月2日 下午7:53:14 
 *  
 */
public class EmpLoginVO {

	/**
	 * @Fields userid : 用户名
	 */
	private String userid; 
	/**
	 * @Fields password : 用户密码
	 */
	private String password;
	private String newPassword;
	public String getNewPassword() {
		return newPassword;
	}
	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
	public String getCheckPassword() {
		return checkPassword;
	}
	public void setCheckPassword(String checkPassword) {
		this.checkPassword = checkPassword;
	}
	private String checkPassword;

	 public String getPassword() {
	  return password;
	 }
	 public void setPassword(String password) {
	  this.password = password;
	 }
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
}
