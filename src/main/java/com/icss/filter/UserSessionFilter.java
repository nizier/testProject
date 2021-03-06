package com.icss.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class Filter
 */
@WebFilter("/Filter")
public class UserSessionFilter implements javax.servlet.Filter {

   
	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest) servletRequest;
		
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		
		// 获取根目录所对应的绝对路径
		
		String currentURL = request.getRequestURI();
		
		// 截取到当前文件名用于比较
		
		String targetURL = currentURL.substring(currentURL.indexOf("/", 1), currentURL.length());
		
		// 如果session不为空就返回该session，如果为空就返回null
		
		HttpSession session = request.getSession(false);
		
		if (!"/login.jsp".equals(targetURL)) {
			
				if (session == null || session.getAttribute("userid") == null) {
				// 如果session为空表示用户没有登陆就重定向到login.jsp页面
				// System.out.println("request.getContextPath()=" + request.getContextPath());
				response.sendRedirect(request.getContextPath() + "/login.jsp");
				return;
			}
		}

		// 继续向下执行
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
