<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<!-- <link rel="stylesheet" type="text/css" href="/css/SeatOrder.css" /> -->
<script type="text/javascript" src="/plugins/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/js/jquery-weui.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/js/swiper.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/lib/fastclick.js"></script>
<script type="text/javascript" src="/plugins/layer/layer.js"></script>
<script type="text/javascript" src="/js/shizumine.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript" src="/js/manageSeat.js"></script>
<script type="text/javascript" src="/plugins/Seat-Charts/js/jquery.seat-charts.min.js"></script>
<style type="text/css">
.front{width: 570px;margin: 5px 32px 45px 0px;background-color: #f0f0f0; color: #666;text-align: center;padding: 3px;border-radius: 5px; }
#DetailModal{float: left;position: absolute;width: 600px;height: 100px;left:100px; top:150px;z-index:200;outline: none; }
.booking-details {float: left;position: absolute;width:200px;height: 450px; left:800px;top:50px}
.booking-details h3 {margin: 5px 5px 0 0;font-size: 16px;}
.booking-details p{line-height:26px; font-size:16px; color:#999}
.booking-details p span{color:#666}
#DetailModal {margin: 5px 5px 0 0;font-size: 16px;}
#DetailModal p{line-height:26px; font-size:16px; color:#999}
#DetailModal p span{color:#666}
#DetailModal .modal-body{height: 250px;}
#edit-seat{float: left;position: absolute;width: 600px;height: 600px;left:100px; top:150px;z-index:200;outline: none; }
.btn-success{width: 570px;}
.modal-backdrop{z-index:10}
div.seatCharts-cell {color: #182C4E;height: 50px;width: 50px;line-height: 50px;margin: 3px;float: left;text-align: center;outline: none;font-size:23px;font-family: SimHei;}
div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius: 5px;}
div.seatCharts-row {height: 60px;}
div.seatCharts-seat.available {background-color: #A4A4A4;}
div.seatCharts-seat.selected {background-color: #07C844;}
div.seatCharts-seat.focused {background: url(/pic/查看.png) ;background-size:100% 100%;-moz-background-size:100% 100%;font-size: 0px;}
div.seatCharts-seat.unavailable {background-color: #EC4403;cursor: pointer; }
div.seatCharts-seat.unsetting {visibility:hidden;background-color: white;cursor: not-allowed; color:white;} 
div.seatCharts-container {border: 1px dotted #adadad;width: 700px;padding: 20px;float: left;margin-left:50px; margin-top:20px; padding-left: 60px;}
div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;}
ul.seatCharts-legendList {padding-left: 0px;}
.seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
div.seatCharts-legend .seatCharts-cell{cursor:default; }
div.seatCharts-legend .seatCharts-legendItem{list-style-type:none;}
span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
.checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
#focused-seats {width:145px; height:130px; border:1px solid #d3d3d3; background:#f7f7f7; margin:10px; padding:10px;margin-left:0; }
#focused-seats.h{ line-height:56px;font-size:24px; font-weight:bold; text-align:left ;}
#add-seat{float: left;position: absolute;width: 600px;height: 650px;left:100px; top:150px;z-index:200;outline: none; }
#add-seat {margin: 5px 5px 0 0;font-size: 16px;}
#add-seatp{line-height:26px; font-size:16px; color:#999}
#add-seat p span{color:#666}
#add-seat .modal-body{height: 420px;}
</style>
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
		<div class="header-right">
			<a href="message-task.html" class="btn btn-info" title="New Message"><b>30
			</b><i class="fa fa-envelope-o fa-2x"></i></a> <a href="message-task.html"
				class="btn btn-primary" title="New Task"><b>40 </b><i
				class="fa fa-bars fa-2x"></i></a> <a href="/manage/login"
				class="btn btn-danger" title="Logout"><i
				class="fa fa-exclamation-circle fa-2x"></i></a>
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
								<div class="col-md-4"><i class="glyphicon glyphicon-user"></i></div>
								<div class="col-md-8">
									<div class="user-info-header text-center">
										<span class="">${sessionScope.user.nickname}</span>
									</div>
									<div class="user-info-body text-center">
										<a href="/admin/loginOut">注销</a>
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
					data-target="#menu-manage${accordion.name}" style="cursor: pointer;">${accordion.name}</a> <!-- 次级菜单 -->
					<ul id="menu-manage${accordion.name}" class="dropdown collapse">
						<c:forEach items="${accordion.children}" var="child">
						<li><a href=" ${child.url}">${child.name}</a></li>
						</c:forEach>
					</ul></li>
					</c:forEach>
			</ul>
		</div>
	</nav>
	</div>