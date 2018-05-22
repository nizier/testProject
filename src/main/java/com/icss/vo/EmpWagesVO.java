/**   
 * @Title: EmpWagesVO.java 
 * @Package com.icss.vo 
 * @Description: TODO(用一句话描述该文件做什么) 
 * @author Administrator  
 * @date 2017年8月2日 下午2:44:42 
 * @version V1.0   
 */
package com.icss.vo;

/** 
 * @ClassName: EmpWagesVO 
 * @Description: TODO(这里用一句话描述这个类的作用) 
 * @author Administrator 
 * @date 2017年8月2日 下午2:44:42 
 *  
 */
public class EmpWagesVO {
	/**
	 * @Fields wagesCount : 工资众数
	 */
	private int wagesCount;
	 /**
	 * @Fields WagesScope :工资区间
	 */
	private int wagesScope;
	public int getWagesCount() {
		return wagesCount;
	}
	public void setWagesCount(int wagesCount) {
		this.wagesCount = wagesCount;
	}
	public int getWagesScope() {
		return wagesScope;
	}
	public void setWagesScope(int wagesScope) {
		this.wagesScope = wagesScope;
	}
}
