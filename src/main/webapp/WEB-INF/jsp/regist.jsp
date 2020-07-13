<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>彭彭网上餐馆</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no">

<link rel="stylesheet" type="text/css"
	href="/plugins/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/lib/weui.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/css/jquery-weui.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />

<script type="text/javascript" src="/plugins/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="/plugins/layer/layer.js"></script>
<script type="text/javascript"
	src="/plugins/jquery-weui/js/jquery-weui.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/js/swiper.js"></script>
<script type="text/javascript" src="/js/shizumine.js"></script>
<script type="text/javascript" src="/js/userlogin.js"></script>
</head>
<body>
	<form action="admin/registerCommit" method="post" id="register">
		<div class="weui-cells weui-cells_form">
			<div class="weui-cells__title">登录</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">用户名</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" name="username"
						id="regist-username" placeholder="请输入用户名，英文或数字结合"
						required="required">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">密码</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="password" id="regist-password"
						name="password" placeholder="请输入密码" required="required">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">确认密码</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="password" id="regist-repassword"
						name="repassword" placeholder="请输入确认密码" required="required">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">昵称</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" id="regist-nickname"
						name="nickname" placeholder="请输入昵称" required="required">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">手机号</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" id="regist-phone"
						name="phone" placeholder="请输入手机号" required="required">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__hd">
					<label class="weui-label">邮箱</label>
				</div>
				<div class="weui-cell__bd">
					<input class="weui-input" type="text" id="regist-email"
						name="email" placeholder="请输入邮箱" required="required">
				</div>
			</div>
			<div class="weui-cell">
				<div class="weui-cell__bd">
					<input type="button" id="btn-register"
						class="weui-btn weui-btn_primary" value="注册">
				</div>
			</div>
		</div>
	</form>


</body>
</html>