<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/css/jquery-weui.min.css" />
</head>
<link rel="stylesheet" type="text/css"
	href="/plugins/theme/default/layer.css" />
<title>Insert title here</title>
<style>
.navbar-header {
	background-color: #000000;
}

.navbar-cls-top .navbar-brand {
	color: #fff;
	background: #202020;
	width: 260px;
	text-align: center;
	height: 75px;
	font-size: 20px;
	letter-spacing: 1px;
	font-weight: 900;
	padding-top: 25px;
	text-transform: uppercase;
}

.header-right {
	color: #fff;
	padding: 15px 50px 5px 50px;
	float: right;
	font-size: 16px;
}

.navbar-cls-top {
	background: #00CA79;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default navbar-cls-top " role="navigation"
		style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse"
			data-target=".sidebar-collapse">
			<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span>
			<span class="icon-bar"></span> <span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.html">彭彭订餐后台</a>
	</div>
	<div class="header-right">
		<a href="message-task.html" class="btn btn-info" title="New Message"><b>30
		</b><i class="fa fa-envelope-o fa-2x"></i></a> <a href="message-task.html"
			class="btn btn-primary" title="New Task"><b>40 </b><i
			class="fa fa-bars fa-2x"></i></a> <a href="login.html"
			class="btn btn-danger" title="Logout"><i
			class="fa fa-exclamation-circle fa-2x"></i></a>
	</div>
	</nav>
	<div class="col-md-2">
		<ul class="nav nav-pills nav-stacked">
			<li class="active"><a href="/manage/index">彭彭订餐后台</a></li>
			<li>
				<ul id="menu-manage" class="collapse in list-unstyled nav-stacked">
					<li><a href="/manage/findAllItemType">查询菜品种类(提供修改)</a></li>
					<li><a href="/manage/addItem">添加菜品</a></li>
					<li><a href="/manage/findItem">查询菜品(提供修改)</a></li>
					<li><a href="/manage/findAllItemMaterial">查询原料</a></li>
				</ul>
			</li>
		</ul>
	</div>

	<div class="col-md-10 items">
		<div class="col-md-2 item">
			<div class="item-pic">
				<img src="${item.path}${item.filename}" class="img-rounded">
			</div>
			<div class="item-price">
				<span class="price-symbol">¥</span> <span class="price">${item.price }</span>
				<span class="text-primary">折扣:</span> <span class="discount">${item.discount }</span>
			</div>
		</div>
	</div>
</body>
</html>
<script type="text/javascript" src="/plugins/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript"
	src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="/plugins/jquery-weui/js/jquery-weui.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/js/swiper.js"></script>
<script type="text/javascript"
	src="/plugins/jquery-weui/lib/fastclick.js"></script>
<script type="text/javascript" src="/plugins/layer/layer.js"></script>
<script type="text/javascript" src="/js/shizumine.js"></script>
<script type="text/javascript" src="/js/index.js"></script>