<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>个人中心</title>
<link rel="stylesheet" type="text/css"
	href="/plugins/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/css/person.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
</head>
<body>

	<session id="header">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-sm-2">
				<span id="user-img"> <i class="glyphicon glyphicon-user"></i>
				</span>
			</div>
			<div class="col-md-10 col-sm-10">
				<input type="hidden" id="user-id"> 欢迎您:<span id="user-name"
					value=""></span>
			</div>
			<a class="btn-vip" href="#"> <i
				class="glyphicon glyphicon-share-alt"></i> <span>我的vip</span>
			</a>
		</div>
	</div>
	</session>

	<session id="list">
	<div class="container-fluid">
		<div class="row" id="myorder">
			<a href="#" class="col-sm-12 col-md-12">
				<span class="pull-left">我的订单</span>
				<span class="pull-right">点击此查看所有订单</span>
			</a>
		</div>

		<div class="row" id="state">
			<div class="col-sm-4 col-md-4">
				<div class="media">
					<a href="#">
						<div class="media-left" href="#">
							<i class="glyphicon glyphicon-list"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">未完成订单</h4>
							查看订单详情
						</div>
					</a>
				</div>
			</div>
			<div class="col-sm-4 col-md-4">
				<div class="media">
					<a href="/person-edit">
						<div class="media-left" href="#">
							<i class="glyphicon glyphicon-list"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">个人资料</h4>
							修改资料
						</div>
					</a>
				</div>
			</div>
			<div class="col-sm-4 col-md-4">
				<div class="media">
					<a href="#">
						<div class="media-left" href="#">
							<i class="glyphicon glyphicon-list"></i>
						</div>
						<div class="media-body">
							<h4 class="media-heading">未完成订单</h4>
							查看订单详情
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>

	</session>
	<script type="text/javascript"
		src="/plugins/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="/plugins/layer/layer.js"></script>
	<script type="text/javascript" src="/js/person.js"></script>
</body>
</html>