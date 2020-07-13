<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-CN">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,user-scalable=no">
<title>彭彭订餐页面</title>
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/lib/weui.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/css/jquery-weui.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/css/order.css">
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/Seat-Charts/css/jquery.seat-charts.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css" href="/css/SeatOrderForPhone.css" />


<style>
.weui-tab>.weui-tabbar {
	position: fixed;
	height: 60px;
	z-index: 2000;
}

.weui-tab>#orderItemTab {
	z-index: 2000;
}
</style>
</head>

<body>
	<div class="topbar">
		<a href="/index"><i class="glyphicon glyphicon-chevron-left"></i></a>
	</div>
	<!-- 容器 -->
	<div class="weui-tab">
		<div class="weui-tab__bd">
			<div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
				<div class="search">
					<div class="weui-search-bar" id="searchBar">
						<form class="weui-search-bar__form">
							<div class="weui-search-bar__box">
								<i class="weui-icon-search"></i> <input type="search"
									class="weui-search-bar__input" id="searchInput"
									placeholder="搜索" required=""> <a href="javascript:"
									class="weui-icon-clear" id="searchClear"></a>
							</div>
							<label class="weui-search-bar__label" id="searchText"> <i
								class="weui-icon-search"></i> <span>搜索</span>
							</label>
						</form>
						<a href="javascript:" class="weui-search-bar__cancel-btn"
							id="searchCancel">取消</a>
					</div>
				</div>
				<div class="navi-left">
					<ul class="nav">
						<c:forEach items="${itemTypes}" var="item">
							<li><a href="javascript:showItemList(${item.id })">${item.name }</a></li>
						</c:forEach>
					</ul>
					<!-- 每列商品的模板 -->
					<div id="template">
						<div class="weui-flex">
							<div class="weui-flex__item">
								<div class="item-pic">
									<img class="cover_image" src="">
								</div>
							</div>
							<div class="weui-flex__item">
								<input type="hidden" class="item-id" value="">
								<div class="item-name"></div>
								<div class="item-price"></div>
								<div class="item-sale"></div>
								<div class="weui-cell">
									<div class="weui-count" style="display:none;">
										<a class="weui-count__btn weui-count__decrease"></a> 
										<input class="weui-count__number" type="number" value="1"> 
										<a class="weui-count__btn weui-count__increase"></a>
									</div>
								</div>
								<div class="item-operation">
									<a id="add-cart-item" href="#"></a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="item-wrapper"></div>
				<a id="btn-cart" href="javascript:;" class="open-popup"
					data-target="#cart"> <i
					class="glyphicon glyphicon-shopping-cart"></i>
				</a>
				<!-- 购物车 -->
				<div id="cart" class="weui-popup__container popup-bottom"
					style="display: none;">
					<div class="weui-popup__overlay"></div>
					<div class="weui-popup__modal">
						<div class="toolbar">
							<div class="toolbar-inner">
								<a href="javascript:;" class="picker-button close-popup">关闭</a>
								<h1 class="title">我的购物车</h1>
							</div>
							<div id="template" class="weui-cells" style="display: none;">
								<div class="weui-cell weui-cell_swiped">
									<div class="weui-cell__bd">
										<div class="weui-cell">
											<input type="hidden" id="item-id" value="">
											<div class="weui-cell__hd">
												<img id="caritem-img" src="" alt=""
													style="width: 20px; margin-right: 5px; display: block">
											</div>
											<div class="weui-cell__bd">
												<p id="caritem-name"></p>
											</div>

											<div class="weui-cell__ft">
												<span class="price"></span>
												<div class="weui-count">
													数量: <input class="weui-count__number" type="number"
														value="" readonly> 份
												</div>
											</div>
										</div>
									</div>
									<div class="weui-cell__ft">
										<a
											class="weui-swiped-btn weui-swiped-btn_warn delete-swipeout"
											href="javascript:;">删除</a>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-content"></div>
						<p class="summary" style="text-align: right;">
							(ps:左滑删除) <span id="cart-total-quantity">0</span> 件商品, 共计 <strong
								id="cart-total-price">0</strong> 元
						</p>
						<a href="javascript:;" id="btn-genOrder"
							class="weui-btn weui-btn_primary">提交订单</a>
					</div>
				</div>
			</div>
			<div id="tab2" class="weui-tab__bd-item">
				<div class="demo">
					<div id="seat-map">
						<div id="legend"></div>
						<button id="showDetail-button" type="button"
							class="btn btn-default">订座详情</button>
						<div class="front">餐厅大门</div>

					</div>

					<div class="booking-details" id="booking-details">
						<div id="date-display">

							<button id="reselect-button" type="button"
								class="btn btn-default">更改时间</button>
						</div>
						<br>
						<div id="select-display">
							<p>座位：</p>
							<ul class="selected-seats" id="selected-seats"></ul>
							<p>
								座位数：<span id="counter">0</span>
							</p>
							<p>
								最大容纳人数：<span id="maxnum">0</span>
							</p>
							<p>
								押金：<b>￥<span id="total">0</span></b>
							</p>
							<button id="checkout-button" type="button"
								class="btn btn-default">确认选座</button>
						</div>

					</div>
				</div>

				<!-- modal:选择日期 -->
				<div class="modal hide" id="select-time" tabindex="-1" role="dialog"
					aria-labelledby="body" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<div class="form-group">
									<div class="input-group date form_datetime"
										data-date="2013-02-21T15:25:00Z"
										data-date-format="yyyy-MM-dd HH:mm:ss"
										data-link-field="dtp_input1">
										<input id="time-input" class="form-control" size="16"
											type="text" value="" readonly placeholder="请选择到店时间">
										<span class="input-group-addon"><span
											class="glyphicon glyphicon-remove"></span></span> <span
											class="input-group-addon"><span
											class="glyphicon glyphicon-th"></span></span>
									</div>
									<input type="hidden" id="dtp_input1" value="" /><br />
								</div>
							</div>
							<div class="modal-footer">
								<button id="confirmBtn" type="button" class="btn btn-default"
									data-dismiss="modal">开始选座</button>
								<button id="returnBtn" type="button" class="btn btn-default"
									data-dismiss="modal">关闭</button>
							</div>
						</div>
					</div>
				</div>

				<!-- modal:订单填写 -->
				<div class="modal hide" id="add-order" tabindex="-1" role="dialog"
					aria-labelledby="body" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-body">
								<form role="form" action="/SeatOrder/SubmitSeatOrder"
									method="post">
									<div class="form-group">
										<label for="name">您的用户名</label> <input type="text"
											class="onlyReadInput" id="name" readonly="readonly"
											name="arrivetime" value="${sessionScope.user.nickname}"
											required="required">
									</div>
									<div class="form-group">
										<label for="arrivetime">到达时间</label> <input type="text"
											class="onlyReadInput" id="arrivetime" readonly="readonly"
											name="arrivetime" value="" required="required">
									</div>
									<div class="form-group">
										<label for="duration">就餐时长</label> <select
											class="form-control" name="duration" id="duration">
											<option value=" ">---请选择预计就餐时长---</option>
											<option value="30">30分钟</option>
											<option value="60">1小时</option>
											<option value="120">2小时</option>
											<option value="120">3小时</option>
											<option value="240">4小时</option>
											<option value="0">不限</option>
										</select>
									</div>
									<!--  
										<div class="form-group">
												<label for="num">最大就餐人数</label> 
												<input class="min" name="" type="button" value="-" />
												<input type="text"
													class=”form-control“ id="num" name="num" 
													value="" required="required" style="width:25px;">	
												<input class="add" name="" type="button" value="+" />	
										</div> -->
									<div class="form-group">
										<label for="num">最大就餐人数</label> <select class="form-control"
											name="num" id="num">
											<option value=" ">---请选择就餐人数---</option>
										</select>
									</div>
									<!-- <div class="form-group">
												
										</div> -->
									<div class="form-group">
										<label for="cash">缴纳押金</label> <input type="text"
											class="onlyReadInput" id="cash" name="cash"
											readonly="readonly" value="" required="required">
									</div>
									<button type="button" class="btn btn-success"
										id="addOrderCommit">提交</button>
									<button id="returnBtn2" type="button" class="btn btn-default"
										data-dismiss="modal">返回</button>
								</form>
							</div>
							<div class="modal-footer"></div>
						</div>
					</div>
				</div>
			</div>
			<div id="tab3" class="weui-tab__bd-item">
				<div id="header">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-4 col-xs-4">
								<img src="images/avatar3.jpg" class="img-circle">
							</div>
							<div class="col-md-8 col-xs-8">
								<c:if test="${sessionScope.user ==null }">
									您还未登陆，请<a href="/login">登录</a>
								</c:if>
								<c:if test="${sessionScope.user !=null }">
									<input type="hidden" id="user-id"> 欢迎您:<span
										id="user-name" value=""></span>
								</c:if>
							</div>
						</div>
					</div>
				</div>

				<div class="all-order">
					<a href="/order/finishOrder">
						<div class="weui-flex">
							<div class="weui-flex__item">我的订单</div>
							<div class="weui-flex__item"></div>
							<div class="weui-flex__item">点击此查看所有订单</div>
						</div>
					</a>
				</div>
				
				<div class="weui-grids">
					<a href="/person-edit" class="weui-grid js_grid">
						<div class="weui-grid__icon">
							<img src="images/icon_nav_button.png" alt="">
						</div>
						<p class="weui-grid__label">修改个人资料</p>
					</a> <a href="" class="weui-grid js_grid">
						<div class="weui-grid__icon">
							<img src="images/icon_nav_cell.png" alt="">
						</div>
						<p class="weui-grid__label">未完成订单</p>
					</a> </a> <a href="/unfinishOrder" class="weui-grid js_grid">
						<div class="weui-grid__icon">
							<img src="images/icon_nav_picker.png" alt="">
						</div>
						<p class="weui-grid__label">我的VIP</p>
					</a>
				</div>
			</div>
		</div>
		<div class="weui-tabbar">
			<a href="#tab1" id="orderItemTab"
				class="weui-tabbar__item weui-bar__item--on">
				<div class="weui-tabbar__icon">
					<img src="./images/icon_nav_button.png" alt="">
				</div>
				<p class="weui-tabbar__label">订餐</p>
			</a> <a href="#tab2" id="orderSeatTab" class="weui-tabbar__item">
				<div class="weui-tabbar__icon">
					<img src="./images/icon_nav_icons.png" alt="">
				</div>
				<p class="weui-tabbar__label">订座</p>
			</a> </a> <a href="#tab3" id="PersonTab" class="weui-tabbar__item">
				<div class="weui-tabbar__icon">
					<img src="./images/icon_nav_article.png" alt="">
				</div>
				<p class="weui-tabbar__label">我</p>
			</a>
		</div>
	</div>
	<script type="text/javascript"
		src="/plugins/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/plugins/layer/layer.js"></script>
	<script type="text/javascript"
		src="/plugins/jquery-weui/js/jquery-weui.js"></script>
	<script type="text/javascript" src="/plugins/jquery-weui/js/swiper.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="/js/shizumine.js"></script>
	<script type="text/javascript" src="/js/order.js"></script>


	<script type="text/javascript"
		src="/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="/js/orderSeatForPhone.js"></script>
	<script type="text/javascript"
		src="/plugins/Seat-Charts/js/jquery.seat-charts.min.js"></script>
	<script type="text/javascript"
		src="/plugins/datetimepicker/js/bootstrap-datetimepicker.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"
		charset="UTF-8"></script>

</body>

</html>