/**   
 * @Title: Dept.java 
 * @Package com.icss.vo 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author Administrator  
 * @date 2017年8月7日 下午4:28:34 
 * @version V1.0   
 */
package com.icss.vo;

/** 
 * @ClassName: Dept 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author Administrator 
 * @date 2017年8月7日 下午4:28:34 
 *  
 */
public class Dept {
	private int dept_id;

	private String dept_name;
	private String parent_id;

	private int dept_level;
	private String parent_name;
	public int getDept_id() {
		return dept_id;
	}
	public void setDept_id(int dept_id) {
		this.dept_id = dept_id;
	}
	public String getDept_name() {
		return dept_name;
	}
	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}
	public String getParent_id() {
		return parent_id;
	}
	public void setParent_id(String parent_id) {
		this.parent_id = parent_id;
	}
	public int getDept_level() {
		return dept_level;
	}
	public void setDept_level(int dept_level) {
		this.dept_level = dept_level;
	}
	public String getParent_name() {
		return parent_name;
	}
	public void setParent_name(String parent_name) {
		this.parent_name = parent_name;
	}

}
