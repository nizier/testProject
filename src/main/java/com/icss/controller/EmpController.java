
package com.icss.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.icss.service.EmpService;
import com.icss.vo.DeptVO;
import com.icss.vo.Dept_id;
import com.icss.vo.EmpDeptVO;
import com.icss.vo.EmpLoginVO;
import com.icss.vo.EmpPlaceVO;
import com.icss.vo.EmpVO;
import com.icss.vo.Place;
/** 
 * @ClassName: EmpController 
 * @Description: TODO(控制层 调用service层) 
 * @author Administrator 
 * @date 2017-08-02 16:13:02 
 *  
 */
@Controller

@RequestMapping("employee")
public class EmpController {
	
	@Resource
	private EmpService empService;
	//登录
	@RequestMapping(value = "/login")
	public void login(HttpServletRequest request,HttpServletResponse response) throws Exception{
		try {
		EmpLoginVO empLoginVO=new  EmpLoginVO();
		String userid=request.getParameter("userid");
		empLoginVO.setUserid(request.getParameter("userid"));
		empLoginVO.setPassword(request.getParameter("password"));
		int count = empService.login(empLoginVO);
		PrintWriter pw = response.getWriter();
		String real="false";
		if (count > 0) {
			request.getSession().setAttribute("userid", userid);
			real= "success";
			
		}
		pw.print(real);
		pw.flush();
		pw.close();
		}catch (Exception e) {

			throw new Exception(e);
		}
        
	}

	//修改密码
	@RequestMapping(value = "/changePassword")
	public void changePassword(EmpLoginVO empLoginVO,HttpServletResponse response) throws Exception{
		try {
		
		int count = empService.changePassword(empLoginVO);
		PrintWriter pw = response.getWriter();
		String real="false";
		if (count > 0) {
			real= "success";
		}
		pw.print(real);
		pw.flush();
		pw.close();
		}catch (Exception e) {

			throw new Exception(e);
		}
        
	}
	//增加员工
	@RequestMapping(value = "/toadd")
	public void queryById(EmpVO empVO,HttpServletResponse response) throws Exception {
		try {
		
		PrintWriter pw = response.getWriter();
		int count = empService.queryById(empVO);
		String real="success";
		if (count > 0) {
			real= "false";
		}
		pw.print(real);
		pw.flush();
		pw.close();
		}catch (Exception e) {

			throw new Exception(e);
		}
	}
	//按id查询员工
	@RequestMapping(value = "/queryId")
	public void queryId(EmpVO empVO,HttpServletResponse response) throws Exception {
		try {
		
		PrintWriter pw = response.getWriter();
		int count = empService.queryById(empVO);
		String real="false";
		if (count > 0) {
			real= "success";
		}
		pw.print(real);
		pw.flush();
		pw.close();
		}catch (Exception e) {

			throw new Exception(e);
		}
	}
		
	//添加员工	
	@RequestMapping(value = "/add")
	public void addUser(EmpVO empVO,HttpServletResponse response) throws Exception {
	try {
		PrintWriter pw = response.getWriter();
		int count = empService.addUser(empVO);
		pw.print(count);
		pw.flush();
		pw.close();
	}catch (Exception e) {

		throw new Exception(e);
	  }
	}
	@RequestMapping(value = "/queryAllById")
	public void queryAllById(EmpVO empVO,HttpServletResponse response) throws Exception {
	try {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		EmpVO Emp = empService.queryAllById(empVO);
		String result = JSON.toJSONString(Emp);		
		pw.print(result);
		pw.flush();
		pw.close();
	}catch (Exception e) {
		throw new Exception(e);
	  }
	}
	@RequestMapping(value = "/delete")
	public void deleteUser(EmpVO empVO,HttpServletResponse response) throws Exception {
	try {
		PrintWriter pw = response.getWriter();
		int count = empService.deleteUser(empVO);
		pw.print(count);
		pw.flush();
		pw.close();
	}catch (Exception e) {
		throw new Exception(e);
	  }
	}
	@RequestMapping(value = "/updateUser")
	public void updateUser(EmpVO empVO,HttpServletResponse response) throws Exception {
	try {
		PrintWriter pw = response.getWriter();
		int count = empService.updateUser(empVO);
		pw.print(count);
		pw.flush();
		pw.close();
	}catch (Exception e) {
		throw new Exception(e);
	  }
	}
@RequestMapping(value = "/query")
	
