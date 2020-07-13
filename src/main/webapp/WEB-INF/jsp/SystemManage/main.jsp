<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 头栏 -->
<session id="header">
<div class="topbar visible-md visible-lg">
	<div class="container">
		<div class="row">
			<div class="col-md-2" id="qr-code">
				<i class="glyphicon glyphicon-phone"></i><a href="#"
					class="text-muted"><i class="glyphicon glyphicon-chevron-down"></i>手机订餐<img
					src="/pic/qrCode.jpg"></a>
			</div>
			<div class="col-md-4">
				<i class="glyphicon glyphicon-phone-alt"></i><a href="#"
					class="text-muted">客服电话：4005-0505-2729</a>
			</div>
			<div class="col-md-2">
				<a href="" class="text-muted">常见问题</a>
			</div>
			<div class="col-md-4">
				<c:if test="${sessionScope.user!=null}">
					<span>欢迎您:</span>
					<span>${sessionScope.user.nickname }</span>
					<a class="text-muted" href="javascript:show_confirm('/admin/loginOutIndex')">注销</a>
				</c:if>
				<c:if test="${sessionScope.user==null}">
					<a href="/regist" class="btn btn-danger">注册</a>&nbsp;<a
					href="/login" class="text-muted">登录</a>
				</c:if>
			</div>
		</div>
	</div>
</div>
<nav class="navbar navbar-bishe" role="navigation">
	<div class="container">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#example-navbar-collapse">
					<span class="sr-only">切换导航</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> <span class="text-muted">彭彭订餐</span>
				</a>
			</div>
			<div class="collapse navbar-collapse" id="example-navbar-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">在线订餐</a></li>
					<li><a href="#">我的地址</a></li>
					<li><a href="#">订单详情</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right hidden-sm">
					<li><a href="/order">个人中心</a></li>
				</ul>
			</div>
		</div>
	</div>
</nav>
</session>
<!-- 轮播图推荐菜品 -->
<session id="recommend">
<div class="container">
	<div class="swiper-container col-md-12">
		<!-- Additional required wrapper -->
		<div class="swiper-wrapper">
			<!-- Slides -->
			<div class="swiper-slide">
				<img src="/pic/01.jpg">
			</div>
			<div class="swiper-slide">
				<img src="/pic/02.jpg">
			</div>
			<div class="swiper-slide">
				<img src="/pic/03.jpg">
			</div>
		</div>
	</div>
</div>
<!-- Slider main container --> </session>
<!-- 进入按钮 -->
<session id="service">
<div class="container">
	<div class="row">
		<div class="col-md-3 col-xs-6">
			<div class="media">
				<a href="/order">
					<div class="media-left">
						<i class="glyphicon glyphicon-cutlery"></i>
					</div>
					<div class="media-body">
						<h4 class="media-heading">在线订餐</h4>
						网上订餐
					</div>
				</a>
			</div>
		</div>
		<div class="col-md-3 col-xs-6">
			<div class="media">
				<a href="/order#tab2">
					<div class="media-left" href="#">
						<i class="glyphicon  glyphicon-time"></i>
					</div>
					<div class="media-body">
						<h4 class="media-heading">在线订座</h4>
						美食不用等
					</div>
				</a>
			</div>
		</div>
		<div class="col-md-3 col-xs-6">
			<div class="media">
				<a href="#">
					<div class="media-left" href="#">
						<i class="glyphicon glyphicon-home"></i>
					</div>
					<div class="media-body">
						<h4 class="media-heading">我的地址</h4>
						管理收货地址
					</div>
				</a>
			</div>
		</div>
		<div class="col-md-3 col-xs-6">
			<div class="media">
				<a href="#">
					<div class="media-left" href="#">
						<i class="glyphicon glyphicon-barcode"></i>
					</div>
					<div class="media-body">
						<h4 class="media-heading">我的订单</h4>
						查看订单详情
					</div>
				</a>
			</div>
		</div>
	</div>
</div>
</session>
<!-- 尾部 -->
<session id="footer"></session>