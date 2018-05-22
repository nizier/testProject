/**   
 * @Title: EmpService.java 
 * @Package com.wyf.service 
 * @Description: TODO(��һ�仰�������ļ���ʲô) 
 * @author Administrator  
 * @date 2017��7��18�� ����10:15:17 
 * @version V1.0   
 */
package com.icss.service;

import java.util.List;
import java.util.Map;

import com.icss.vo.DeptVO;
import com.icss.vo.Dept_id;
import com.icss.vo.EmpDeptVO;
import com.icss.vo.EmpLoginVO;
import com.icss.vo.EmpPlaceVO;
import com.icss.vo.EmpVO;
import com.icss.vo.Place;


public interface EmpService {

	/** 
	 * <b>Function : EmpService.login</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月3日 下午6:41:40 
	 * 
	 * @param empLoginVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int login(EmpLoginVO empLoginVO);

	/** 
	 * <b>Function : EmpService.addUser</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月4日 上午10:28:38 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int addUser(EmpVO empVO);

	/** 
	 * <b>Function : EmpService.queryById</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月4日 上午10:59:45 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int queryById(EmpVO empVO);

	/** 
	 * <b>Function : EmpService.queryAllById</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月4日 下午1:21:44 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	EmpVO queryAllById(EmpVO empVO);

	/** 
	 * <b>Function : EmpService.deleteUser</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月4日 下午1:34:10 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int deleteUser(EmpVO empVO);

	/*List<EmpVO> queryAll(EmpVO empVO);*/

	/** 
	 * <b>Function : EmpService.classify</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:23:35 
	 * 
	 * @return List<EmpPlaceVO>
	 * @throws
	 * 
	 * @author Administrator
	 */
	List<EmpPlaceVO> classify();

	List<EmpDeptVO> queryDept(EmpDeptVO empDeptVO);

	/** 
	 * <b>Function : EmpService.selectDept</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:23:32 
	 * 
	 * @param empDeptVO
	 * @return DeptVO
	 * @throws
	 * 
	 * @author Administrator
	 */
	DeptVO selectDept(DeptVO empDeptVO);

	/** 
	 * <b>Function : EmpService.queryDeptById</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月5日 下午2:32:38 
	 * 
	 * @param empDeptVO
	 * @return DeptVO
	 * @throws
	 * 
	 * @author Administrator
	 */
	
	DeptVO queryDeptById(DeptVO empDeptVO);

	/** 
	 * <b>Function : EmpService.queryAllPlace</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:22:46 
	 * 
	 * @return List<Place>
	 * @throws
	 * 
	 * @author Administrator
	 */
	List<Place> queryAllPlace();

	/** 
	 * <b>Function : EmpService.queryAllparentId</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:22:43 
	 * 
	 * @return List<Dept_id>
	 * @throws
	 * 
	 * @author Administrator
	 */
	List<Dept_id> queryAllparentId();

	/** 
	 * <b>Function : EmpService.queryParentName</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:22:39 
	 * 
	 * @param empDeptVO
	 * @return Dept_id
	 * @throws
	 * 
	 * @author Administrator
	 */
	Dept_id queryParentName(Dept_id empDeptVO);

	/** 
	 * <b>Function : EmpService.addDept</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:22:34 
	 * 
	 * @param empDeptVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int addDept(EmpDeptVO empDeptVO);

	int queryDeptByName(EmpDeptVO empDeptVO);

	/** 
	 * <b>Function : EmpService.queryByDept</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:22:28 
	 * 
	 * @param empDeptVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int queryByDept(EmpDeptVO empDeptVO);

	/** 
	 * <b>Function : EmpService.updateUser</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:22:25 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int updateUser(EmpVO empVO);

	/** 
	 * <b>Function : EmpService.updateDept</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:22:22 
	 * 
	 * @param empDeptVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int updateDept(EmpDeptVO empDeptVO);

	/** 
	 * <b>Function : EmpService.queryByDeptName</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:22:13 
	 * 
	 * @param empDeptVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int queryByDeptName(EmpDeptVO empDeptVO);

	/** 
	 * <b>Function : EmpService.changePassword</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午4:22:06 
	 * 
	 * @param empLoginVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int changePassword(EmpLoginVO empLoginVO);

	/** 
	 * <b>Function : EmpService.queryByDeptlevel</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月7日 下午3:59:56 
	 * 
	 * @param empDeptVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int queryByDeptlevel(EmpDeptVO empDeptVO);

	/** 
	 * <b>Function : EmpService.queryDeptlevel</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月9日 上午8:56:43 
	 * 
	 * @param empDeptVO
	 * @return EmpDeptVO
	 * @throws
	 * 
	 * @author Administrator
	 */
	EmpDeptVO queryDeptlevel(EmpDeptVO empDeptVO);

	/** 
	 * <b>Function : EmpService.queryAllByPage</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午3:39:26 
	 * 
	 * @param map
	 * @return List<EmpVO>
	 * @throws
	 * 
	 * @author Administrator
	 */
	List<EmpVO> queryAll(EmpVO empVO);

	int countEmpTotal(EmpVO empVO);

	List<Dept_id> queryAlldeptId();

	List<EmpVO> query(EmpVO empVO);

}