	public void query(EmpVO empVO,HttpServletResponse response) throws Exception {
		try {
			
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
	    List<EmpVO> list = empService.query(empVO);
		String result = JSONArray.toJSONString(list);		

	//	String str= empService.queryAllByPage(empVO);
		pw.print(result);
		pw.flush();
		pw.close();
        }catch (Exception e) {
    		throw new Exception(e);
  	  }
		
	
	}

	@RequestMapping(value = "/search")
	
	public void queryAll(EmpVO empVO,HttpServletResponse response) throws Exception {
		try {
			
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		int limit=((empVO.getLimit())-1)*10;
		empVO.setLimit(limit);
	    List<EmpVO> list = empService.queryAll(empVO);
		String result = JSONArray.toJSONString(list);		

	//	String str= empService.queryAllByPage(empVO);
		pw.print(result);
		pw.flush();
		pw.close();
        }catch (Exception e) {
    		throw new Exception(e);
  	  }
		
	
	}
//计算员工总数
@RequestMapping(value = "/countEmpTotal")
	
	public void countEmpTotal(EmpVO empVO,HttpServletResponse response) throws Exception {
		try {
			
		response.setCharacterEncoding("utf-8");
	    int count= empService.countEmpTotal(empVO);
		PrintWriter pw = response.getWriter();
	    pw.print(count);
		pw.flush();
		pw.close();
		}catch (Exception e) {
    		throw new Exception(e);
  	  }
		
	
	}
//生成地域报表
	@RequestMapping(value = "/classify")
	public void classify(HttpServletResponse response) throws Exception {
	try {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		List<EmpPlaceVO> empPlaceVO = empService.classify();
		String result = JSONArray.toJSONString(empPlaceVO);		
		pw.print(result);
		pw.flush();
		pw.close();
	}catch (Exception e) {
		throw new Exception(e);
	  }
	}
	//查找部门
	@RequestMapping(value = "/searchDept")
	public void queryDept(EmpDeptVO empDeptVO,HttpServletResponse response) throws Exception {
	try {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		List<EmpDeptVO> empDept = empService.queryDept(empDeptVO);
		String result = JSONArray.toJSONString(empDept);		
		pw.print(result);
		pw.flush();
		pw.close();
	}catch (Exception e) {
		throw new Exception(e);
	  }
	}
	@RequestMapping(value = "/selectDept")
	public void selectDept(DeptVO empDeptVO,HttpServletResponse response) throws Exception {
	try {
		
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		DeptVO empDept = empService.selectDept(empDeptVO);
		String result = JSON.toJSONString(empDept);		
    	pw.print(result);
		pw.flush();
		pw.close();
	}catch (Exception e) {
		throw new Exception(e);
	  }
	}
	//按id查询部门
	@RequestMapping(value = "/queryDeptById")
	public void queryDeptById(DeptVO empDeptVO,HttpServletResponse response) throws Exception {
	try {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		DeptVO empDept= empService.queryDeptById(empDeptVO);
		String result = JSON.toJSONString(empDept);		
		pw.print(result);
		pw.flush();
		pw.close();
	}catch (Exception e) {
		throw new Exception(e);
	  }
	}
	//查询所有地域
	@RequestMapping(value = "/queryAllPlace")
	public void queryAllPlace( HttpServletRequest request,HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
        List<Place> places =  empService.queryAllPlace();
        String result = JSON.toJSONString(places);		
		pw.print(result);
		pw.flush();
		pw.close();
    }
	//查询所有上级部门id
	@RequestMapping(value = "/queryAllparentId")
	public void queryAllparentId(HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
        List<Dept_id> parentId =  empService.queryAllparentId();
        String result = JSON.toJSONString(parentId);		
		pw.print(result);
		pw.flush();
		pw.close();
    }
	//查询所有部门id
	@RequestMapping(value = "/queryAlldeptId")
	public void queryAlldeptId(HttpServletResponse response) throws Exception{
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
        List<Dept_id> deptId =  empService.queryAlldeptId();
        String result = JSON.toJSONString(deptId);		
		pw.print(result);
		pw.flush();
		pw.close();
    }
	//查询所有部门名字
	@RequestMapping(value = "/queryParentName")
	public void queryParentName(Dept_id empDeptVO,HttpServletResponse response) throws Exception{
		
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
        Dept_id parentId =  empService.queryParentName(empDeptVO);
        String result = JSON.toJSONString(parentId);		
		pw.print(result);
		pw.flush();
		pw.close();
    }
	//校验部门
	@RequestMapping(value = "/addDeptCheck")
	public void queryByDept(EmpDeptVO empDeptVO,HttpServletResponse response) throws Exception {
		try {
		
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		int count = empService.queryByDept(empDeptVO);
		String real="success";
		if (count > 0) {
			real= "false";
		}
		pw.print(real);
		pw.flush();
		pw.close();
		}catch (Exception e) {

			throw new Exception(e);
		}
	}
	//校验部门id
	@RequestMapping(value = "/deptCheck")
	public void queryDeptByName(EmpDeptVO empDeptVO,HttpServletResponse response) throws Exception {
		try {
		
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		int count = empService.queryDeptByName(empDeptVO);
		String real="success";
		if (count > 0) {
			real= "false";
		}
		pw.print(real);
		pw.flush();
		pw.close();
		}catch (Exception e) {

			throw new Exception(e);
		}
	}
	//增加员工
	@RequestMapping(value = "/addDept")
	public void addDept(EmpDeptVO empDeptVO,HttpServletResponse response) throws Exception {
	try {
		
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		int count = empService.addDept(empDeptVO);
		pw.print(count);
		pw.flush();
		pw.close();
	}catch (Exception e) {

		throw new Exception(e);
	  }
	}
	//校验部门
	@RequestMapping(value = "/checkDept")
	public void queryByDeptName(EmpDeptVO empDeptVO,HttpServletResponse response) throws Exception {
		try {
		
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		int count = empService.queryByDeptName(empDeptVO);
		String real="success";
		if (count > 0) {
			real= "false";
		}
		pw.print(real);
		pw.flush();
		pw.close();
		}catch (Exception e) {

			throw new Exception(e);
		}
	}
	//查询所有部门id
	@RequestMapping(value = "/queryDeptlevel")
	public void queryDeptlevel(EmpDeptVO empDeptVO,HttpServletResponse response) throws Exception {
		try {
		
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		EmpDeptVO empDept = empService.queryDeptlevel(empDeptVO);
		String result = JSON.toJSONString(empDept);		
		pw.print(result);
		pw.flush();
		pw.close();
		}catch (Exception e) {

			throw new Exception(e);
		}
	}
	//查询所有部门级别
	@RequestMapping(value = "/checkDeptlevel")
	public void queryByDeptlevel(EmpDeptVO empDeptVO,HttpServletResponse response) throws Exception {
		try {
		
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		int count = empService.queryByDeptlevel(empDeptVO);
		String real="false";
		if (count > 0) {
			real= "success";
		}
		pw.print(real);
		pw.flush();
		pw.close();
		}catch (Exception e) {

			throw new Exception(e);
		}
	}
	//修改部门
	@RequestMapping(value = "/updateDept")
	public void updateDept(EmpDeptVO empDeptVO,HttpServletResponse response) throws Exception {
	try {
		response.setCharacterEncoding("utf-8");
		PrintWriter pw = response.getWriter();
		int count = empService.updateDept(empDeptVO);
		pw.print(count);
		pw.flush();
		pw.close();
	}catch (Exception e) {
		throw new Exception(e);
	  }
	}
	public EmpService getEmpService() {
		return empService;
	}

	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}
	
	
}
