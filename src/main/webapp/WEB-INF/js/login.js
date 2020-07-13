/**
 * 
 */
$(function() {
	$('#btn-login').on('click', function() {
		var username = $('#login-username').val();
		var password = $('#login-password').val();
		
		$.ajax({
			type : "POST",
			url : '/admin/loginCommit',
			data : {
				username:username,
				password:password
			},
			success : function(data) {
				if(data==-1){
					layer.msg("您的账号或者密码为空");
					return ;
				}
				if(data==-2){
					layer.msg("请输入正确的账号或密码");
					return ;
				}	
				
				layer.msg("登录成功!");
				window.location.href="/manage/index";
			},
			error : function(request) {
				layer.msg("服务器正忙，请稍后再试！");
			}
		});
	});
	/*
	 * 注册
	 */
	$('#btn-register').on('click',function(){
	
		var username = $('#register #username').val();
		var password = $('#register #password').val();
		var repassword = $('#register #repassword').val();
		var nickname = $('#register #nickname').val();
		var phone = $('#register #phone').val();
		var email = $('#register #email').val();
		//验证用户名，应全英文
		if(!isNumberAndLetter(username)){
			$('#register #username').parent().parent().addClass("has-error");
			return;
		}
		//从数据库验证用户名是否重复
		checkUsername(username);
			
		//判断两次输入密码是否一致
		if(password!=repassword){
			layer.msg("两次输入密码不一致!");
			return;
		}
		
		//验证手机
		if(!isPhone(phone)){
			$('#register #phone').parent().parent().addClass("has-error");
			return;
		}
		
		//验证邮箱
		if(!isEmail(email)){
			$('#register #email').parent().parent().addClass("has-error");
			return;
		}
		
		$.ajax({
			type : "POST",
			url : '/admin/registerCommit',
			data : {
				username:username,
				password:password,
				nickname:nickname,
				phone:phone,
				email:email
			},
			success : function(data) {
				if(data == "0000"){
					layer.msg("注册成功!");
					setInterval(window.location.href="/admin/login",1000);
				}
			},
			error : function(request) {
				layer.msg("服务器正忙，请稍后再试！");
			}
		});
		
	});
});

function checkUsername(username){
	$.ajax({
		type : "GET",
		url : '/admin/checkUsername',
		data : {
			username:username,
		},
		success : function(data) {
			if(data=="0001") {
				layer.msg("该用户已存在");
				return ;
			}
		},
		error : function() {
			layer.msg("服务器正忙，请稍后再试！");
		}
	});
}
