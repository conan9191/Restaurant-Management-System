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
	href="/plugins/Seat-Charts/css/jquery.seat-charts.css" />
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
<script type="text/javascript" src="/plugins/Seat-Charts/js/jquery.seat-charts.min.js"></script>
<style type="text/css">
.front{width: 570px;margin: 5px 32px 45px 0px;background-color: #f0f0f0; color: #666;text-align: center;padding: 3px;border-radius: 5px; }
#add-seat{float: left;position: absolute;width: 600px;height: 650px;left:100px; top:150px;z-index:200;outline: none; }
#add-seat {margin: 5px 5px 0 0;font-size: 16px;}
#add-seatp{line-height:26px; font-size:16px; color:#999}
#add-seat p span{color:#666}
#add-seat .modal-body{height: 420px;}
.btn-success{width: 570px;}
.modal-backdrop{z-index:10}
.booking-details {float: left;position: absolute;width:200px;height: 450px; left:800px;top:50px}
.booking-details h3 {margin: 5px 5px 0 0;font-size: 16px;}
.booking-details p{line-height:26px; font-size:16px; color:#999}
.booking-details p span{color:#666}
div.seatCharts-cell {color: #182C4E;height: 50px;width: 50px;line-height: 50px;margin: 3px;float: left;text-align: center;outline: none;font-size:23px;font-family: SimHei;}
div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius:5px;-moz-border-radius:5px;border-radius: 5px;}
div.seatCharts-row {height: 60px;}
div.seatCharts-seat.available {background-color: #A4A4A4;cursor:default; }
div.seatCharts-seat.selected {background-color: #07C844;}
div.seatCharts-seat.focused {background: url(/pic/添加2.png) ;background-size:100% 100%;-moz-background-size:100% 100%;font-size: 0px;}
div.seatCharts-seat.unavailable {background-color: #EC4403;cursor:default; }
div.seatCharts-seat.unsetting {float:left;background: url(/pic/添加.png) ;background-size:100% 100%;-moz-background-size:100% 100%;font-size: 0px; opacity:0.3;} 
div.seatCharts-container {border: 1px dotted #adadad;width: 700px;padding: 20px;float: left;margin-left:50px; margin-top:20px; padding-left: 60px;}
div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;}
.seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
div.seatCharts-legend .seatCharts-cell{cursor:default; }
span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
.checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
#focused-seats {width:145px; height:130px; border:1px solid #d3d3d3; background:#f7f7f7; margin:10px; padding:10px;margin-left:0; }
#focused-seats.h{ line-height:56px;font-size:24px; font-weight:bold; text-align:left ;}
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
								<div class="col-md-6"></div>
								<div class="col-md-6"></div>
							</div>
						</div>
					</div>
				</li>
				<li><a href="index.html"><i class="fa fa-dashboard "></i>Home</a>
				</li>
				<!-- 主菜单  -->
				<li><a type="button" data-toggle="collapse"
					data-target="#menu-manage" style="cursor: pointer;">菜品管理</a> <!-- 次级菜单 -->
					<ul id="menu-manage" class="dropdown collapse">
						<li><a href="/manage/findAllItemType">菜品种类管理</a></li>
						<li><a href="/manage/findAllItemMaterial">原料种类管理</a></li>
						<li><a href="/manage/findAllItem">菜品管理</a></li>
					</ul></li>
			</ul>
		</div>
	</nav>
	</div>
<div class="col-md-10">
<div class="demo">

   	<div id="seat-map">
		<div class="front">餐厅大门</div>		
	</div>
	
	<!-- modal:添加座位 -->
<div class="modal hide" id="add-seat" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<form role="form" action="/SeatManage/addSeat" method="post">
			<div class="form-group">
				<label for="id">座位ID</label>
					<input type="text" disabled="disabled" class="form-control"  value=""  id="id" name="id" />
			</div>
			<div class="form-group">
					<label for="name">座位名称</label> <input type="text"
						class="form-control" id="name" name="name" placeholder="请输入座位名称"
						value="" maxlength="20" required="required">
			</div>
			<div class="form-group">
				<label for="seat-type" >座位种类</label>
					<select class="form-control" name="seatTypeId"  id ='op1'>
					<option  value="" >---请选择座位种类---</option>
					</select>	
			</div>
			<div class="form-group">
					<label for="state">座位状态</label> 
					<div class="radio" id = "state">
						     <label>
						        <input type="radio" name="state"  value="true" checked />空闲
						    </label>
						    <label >
						        <input type="radio" name="state" value="false" />占用
						    </label>
						</div>
			</div>
			<div class="form-group">
					<label for="place">座位位置</label> 
					<h4  id="h"></h4>
					<input type="hidden" class="form-control" id="place" name="place" disabled="disabled"required="required">
			</div>
			<button type="button" class="btn btn-success" id = "addCommit">提交</button>
	</form>
			</div>
			<div class="modal-footer">
                <button id="returnBtn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
		</div>
	</div>
</div>

	<div class="booking-details">
		<button id="btn-manage" type="button" class="btn btn-add" >返回</button>
		<div id="focused-seats">
			<h3 id='h1'></h3>
			<h3 id= 'h2'></h3>
			<h6 id= 'h4'></h6>
		</div>
		<div id="legend"></div>
	</div>
	
</div>
</div>

<script>

$(document).ready(function() {

	var sc = $('#seat-map').seatCharts({
		map: [  //座位图
			'aaaaaaaaaa',
            'aaaaaacccc',
            'aaaaaaaaaa',
            'aaaaaaaaaa',
			'aaaaaaaaab',
			'aaaaaaaaaa',
			'aaaaaaaaaa',
            'aaaaaaaaaa',
            'aaaaaaaaaa',
			'aaaaaaaaaa'
		],
		legend : { //定义图例
			node : $('#legend'),
			items : [
				[ 'a', 'available',   '空闲' ],
				[ 'a', 'unavailable', '占用'],
				/* [ 'a', 'selected', '已选'], */
				[ 'a', 'unsetting', '添加']
			]					
		},
		
		naming : { //定义行列等信息 
		    top :false, 
		    left:false,
		    columns: ['0', '1','2', '3', '4','5','6','7','8','9'], 
		    rows: ['0','1','2','3','4','5','6','7','8','9'], 
		    getLabel : function (character, row, column) { 
		    
		    	if(row=='0')
		    		return column; 
		    	else return row+ column; 
		    } 
		}, 

		 focus : function() {  
			  
             if (this.status() =='unsetting') {  
            	    var row="";
					var column="";
					var sign=0;
					var str=this.settings.id;
					for(var i=0;i<str.length;i++){
						if(str[i]=='_') sign=i;
					}
					for(var k=0;k<str.length;k++){
						if(k<sign) row=row+str[k];
						else if (k>sign)column=column+str[k];
					}
					var n_row=parseInt(row)+1;
					var n_column=parseInt(column)+1;
					
    	 			$('#focused-seats #h1').text("添加座位："+this.settings.label);
					$('#focused-seats #h2').text("第"+n_row+"排，第"+n_column+"列");
					$('#focused-seats #h4').text("点击添加座位");
            	    return 'focused'; 
             } else   {  
                return this.style();  
             }  
         },  
         blur  : function() {  
             return this.status();  
         },

 	click: function () { //点击事件

		
			 
			 if(this.status()=='unsetting'){
				 
				 $('#add-seat').attr("class","model show");   
				 $('#add-seat').modal({
				 	 show:true,
					 backdrop:'static',
					 keyboard:false
				  }); 
				
				 
				 	var btn = $('#returnBtn');
				 	btn.click(function(){
				 		$('#add-seat').attr("class","model hide");   
				 		/*  window.location.reload(); */
				 	});
				
				 	
				 var place = this.settings.id;
				 var str='';
				 for(var i = 0;i<place.length;i++){
					 if(place[i]!='_') str=str+place[i];
				 }
				 var seatId = parseInt(str);
				$("#add-seat #id").val(seatId);   
				
				var row="";
				var column="";
				var sign=0;
				for(var i=0;i<place.length;i++){
					if(place[i]=='_') sign=i;
				}
				for(var k=0;k<place.length;k++){
					if(k<sign) row=row+place[k];
					else if (k>sign)column=column+place[k];
				}
				var n_row=parseInt(row)+1;
				var n_column=parseInt(column)+1;
				$("#add-seat #h").text("第"+ n_row+"排，第"+n_column+"列").css("color","green");
				$("#add-seat #place").val(place);

			    $("#add-seat").attr("class","model show");   
				$("#add-seat").modal({
				 	   show:true,
						backdrop:'static',
					    keyboard:false
				 }); 

				 return 'unsetting';		
			}else  return this.style();  

	}
});
	
	
	
	//初始化座位
	for(var i=0;i<=9;i++){
		for(var k=0;k<=9;k++){
				var str= i+"_"+k;
				sc.get(str).status('unsetting');
		}
	} 
	
	$.ajax({
		url:'/SeatManage/getSeatsList',
		dataType:'json',
		type:"GET",
		async:false,
		success:function(data){
			for (var i = 0; i < data.length; i++) {
				var state = data[i].state;
				var place = data[i].place;
				if(state==true)
				sc.get(place).status('available');
				else sc.get(place).status('unavailable');
			}
		},
		error:function(){
			layer.msg("服务器忙！");
		}
	});
});

$.ajax({
	url:'/SeatManage/getSeatTypesList',
	dataType:'json',
	type:"GET",
	data: {
	},
	success:function(data){
		for(var i=0;i<data.length;i++){
			$("#op1").append("<option  value='"+data[i].id+"'>"+data[i].name+"</option>"); 
		}
	},
	error:function(){
		layer.msg("服务器忙！");
	}
});   

$('#addCommit').on('click',function() {  
	var id = $('#add-seat #id').val();
	var name = $('#add-seat #name').val();
	var seatTypeId = $('#add-seat #op1').val();
	var state = $('#add-seat #state input:radio:checked').val();
	var place = $('#add-seat #place').val();
    $.ajax({ 
    			type: "POST",
    			url: '/SeatManage/addSeat',
				data: {
					id:id,
				    name: name,
				    seatTypeId:seatTypeId,
				    state:state,
				    place:place
				},
				scriptCharset: 'utf-8'  ,
    			success:function(data){
					window.location.reload();
				}, 
				error:function(){
					layer.msg("服务器忙！");
				}
			});  
});  

$('#btn-manage').on('click',function() {  
    $.ajax({ 
    			type: "GET",
    			url: '/SeatManage/ManageSeats',
				data: {
				},
    			success:function(data){
    				 window.location.href = '/SeatManage/ManageSeats';
				}, 
				error:function(){
					layer.msg("服务器忙！");
				}
			});  
});  

/* //计算总金额
function recalculateTotal(sc) {
	var total = 0;
	sc.find('selected').each(function () {
		total += price;
	});
			
	return total;
	
	
} */


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
</body>
</html>
