<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/css/jquery-weui.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
<link rel="stylesheet" type="text/css" href="/css/login.css" />
<title>登录页面</title>
</head>
<body>
	<div id="header">
		<div class="container">
			<div class="row">
				<div class="col-md-4" id="login-logo">
					<i class="glyphicon glyphicon-cutlery"></i> <span>彭彭订餐后台系统</span>
				</div>
			</div>
		</div>
	</div>

	<div id="bg">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-8 col-md-4" id="manage-login">
						<div class="form-group form-header">
							<h3>后台管理系统</h3>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i
									class="glyphicon glyphicon-user"></i></span>
									<span>${sessionScope.user.nickname}</span>
									<div class="user-info-body text-center">
										<a href="/admin/loginOut">注销</a>
									</div>	
							</div>
						</div>
						</div>
						
						</div>
				</div>
			</div>


	<div class="modal fade" id="register" tabindex="-1" role="dialog"
		aria-labelledby="body" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<form action="/admin/registerCommit" role="form"
						class="form-horizontal" method="post">
						<div class="form-group">
							<h2 class="col-sm-offset-2 col-sm-4">用户注册</h2>
						</div>
						<input type="hidden" name="id" id="id">
						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="username"
									name="username" placeholder="请输入全英文的用户名" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="password"
									name="password" placeholder="请输入密码" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="repassword" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="repassword"
									name="repassword" placeholder="请输入确认密码" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="nickname" class="col-sm-2 control-label">昵称</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="nickname"
									name="nickname" placeholder="请输入昵称" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="phone" class="col-sm-2 control-label">手机号</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="phone" name="phone"
									placeholder="请输入手机号码" required="required">
							</div>
						</div>
						<div class="form-group">
							<label for="email" class="col-sm-2 control-label">邮箱</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="email" name="email"
									placeholder="请输入邮箱" required="required">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="button" id="btn-register" class="btn btn-success" value="注册">
								<button class="btn btn-danger" data-dismiss="modal">取消</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="/plugins/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript"
		src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/plugins/layer/layer.js"></script>
	<script type="text/javascript" src="/js/shizumine.js"></script>
	<script type="text/javascript" src="/js/login.js"></script>
</body>
</html>