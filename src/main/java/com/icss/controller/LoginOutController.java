package com.icss.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.icss.service.EmpService;

@Controller
public class LoginOutController {

	@Resource
	private EmpService empService;


	@RequestMapping(value = "/loginOut", method = RequestMethod.POST)
	public String loginOut(HttpServletRequest request,HttpServletResponse response)throws Exception {
		
		HttpSession session = request.getSession(false);
		if(session == null){
			return "/login";
			
			}
			session.removeAttribute("userid");
			return "/login";
		

	}
	public EmpService getEmpService() {
		return empService;
	}

	public void setEmpService(EmpService empService) {
		this.empService = empService;
	}

}
