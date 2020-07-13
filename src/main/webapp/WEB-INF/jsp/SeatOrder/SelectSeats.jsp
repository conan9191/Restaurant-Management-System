<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>彭彭网上餐馆</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="/plugins/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/Seat-Charts/css/jquery.seat-charts.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/datetimepicker/css/bootstrap-datetimepicker.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css" href="/css/SeatOrder.css" />


</head>

<body>

	

<div class="demo">
   	<div id="seat-map">
		<div class="front">餐厅大门</div>	
			
	</div>
	<div class="booking-details">
		<div id="date-display">
		<p>到达时间：<span></span></p>
		<button id="reselect-button"  type="button"  class="btn btn-default" >更改时间</button>
		</div>
		<br>
		<div id="select-display">
		<p>座位：</p>
		<ul  class="selected-seats" id="selected-seats"></ul>
		<p>座位数：<span id="counter">0</span></p>
		<p>最大容纳人数：<span id="maxnum">0</span></p>
		<p>押金：<b>￥<span id="total">0</span></b></p>			
		<button id="checkout-button"  type="button"  class="btn btn-default" >确认选座</button>
		</div>			
		<div id="legend"></div>
	</div>
</div>
<!-- modal:选择日期 -->
<div class="modal hide" id="select-time" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
			<div class="form-group">
                 <div class="input-group date form_datetime" data-date="2013-02-21T15:25:00Z" data-date-format="yyyy-MM-dd HH:mm:ss" data-link-field="dtp_input1">
                    <input id="time-input" class="form-control" size="16" type="text" value="" readonly placeholder="请选择到店时间">
                    <span class="input-group-addon"><span class="glyphicon glyphicon-remove"></span></span>
                    <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                </div>
                <input type="hidden" id="dtp_input1" value="" /><br/>
</div>
			</div>
			<div class="modal-footer">
				<button id="confirmBtn" type="button" class="btn btn-default" data-dismiss="modal" >开始选座</button>
                <button id="returnBtn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
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
				<form role="form" action="/SeatOrder/SubmitSeatOrder" method="post">
						<div class="form-group">
								<label for="name">您的用户名</label>
								<input type="text"
								class="onlyReadInput" id="name"  readonly="readonly" name="arrivetime" 
								value="${sessionScope.user.nickname}" required="required">
						</div>
						<div class="form-group">
								<label for="arrivetime">到达时间</label> <input type="text"
								class="onlyReadInput" id="arrivetime"  readonly="readonly" name="arrivetime" 
								value="" required="required">
						</div>
						<div class="form-group">
							<label for="duration" >就餐时长</label>
								<select class="form-control" name="duration"  id ="duration">
								<option  value=" " >---请选择预计就餐时长---</option>
								<option  value="30">30分钟</option>
								<option  value="60">1小时</option>
								<option  value="120">两小时</option>
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
							<label for="num" >最大就餐人数</label>
								<select class="form-control" name="num"  id ="num">
								<option  value=" " >---请选择就餐人数---</option>
								</select>	
						</div>
						<!-- <div class="form-group">
								
						</div> -->
						<div class="form-group">
								<label for="cash">缴纳押金</label> <input type="text"
									class="onlyReadInput" id="cash" name="cash"  readonly="readonly" value="" required="required">
						</div>
						<button type="button" class="btn btn-success" id = "addOrderCommit">提交</button>
				</form>
			</div>
			<div class="modal-footer">
                <button id="returnBtn2" type="button" class="btn btn-default" data-dismiss="modal">返回</button>
            </div>
		</div>
	</div>
</div>
<script type="text/javascript" src="/plugins/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/plugins/layer/layer.js"></script>
<script type="text/javascript" src="/js/shizumine.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript" src="/js/orderSeat.js"></script>
<script type="text/javascript" src="/plugins/Seat-Charts/js/jquery.seat-charts.min.js"></script>
<script type="text/javascript" src="/plugins/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/plugins/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
</body>
</html>
