$(function() {
	$('#btn-customer-login').on('click', function() {
		var username = $('#login-username').val();
		var password = $('#login-password').val();

		$.ajax({
			type : "POST",
			url : '/admin/loginCommit',
			data : {
				username : username,
				password : password
			},
			success : function(data) {
				if (data == -1) {
					layer.msg("您的账号或者密码为空");
					return;
				}
				if (data == -2) {
					layer.msg("请输入正确的账号或密码");
					return;
				}

				layer.msg("登录成功!");
				setTimeout(function() {
					window.location.href = '/order'
				}, 2000);

			},
			error : function() {
				layer.msg("服务器正忙，请稍后再试！");
			}
		});
	});
	/*
	 * 注册
	 */
	$('#btn-register').on('click',function() {
				var username = $('#regist-username').val();
				var password = $('#regist-password').val();
				var repassword = $('#regist-repassword').val();
				var nickname = $('#regist-nickname').val();
				var phone = $('#regist-phone').val();
				var email = $('#regist-email').val();
				
				var validation = false;
				// 验证用户名
				if (!isNumberAndLetter(username)) {
					$('#register #regist-username').parent().parent().addClass(
							"weui-cell_warn");
					return;
				}

				// 判断两次输入密码是否一致
				if (password != repassword) {
					layer.msg("两次输入密码不一致!");
					return;
				}

				if (username.trim() == "") {
					$('#register #regist-username').parent().parent().addClass(
							"weui-cell_warn");
					validation = true;
				}

				if (password.trim() == "") {
					$('#register #regist-password').parent().parent().addClass(
							"weui-cell_warn");
					validation = true;
				}

				if (repassword.trim() == "") {
					$('#register #regist-repassword').parent().parent()
							.addClass("weui-cell_warn");
					validation = true;
				}

				if (nickname.trim() == "") {
					$('#register #regist-nickname').parent().parent().addClass(
							"weui-cell_warn");
					validation = true;
				}

				// 验证手机
				if (!isPhone(phone)) {
					$('#register #regist-phone').parent().parent().addClass(
							"weui-cell_warn");
					validation = true;
				}

				// 验证邮箱
				if (!isEmail(email)) {
					$('#register #regist-email').parent().parent().addClass(
							"weui-cell_warn");
					validation = true;
				}

				if (validation == true) {
					layer.msg("输入有误!");
					return;
				}

				$.ajax({
					type : "POST",
					url : '/admin/registerCommit',
					data : {
						username : username,
						password : password,
						nickname : nickname,
						phone : phone,
						email : email
					},
					success : function(data) {
						if (data == "0000") {
							layer.msg("注册成功!请进行登录!");
							setTimeout(function() {
								window.location.href = '/login'
							}, 2000);
						}
					},
					error : function(request) {
						layer.msg("服务器正忙，请稍后再试！");
					}
				});
			});

	/*
	 * 验证用户名
	 */
	$('#regist-username').on('blur', function() {
		// 从数据库验证用户名是否重复
		$.ajax({
			type : "GET",
			url : '/admin/checkUsername',
			data : {
				username : $(this).val(),
			},
			success : function(data) {
				if (data == "0001") {
					// 该用户已存在
					layer.msg("该用户已经存在");
					$('#register #regist-username').parent().parent().addClass("weui-cell_warn");
				}else if(data == "0000"){
					$('#register #regist-username').parent().parent().removeClass("weui-cell_warn");
				}
			},
			error : function() {
				layer.msg("服务器正忙，请稍后再试！");
			}
		});
	});
	/*
	 * 密码框失去焦点
	 */
	$('#regist-password').on('blur', function() {
		if($(this).val()!=""){
			$(this).parent().parent().removeClass("weui-cell_warn");
		}
	});
	
	$('#regist-repassword').on('blur', function() {
		if($(this).val()!=""){
			$(this).parent().parent().removeClass("weui-cell_warn");
		}
	});
	
	$('#regist-nickname').on('blur', function() {
		if($(this).val()!=""){
			$(this).parent().parent().removeClass("weui-cell_warn");
		}
	});
	
	$('#regist-phone').on('blur', function() {
		if($(this).val()!=""){
			$(this).parent().parent().removeClass("weui-cell_warn");
		}
	});
	
	$('#regist-email').on('blur', function() {
		if($(this).val()!=""){
			$(this).parent().parent().removeClass("weui-cell_warn");
		}
	});
});

function checkUsername(username) {
	$.ajax({
		type : "GET",
		url : '/admin/checkUsername',
		data : {
			username : username,
		},
		success : function(data) {
			if (data == "0001") {
				// 该用户已存在
				layer.msg("该用户已经存在");
			}
		},
		error : function() {
			layer.msg("服务器正忙，请稍后再试！");
		}
	});
}
