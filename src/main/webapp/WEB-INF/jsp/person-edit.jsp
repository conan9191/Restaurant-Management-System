<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no">

<title>个人资料</title>
<link rel="stylesheet" type="text/css"
	href="/plugins/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/lib/weui.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/css/jquery-weui.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
<link rel="stylesheet" type="text/css" href="/css/person-edit.css" />

</head>
<body>
	<div id="header">
		<a href="javascript:history.back(-1)"
			class="glyphicon glyphicon-chevron-left"></a>
	</div>

	<session id="edit-list">
	<div class="weui-cells weui-cells_form">
		<div class="weui-cells__title">修改资料</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">昵称</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" type="text" id="edit-nickname"
					name="nickname" placeholder="请输入昵称" required="required">
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">手机号</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" type="text" id="edit-phone" name="phone"
					placeholder="请输入手机号" required="required">
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__hd">
				<label class="weui-label">邮箱</label>
			</div>
			<div class="weui-cell__bd">
				<input class="weui-input" type="text" id="edit-email" name="email"
					placeholder="请输入邮箱" required="required">
			</div>
		</div>
		<div class="weui-cell">
			<div class="weui-cell__bd">
				<input type="button" id="btn-edit" class="weui-btn weui-btn_primary"
					value="修改">
			</div>
		</div>
	</div>
	</session>

	<script type="text/javascript"
		src="/plugins/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/plugins/layer/layer.js"></script>
	<script type="text/javascript"
		src="/plugins/jquery-weui/js/jquery-weui.js"></script>
	<script type="text/javascript"
		src="/js/person-edit.js"></script>

</body>
</html>