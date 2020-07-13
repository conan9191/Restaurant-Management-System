package com.bishe.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.bishe.alipay.AlipayConfig;
import com.bishe.pojo.ItemOrder;
import com.bishe.pojo.Payment;
import com.bishe.pojo.SeatOrder;
import com.bishe.pojo.User;
import com.bishe.service.ItemOrderService;
import com.bishe.service.SeatOrderService;




@Controller
@RequestMapping("/Alipay")
public class AlipayController {
	@Autowired
	private SeatOrderService seatOrderService;
	@Autowired
	private ItemOrderService itemOrderService;
	
	//生成有二维码，可供扫码支付的页面
	  @RequestMapping(value = "/generateAliPay")
	  public String aliPay(HttpServletResponse response,ModelMap map,HttpServletRequest request,
		      String WIDout_trade_no,String WIDtotal_amount,String WIDsubject,String WIDbody) throws IOException, AlipayApiException{
		//   String a,String urlName,String couName....+"&a="+a+"&urlName="+urlName+"&couName="+couName
		    //获得初始化的AlipayClient
		    AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		 
		    //设置请求参数
		    AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		    alipayRequest.setReturnUrl(AlipayConfig.return_url);
		    alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		    //付款ID，必填
		    String out_trade_no = WIDout_trade_no;
		    //付款金额，必填
		    String total_amount = WIDtotal_amount;
		    total_amount=URLDecoder.decode(total_amount,"UTF-8");//转码
		    //订单名称，必填
		    String subject = WIDsubject;
		    subject=URLDecoder.decode(subject,"UTF-8");
		    //商品描述，可空
		    String body = WIDbody;
		 
		    alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
		        + "\"total_amount\":\""+ total_amount +"\","
		        + "\"subject\":\""+ subject +"\","
		        + "\"body\":\""+ body +"\","
		        + "\"timeout_express\":\"1m\","
		        + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		    //请求
		    String result = alipayClient.pageExecute(alipayRequest).getBody();
		     response.setContentType("text/html; charset=utf-8"); 
		      PrintWriter out = response.getWriter();  
		      out.println(result);  
		      return null;
	  }
	  
	   //将数据存放座位、座位订单关联表当中
	  @RequestMapping(value="/AlipaySuccess")
	  public String AlipaySuccess(HttpSession session){
		 User user = (User) session.getAttribute("user");
		 Payment payment = (Payment) session.getAttribute("payment"+user.getId());
		 
		 if(payment==null) {
			 return "Order";
		 }
		 
		 if(payment.getSoid()!=null) {
		  SeatOrder seatOrder= seatOrderService.getSeatOrderById(payment.getSoid());
		  seatOrder.setState(true);
		  seatOrderService.updateSeatOrder(seatOrder);
		  seatOrderService.generateSeatOrder(seatOrder, payment.getSeatId());
		  session.removeAttribute("payment"+user.getId());
		  return "redirect:/order/finishOrder";
		 }
		 if(payment.getIoid()!=null){
			 ItemOrder itemOrder = itemOrderService.getItemOrder(payment.getIoid());
			 itemOrder.setState(true);
			 itemOrderService.updateItemOrder(itemOrder);
			 itemOrderService.updateItemOrderNum(payment.getCart(), payment.getIoid());
			 session.removeAttribute("payment"+user.getId());
			 session.removeAttribute("cart");
			 return "redirect:/order/finishOrder";
		 }
		 return "Order";
	  }
}
