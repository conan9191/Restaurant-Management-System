<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>彭彭网上餐馆</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/css/jquery-weui.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
</head>

<body>
	<div id="header">
		<nav class="navbar navbar-default navbar-cls-top " role="navigation"
			style="margin-bottom: 0">
			<div class="navbar-header col-md-2">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="/manage/index">彭彭订餐后台</a>
			</div>
		</nav>
	</div>

	<div id="nav-side">
		<nav class="col-md-2 navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li>
						<div class="user-img-div">
							<div class="container">
								<div class="row">
									<div class="col-md-4">
										<img src="/images/avatar3.jpg" class="img-circle">
									</div>
									<div class="col-md-8">
										<div class="user-info-header text-center">
											<span class="" style="line-height: 100px;color:#fff;">${sessionScope.user.nickname}
											</span>
											<a href="/admin/loginOut" style="color:#fff;text-decoration:none;">注销</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li><a href="index.html"><i class="fa fa-dashboard "></i>Home</a>
					</li>
					<!-- 主菜单  -->
					<c:forEach items="${accordions}" var="accordion">
						<li><a type="button" data-toggle="collapse"
							data-target="#menu-manage${accordion.name}"
							style="cursor: pointer;">${accordion.name}</a> <!-- 次级菜单 -->
							<ul id="menu-manage${accordion.name}" class="dropdown collapse">
								<c:forEach items="${accordion.children}" var="child">
									<li><a href=" ${child.url}">${child.name}</a></li>
								</c:forEach>
							</ul>
						</li>
					</c:forEach>
				</ul>
			</div>
		</nav>
	</div>