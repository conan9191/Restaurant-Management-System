package com.bishe.controller;

import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bishe.mapper.UserMapper;
import com.bishe.pojo.User;
import com.bishe.service.UserService;

@Controller
@RequestMapping("/admin")
public class UserController {
	@Autowired
	private UserService userService;
	
	@RequestMapping("/loginCommit")
	@ResponseBody
	public Integer loginCommit(String username,String password,HttpSession session,Model model) throws Exception{
		Integer errorNum ;
		if(username.trim().equals("")||password.trim().equals("")){
			errorNum = -1;
			return errorNum;
		}
		//获取user
		User user = userService.login(username,password);
		
		if(user.getId()==null){
			errorNum = -2;
			return errorNum;
		}
		
		session.setAttribute("user",user);		
		return null;
	}
	
	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session){
		session.removeAttribute("user");
		return "redirect:/admin/login";
	}
	
	@RequestMapping("/loginOutIndex")
	public String loginOutIndex(HttpSession session){
		session.removeAttribute("user");
		session.removeAttribute("cart");
		return "redirect:/index";
	}
	
	@RequestMapping("/registerCommit")
	@ResponseBody
	public String registerCommit(User user){
		String success = "0000";
		userService.register(user);
		return success;
	}
	
	@RequestMapping("/checkUsername")
	@ResponseBody
	public String checkUsername(String username){
		User user = userService.findUserByUsername(username);
		String info;
		if(user!=null){
			//user存在
			info = "0001";
		}else {
			info = "0000";
		}
		return info;
	}
	
	@RequestMapping("/getUser")
	@ResponseBody
	public User getUser(HttpSession session){
		User user = (User) session.getAttribute("user");
		return user;
	}
	
	@RequestMapping("/editUser")
	@ResponseBody
	public void editUser(HttpSession session,String nickname,String phone,String email){
		User user = (User) session.getAttribute("user");
		user.setNickname(nickname);
		user.setPhone(phone);
		user.setEmail(email);
		user.setUpdated(new Date());
		
		userService.editUser(user);
	}
}
