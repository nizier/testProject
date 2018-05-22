/**   
 * @Title: EmpPlaceVO.java 
 * @Package com.icss.vo 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author Administrator  
 * @date 2017年8月2日 下午2:47:20 
 * @version V1.0   
 */
package com.icss.vo;

/** 
 * @ClassName: EmpPlaceVO 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author Administrator 
 * @date 2017年8月2日 下午2:47:20 
 *  
 */
public class EmpPlaceVO {
	private String selection;
	/**
	 * @Fields man : ��
	 */
	private int man;
	public int getMan() {
		return man;
	}
	public void setMan(int man) {
		this.man = man;
	}
	public int getWoman() {
		return woman;
	}
	public void setWoman(int woman) {
		this.woman = woman;
	}
	/**
	 * @Fields woman : Ů
	 */
	private int woman;
	public String getSelection() {
		return selection;
	}
	public void setSelection(String selection) {
		this.selection = selection;
	}
	
}
