<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<style>
.topbar {
	background-color: #01a9da;
	height: 50px;
}

.topbar>a>i {
	color: #ebebeb;
	font-size: 1.5rem;
}

div.weui-form-preview {
	border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
	<div class="topbar">
		<a href="javascript:history.back(-1)"><i class="glyphicon glyphicon-chevron-left"></i></a>
	</div>
	<c:forEach items="${itemOrders}" var="itemOrder">
		<div class="weui-form-preview">
			<div class="weui-form-preview__hd">
				<label class="weui-form-preview__label">付款金额</label> <em
					class="weui-form-preview__value">¥${itemOrder.totalPrice}</em>
			</div>
			<div class="weui-form-preview__bd">
			<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">类型</label> <span
						class="weui-form-preview__value">订餐</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">订单号</label> <span
						class="weui-form-preview__value">${itemOrder.name }</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">订单日期</label> <span
						class="weui-form-preview__value"><fmt:formatDate
							value="${itemOrder.orderTime }" type="both" /></span>
				</div>
			</div>
		</div>
	</c:forEach>

	<c:forEach items="${seatOrders }" var="seatOrder">
		<div class="weui-form-preview">
			<div class="weui-form-preview__hd">
				<label class="weui-form-preview__label">付款金额</label> <em
					class="weui-form-preview__value">¥${seatOrder.cash}</em>
			</div>
			<div class="weui-form-preview__bd">
			<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">类型</label> <span
						class="weui-form-preview__value">订座</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">订单号</label> <span
						class="weui-form-preview__value">${seatOrder.name }</span>
				</div>
				<div class="weui-form-preview__item">
					<label class="weui-form-preview__label">订单日期</label> <span
						class="weui-form-preview__value"> <fmt:formatDate
							value="${seatOrder.ordertime }" type="both" /></span>
				</div>
			</div>
		</div>
	</c:forEach>

	<script type="text/javascript"
		src="/plugins/jquery/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.js"></script>
	<script type="text/javascript" src="/plugins/layer/layer.js"></script>
	<script type="text/javascript"
		src="/plugins/jquery-weui/js/jquery-weui.js"></script>
	<script type="text/javascript" src="/plugins/jquery-weui/js/swiper.js"></script>
</body>
</html>