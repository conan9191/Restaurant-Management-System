<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
<title>支付宝电脑网站支付</title>
<link rel="stylesheet" type="text/css" href="/plugins/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/plugins/bootstrap/css/animate.css">
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/jquery-weui/css/jquery-weui.min.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
<script type="text/javascript" src="/plugins/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/plugins/bootstrap/js/jquery.countdown.js"></script>
<script type="text/javascript" src="/plugins/layer/layer.js"></script>
<style>
.onlyReadInput{
	cursor:default;
	border:0px;
	color:black;
	text-shadow:0 0 0black;
	width:300px;
	padding:10px;
}
#WIDbody {
	color:black;
	text-shadow:0 0 0black;
	width: 300px;     
    height: 40px;    
	padding:10px;
	margin:10px;
}
#alipayment{
align:center;
}
.topbar {
	background-color:#01a9da;
	height: 50px;
}
.topbar > a > i{
	color:#ebebeb;
	font-size:1.5rem;
}
</style>
</head>
<body>
<div class="topbar">
		<a href="javascript:history.back(-1)"><i class="glyphicon glyphicon-chevron-left"></i></a>
</div>
<!-- 生成倒计时界面，这里我们使用Bootstrap3种的panel组件-->
<div class="panel panel-primary">
	<div class="panel-heading text-center" id="payHead"><h2>等待付款...</h2></div>
    <div class="panel-body text-center">
      <h2 class="text-danger">
      <span class="glyphicon glyphicon-time"></span>
      <!--以下代码我们生成倒计时的具体展现区域-->
      <span id="clock1"></span>
      </h2>
    </div>
</div>
<div class="col-md-10">
<div id = "alipayment">
<form name=alipayment action="/Alipay/generateAliPay" method=post  
			target="_blank">
			<div id="body1" class="show" name="divcontent">
				<dl class="content">
					<div class="form-group">
					<label for="WIDout_trade_no">订单号：</label>	
						<input id="WIDout_trade_no" class="onlyReadInput"  readonly="readonly"  name="WIDout_trade_no"  value="${soid}" 	/>
					</div>
					<hr class="one_line">
					<div class="form-group">
					<label for="WIDsubject">订单名称：</label>	
						<input id="WIDsubject" class="onlyReadInput"  readonly="readonly"  name="WIDsubject" value="${name}" />
					</div>
					<hr class="one_line">
					<div class="form-group">
						<label for="WIDtotal_amount">押金金额：</label>					
						<input id="WIDtotal_amount"   class="onlyReadInput"  readonly="readonly"  name="WIDtotal_amount"  value="${money}" />
					</div>
					<hr class="one_line">
					<div class="form-group">
					<label for="WIDbody">备注：</label>
						<input id="WIDbody"   name="WIDbody"  placeholder="十分钟时间完成支付，否则预定失败"/>
					</div>
					<hr class="one_line">
					<dt></dt>
					<dd id="btn-dd">
						<span class="new-btn-login-sp">
							<button class=" btn btn-default new-btn-login" type="submit" id="pay"
								style="text-align: center;">付 款</button>
						</span> <span class="note-help">如果您点击“付款”按钮，即表示您同意该次的执行操作。</span>
						<button class="btn btn-default" type="button" id="closeBtn" style="text-align: center;">取消订单</button>
					</dd>
				</dl>
			</div>
		</form>
		</div>
	</div>
</body>

<script type="text/javascript">
$(document).ready(function() {
			$('#closeBtn').click(function(){
				$.ajax({
					url:'/SeatOrder/CloseSeatOrder',
					dataType:'json',
					type:"GET",
					traditional: true,
					success:function(data){
						if(data==0){
							layer.msg("订单已被取消或提交！");
							setTimeout(function(){
								 window.location.href="/order";
								},1000);	
						}else if(data==1){
							layer.msg("订单取消成功！");
							setTimeout(function(){
								window.location.reload();
								},1000);}
					},
					error:function(){
						layer.msg("服务器忙！");
					}
				}); 
			});
});
/* $('#payEnd').click(function(){
	window.location.reload();
}); */
$(function(){
	  //定义一个日期
	   var end;
	   /* var timedisplay = new Date(time).format("yyyy年MM月dd日 hh:mm:ss"); */
				$.ajax({
					url:'/SeatOrder/getPayment',
					dataType:'json',
					type:"GET",
					traditional: true,
					async:false,
					success:function(data){
						end =new Date(data.endTime);
					},
					error:function(){
						layer.msg("服务器忙！");
					}
				}); 
	

	  
	  //下面定义倒计时插件
	  $('#clock1').countdown(end,function(event){
	    var timeformat = event.strftime('倒计时 %M:%S'); //定义倒计时格式
	    $(this).html(timeformat);
	  }).on('finish.countdown', function(){ 
	    $(this)
	    .parent()
	    .hide()
	    .html('<button class="btn btn-success btn-lg" id="payEnd"><span class="glyphicon glyphicon-headphones"></span> 付款结束，请重新选座</button>')
	    .addClass('animated flash') // 这里添加一个flash的CSS动画效果
	    .show();
	    //现在你将看到在倒计时完成后会出现一个进入课程的按钮
	     $('#payHead h2').text("付款关闭");
	     $('#pay').attr("disabled","true");
	     $('#payEnd').click(function(){
			window.location.reload();
	     });
	  });
	 
});

Date.prototype.format = function(format) {  
    var date = {  
           "M+": this.getMonth() + 1,  
           "d+": this.getDate(),  
           "h+": this.getHours(),  
           "m+": this.getMinutes(),  
           "s+": this.getSeconds(),  
           "q+": Math.floor((this.getMonth() + 3) / 3),  
           "S+": this.getMilliseconds()  
    };  
    if (/(y+)/i.test(format)) {  
           format = format.replace(RegExp.$1, (this.getFullYear() + '').substr(4 - RegExp.$1.length));  
    }  
    for (var k in date) {  
           if (new RegExp("(" + k + ")").test(format)) {  
                  format = format.replace(RegExp.$1, RegExp.$1.length == 1  
                         ? date[k] : ("00" + date[k]).substr(("" + date[k]).length));  
           }  
    }  
    return format;  
}  
	
</script>

</html>