package com.bishe.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bishe.pojo.TbUser;
import com.bishe.service.TbUserService;

@Controller
@RequestMapping("/user")
public class TbUserController {
	@Autowired
	private TbUserService tbUserService;
	
	@RequestMapping("/registsubmit")
	public String regist(TbUser tbUser){
		tbUserService.regist(tbUser);
		return "login";
	}
	
	@RequestMapping("/loginsubmit")
	public String login(String username,String password,HttpSession session){
		TbUser tbUser = tbUserService.login(username, password);
		session.setAttribute("user",tbUser);
		return "redirect:/index";
	}
}
