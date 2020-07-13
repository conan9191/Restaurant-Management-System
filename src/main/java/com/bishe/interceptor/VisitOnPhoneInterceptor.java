package com.bishe.interceptor;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bishe.pojo.User;

public class VisitOnPhoneInterceptor implements HandlerInterceptor	{
	static final String[] MOBILE_SPECIFIC_SUBSTRING = { "iPad","iPhone","Android","MIDP","Opera Mobi", "Opera Mini","BlackBerry","HP iPAQ","IEMobile", "MSIEMobile","Windows Phone","HTC","LG", "MOT","Nokia","Symbian","Fennec", "Maemo","Tear","Midori","armv", "Windows CE","WindowsCE","Smartphone","240x320", "176x220","320x320","160x160","webOS", "Palm","Sagem","Samsung","SGH", "SIE","SonyEricsson","MMP","UCWEB"}; 
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
		
		String userAgent = req.getHeader("user-agent"); 
		for (String mobile: MOBILE_SPECIFIC_SUBSTRING){ 
			if (userAgent.contains(mobile) 
					|| userAgent.contains(mobile.toUpperCase()) 
					|| userAgent.contains(mobile.toLowerCase())){ 
				return true; 
				} 
			} 
		res.sendRedirect("/orderForPC"); 
		return false; 
	}

}
