package com.icss.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.icss.dao.EmpDao;
import com.icss.service.EmpService;
import com.icss.vo.DeptVO;
import com.icss.vo.Dept_id;
import com.icss.vo.EmpDeptVO;
import com.icss.vo.EmpLoginVO;
import com.icss.vo.EmpPlaceVO;
import com.icss.vo.EmpVO;
import com.icss.vo.Place;

/**
 * @ClassName: EmpServiceImpl
 * @Description: TODO(Service层接口实现)
 * @author Administrator
 * @date 2017年7月18日 上午10:16:10
 * 
 */
@Service
public class EmpServiceImpl implements EmpService {
	
	@Resource
	private EmpDao empDao;

	public EmpDao getEmpDao() {
		return empDao;
	}

	public void setEmpDao(EmpDao empDao) {
		this.empDao = empDao;
	}

	/* (非 Javadoc) 
	 * <p>Title: login</p> 
	 * <p>Description: </p> 
	 * @param empLoginVO
	 * @return 
	 * @see com.icss.service.EmpService#login(com.icss.vo.EmpLoginVO) 
	 */
	@Override
	public int login(EmpLoginVO empLoginVO) {
		return empDao.login(empLoginVO);
	}

	/* (非 Javadoc) 
	 * <p>Title: addUser</p> 
	 * <p>Description: </p> 
	 * @param empVO
	 * @return 
	 * @see com.icss.service.EmpService#addUser(com.icss.vo.EmpVO) 
	 */
	@Override
	public int addUser(EmpVO empVO) {
		// TODO Auto-generated method stub
		return empDao.addUser(empVO);
	}

	/* (非 Javadoc) 
	 * <p>Title: queryById</p> 
	 * <p>Description: </p> 
	 * @param empVO
	 * @return 
	 * @see com.icss.service.EmpService#queryById(com.icss.vo.EmpVO) 
	 */
	@Override
	public int queryById(EmpVO empVO) {
		// TODO Auto-generated method stub
		return empDao.queryById(empVO);
	}

	/* (非 Javadoc) 
	 * <p>Title: queryAllById</p> 
	 * <p>Description: </p> 
	 * @param empVO
	 * @return 
	 * @see com.icss.service.EmpService#queryAllById(com.icss.vo.EmpVO) 
	 */
	@Override
	public EmpVO queryAllById(EmpVO empVO) {
		// TODO Auto-generated method stub
		return empDao.queryAllById(empVO);
	}

	/* (非 Javadoc) 
	 * <p>Title: deleteUser</p> 
	 * <p>Description: </p> 
	 * @param empVO
	 * @return 
	 * @see com.icss.service.EmpService#deleteUser(com.icss.vo.EmpVO) 
	 */
	@Override
	public int deleteUser(EmpVO empVO) {
		// TODO Auto-generated method stub
		 return empDao.deleteUser(empVO);
	}

	/* (非 Javadoc) 
	 * <p>Title: queryAll</p> 
	 * <p>Description: </p> 
	 * @param empVO
	 * @return 
	 * @see com.icss.service.EmpService#queryAll(com.icss.vo.EmpVO) 
	 */
	/*@Override
	public List<EmpVO> queryAll(EmpVO empVO) {
		// TODO Auto-generated method stub
		return empDao.queryAll(empVO);
	}
*/
	
	@Override
	public List<EmpPlaceVO> classify() {
		// TODO Auto-generated method stub
		return empDao.classify();
	}

	@Override
	public List<EmpDeptVO> queryDept(EmpDeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.queryDept(empDeptVO);
	}

	@Override
	public DeptVO selectDept(DeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.selectDept(empDeptVO);
	}

	/* (非 Javadoc) 
	 * <p>Title: queryDeptById</p> 
	 * <p>Description: </p> 
	 * @param empDeptVO
	 * @return 
	 * @see com.icss.service.EmpService#queryDeptById(com.icss.vo.DeptVO2) 
	 */
	@Override
	public DeptVO queryDeptById(DeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.queryDeptById(empDeptVO);
	}

	@Override
	public List<Place> queryAllPlace() {
		// TODO Auto-generated method stub
		return empDao.queryAllPlace();
	}

	@Override
	public List<Dept_id> queryAllparentId() {
		// TODO Auto-generated method stub
		return empDao.queryAllparentId();
	}

	@Override
	public Dept_id queryParentName(Dept_id empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.queryParentName(empDeptVO);
	}

	@Override
	public int addDept(EmpDeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.addDept(empDeptVO);
	}

	@Override
	public int queryByDept(EmpDeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.queryByDept(empDeptVO);
	}

	@Override
	public int queryDeptByName(EmpDeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.queryDeptByName(empDeptVO);
	}

	@Override
	public int updateUser(EmpVO empVO) {
		// TODO Auto-generated method stub
		return empDao.updateUser(empVO);
	}

	@Override
	public int updateDept(EmpDeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.updateDept(empDeptVO);
	}

	@Override
	public int queryByDeptName(EmpDeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return  empDao.queryByDeptName(empDeptVO);
	}

	@Override
	public int changePassword(EmpLoginVO empLoginVO) {
		// TODO Auto-generated method stub
		return  empDao.changePassword(empLoginVO);
	}

	/* (非 Javadoc) 
	 * <p>Title: queryByDeptlevel</p> 
	 * <p>Description: </p> 
	 * @param empDeptVO
	 * @return 
	 * @see com.icss.service.EmpService#queryByDeptlevel(com.icss.vo.EmpDeptVO) 
	 */
	@Override
	public int queryByDeptlevel(EmpDeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.queryByDeptlevel(empDeptVO);
	}
	@Override	
	public List<EmpVO> queryAll(EmpVO empVO) {
	   /* int limit=((empVO.getLimit())-1)*10;
	    empVO.setLimit(limit);
	    int count= empDao.countEmpTotal(empVO);
	    JSONObject obj=new JSONObject();
	    obj.put("count", count);
	    obj.put("data", list);
	    String  json=obj.toString();*/
		List<EmpVO> list = empDao.queryAll(empVO);
	    return list;
	} 

	/* (非 Javadoc) 
	 * <p>Title: queryDeptlevel</p> 
	 * <p>Description: </p> 
	 * @param empDeptVO
	 * @return 
	 * @see com.icss.service.EmpService#queryDeptlevel(com.icss.vo.EmpDeptVO) 
	 */
	@Override
	public EmpDeptVO queryDeptlevel(EmpDeptVO empDeptVO) {
		// TODO Auto-generated method stub
		return empDao.queryDeptlevel(empDeptVO);
	}

	@Override
	public int countEmpTotal(EmpVO empVO) {
		// TODO Auto-generated method stub
		return empDao.countEmpTotal(empVO);
	}

	@Override
	public List<Dept_id> queryAlldeptId() {
		// TODO Auto-generated method stub
		return empDao.queryAlldeptId();
	}

	@Override
	public List<EmpVO> query(EmpVO empVO) {
		// TODO Auto-generated method stub
		return empDao.query();
	}

}