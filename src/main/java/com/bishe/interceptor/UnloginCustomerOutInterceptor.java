package com.bishe.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bishe.pojo.User;

public class UnloginCustomerOutInterceptor implements HandlerInterceptor	{

	@Override
	public void afterCompletion(HttpServletRequest req, HttpServletResponse res, Object ob, Exception arg3)
			throws Exception {

		
	}

	@Override
	public void postHandle(HttpServletRequest req, HttpServletResponse res, Object ob, ModelAndView arg3)
			throws Exception {

		
	}

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object ob) throws Exception {	
		if(req.getSession().getAttribute("user")!=null) {
			res.sendRedirect("/index"); 
			return false;
		}
		return true;
	}

}
