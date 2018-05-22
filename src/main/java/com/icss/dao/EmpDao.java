/**   
 * @Title: EmpDao.java 
 * @Package com.wyf.dao 
 * @Description: TODO(��һ�仰�������ļ���ʲô) 
 * @author Administrator  
 * @date 2017��7��18�� ����10:20:49 
 * @version V1.0   
 */
package com.icss.dao;

import java.util.List;

import com.icss.vo.DeptVO;
import com.icss.vo.Dept_id;
import com.icss.vo.EmpDeptVO;
import com.icss.vo.EmpLoginVO;
import com.icss.vo.EmpPlaceVO;
import com.icss.vo.EmpVO;
import com.icss.vo.Place;

/** 
 * @ClassName: EmpDao 
 * @Description: TODO(Dao层) 
 * @author Administrator 
 * @date 2017年7月26日 上午8:23:17 
 *  
 */
public interface EmpDao {

	/** 
	 * <b>Function : EmpDao.login</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月3日 下午6:43:03 
	 * 
	 * @param empLoginVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int login(EmpLoginVO empLoginVO);

	/** 
	 * <b>Function : EmpDao.addUser</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月4日 上午10:31:46 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int addUser(EmpVO empVO);

	/** 
	 * <b>Function : EmpDao.queryById</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月4日 上午11:00:17 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int queryById(EmpVO empVO);

	/** 
	 * <b>Function : EmpDao.queryAllById</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月4日 下午1:22:26 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	EmpVO queryAllById(EmpVO empVO);

	/** 
	 * <b>Function : EmpDao.deleteUser</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月4日 下午1:34:55 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int deleteUser(EmpVO empVO);

	/** 
	 * <b>Function : EmpDao.queryAll</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月4日 下午5:06:11 
	 * 
	 * @param empVO
	 * @return EmpVO
	 * @throws
	 * 
	 * @author Administrator
	 */
	List<EmpVO> queryAll(EmpVO empVO);

	List<EmpPlaceVO> classify();

	List<EmpDeptVO> queryDept(EmpDeptVO empDeptVO);

	DeptVO selectDept(DeptVO empDeptVO);

	/** 
	 * <b>Function : EmpDao.queryDeptById</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月5日 下午2:37:23 
	 * 
	 * @param empDeptVO
	 * @return DeptVO2
	 * @throws
	 * 
	 * @author Administrator
	 */
	DeptVO queryDeptById(DeptVO empDeptVO);


	List<Place> queryAllPlace();

	List<Dept_id> queryAllparentId();

	Dept_id queryParentName(Dept_id empDeptVO);

	int addDept(EmpDeptVO empDeptVO);

	int queryDeptByName(EmpDeptVO empDeptVO);

	int queryByDept(EmpDeptVO empDeptVO);

	int updateUser(EmpVO empVO);

	int updateDept(EmpDeptVO empDeptVO);

	int queryByDeptName(EmpDeptVO empDeptVO);

	int changePassword(EmpLoginVO empLoginVO);

	/** 
	 * <b>Function : EmpDao.queryByDeptlevel</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月7日 下午4:00:35 
	 * 
	 * @param empDeptVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int queryByDeptlevel(EmpDeptVO empDeptVO);

	/** 
	 * <b>Function : EmpDao.queryDeptlevel</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月9日 上午8:57:19 
	 * 
	 * @param empDeptVO
	 * @return EmpDeptVO
	 * @throws
	 * 
	 * @author Administrator
	 */
	EmpDeptVO queryDeptlevel(EmpDeptVO empDeptVO);

	/** 
	 * <b>Function : EmpDao.countEmpTotal</b>
	 * <br>
	 * <b>Description : TODO(这里用一句话描述这个方法的作用) </b>
	 * <br>
	 * <b>Date :</b> 2017年8月10日 下午3:30:02 
	 * 
	 * @param empVO
	 * @return int
	 * @throws
	 * 
	 * @author Administrator
	 */
	int countEmpTotal(EmpVO empVO);

	List<Dept_id> queryAlldeptId();

	List<EmpVO> query();
	
		
}
