package com.bishe.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.bishe.pojo.Payment;
import com.bishe.pojo.User;





public class UnfinishOrderInterceptor implements HandlerInterceptor	{

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
		User user = (User) req.getSession().getAttribute("user");
		if(user==null) {
			return true;
		}
		Payment payment = (Payment) req.getSession().getAttribute("payment"+user.getId());
		if(payment==null) {
			return true;
		}
		if(payment!=null&&payment.getIoid()!=null) {
				
				System.out.println("有菜品订单");
				res.sendRedirect("/itemOrder/StartAlipayForItem?id="+user.getId()); 
				
				return false;
		
		}
		if(payment!=null&&payment.getSoid()!=null) {
			
			System.out.println("订座订单");
			res.sendRedirect("/SeatOrder/StartAlipay?id="+user.getId()); 
			
			return false;
	
	}
		return true;
	}

}
