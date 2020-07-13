/**
 * 
 */
$(function(){
	
	 $('#reselect-button').click(function(){
		 window.location.reload(); 
	 });
	 
	
	 
	 var time =$('#dtp_input1').val();
	 $('.demo').css("display","none");
	 $('#select-time').attr("class","model show");   
	 $('#select-time').modal({
	 	 show:true,
		 backdrop:'static',
		 keyboard:false
	  }); 
	 $('#confirmBtn').attr("disabled",true);
	 $('#returnBtn').click(function(){
	 		$('#select-time').attr("class","model hide");   
	 		
	 		window.history.back(-1);
	 });
	 $('#returnBtn2').click(function(){
	 		$('#add-order').attr("class","model hide");   
	 		
	 		window.location.reload();
	 });
	
/* 	 } */

	var $cart = $('.selected-seats'), //座位区
	$counter = $('#counter'), //座位数数
	$maxnum = $('#maxnum'),//最大容纳人数
	$total = $('#total'); //押金金额
	
	var amount=0;
	var number=0;
	
	
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
				[ 'a', 'available',   '可选' ],
				[ 'a', 'unavailable', '预留'],
				[ 'a', 'selected', '已选'],
				[ 'a', 'unsetting', '']
			]					
		},
		
		naming : { //定义行列等信息 
		    top : false, 
		    left:false,
		    columns: ['0', '1','2', '3', '4','5','6','7','8','9'], 
		    rows: ['0','1','2','3','4','5','6','7','8','9'], 
		    getLabel : function (character, row, column) { 
		    
		    	if(row=='0')
		    		return column; 
		    	else return row+ column; 
		    } 
		}, 

			
		click: function () { //点击事件
			if (this.status() == 'available') { //可选座
		 		var capacity = 0;
				var cash = 0;
				var label = parseInt(this.settings.label);
				$.ajax({
					url:'/SeatManage/getSeatTypeBySeatId',
					dataType:'json',
					type:"GET",
					async:false,
					data : {
						sid : label
					},
					success:function(data){
						capacity=data.capacity;
						cash=data.cash;
					},
					error:function(){
						layer.msg("服务器忙！");
					}
				});	
				$('<li>桌号:'+this.settings.label+'<span>&nbsp;('+capacity+'人座)</span></li>')
					.attr('id', 'cart-item-'+this.settings.id)
					.data('seatId', this.settings.id)
					.appendTo($cart);

				$counter.text(sc.find('selected').length+1);
				
				number=recalculateMaxnum(sc)+capacity;
			    $maxnum.text(number);
			 	   
			    amount=recalculateTotal(sc)+cash;
				$total.text(amount);
				 
				return 'selected';
			} else if (this.status() == 'selected') { //已选中
				var capacity = 0;
				var cash = 0;
				var label = parseInt(this.settings.label);
				$.ajax({
					url:'/SeatManage/getSeatTypeBySeatId',
					dataType:'json',
					type:"GET",
					async:false,
					data : {
						sid : label
					},
					success:function(data){
						capacity=data.capacity;
						cash=data.cash;
					},
					error:function(){
						layer.msg("服务器忙！");
					}
				});	
				//更新数量
				$counter.text(sc.find('selected').length-1);
				//更新就餐人数
				number=recalculateMaxnum(sc)-capacity;
				$maxnum.text(number);
				
				//更新总计
				amount=recalculateTotal(sc)-cash;
				$total.text(amount);
				
				//删除已预订座位
				$('#cart-item-'+this.settings.id).remove();
				//可选座
				return 'available';
			} else if (this.status() == 'unavailable') { //已售出
				return 'unavailable';
			} else {
				return this.style();
			}
		}
	});
	
	
	
	
	
	
	var nowtime = new Date().format("yyyy-MM-dd hh:mm:ss");
	$('.form_datetime').datetimepicker({
		language:  'zh-CN',  //日期
        weekStart: 0, //一周从哪一天开始
        todayBtn:  1, //
        autoclose: 1,
        todayHighlight: 1,
        startView: 2,
        forceParse: 0,
        showMeridian: 1,
        minView: 0,
        format: 'yyyy年mm月dd日 hh:ii',
        todayBtn: 0,
        startDate:nowtime,
        pickerPosition:'bottom-left'
        
    }).on('changeDate',function(){
  
		 $('#confirmBtn').attr("disabled",false);
    	 $('#confirmBtn').click(function(){
    		 
    			//初始化座位
    			$('#select-time').attr("class","model hide");   
    			 $('.demo').css("display","inline");
    			 var time =$('#dtp_input1').val();
    			 var timedisplay = new Date(time).format("yyyy年MM月dd日 hh:mm:ss");
    			 $('#date-display span').text(timedisplay);
    				for(var i=0;i<=9;i++){
    					for(var k=0;k<=9;k++){
    							var str= i+"_"+k;
    							sc.get(str).status('unsetting');
    					}
    				} 
    				
    				$.ajax({
    					url:'/SeatManage/getAvailableSeatsListByTime',
    					dataType:'json',
    					type:"GET",
    					data : {
    						startTime : time
    					},
    					async:false,
    					success:function(data){
    						
    						 for (var i = 0; i < data.length; i++) {
    							var place = data[i].place;
    							sc.get(place).status('available');
    						} 
    					},
    					error:function(){
    						layer.msg("服务器忙！");
    						window.location.reload(); 
    					}
    				});
    				
    				$.ajax({
    					url:'/SeatManage/getOccupiedSeatsListByTime',
    					dataType:'json',
    					type:"GET",
    					data : {
    						startTime : time
    					},
    					async:false,
    					success:function(data){
    						
    						 for (var i = 0; i < data.length; i++) {
    							var place = data[i].place;
    							sc.get(place).status('unavailable');
    						} 
    					},
    					error:function(){
    						layer.msg("服务器忙！");
    					}
    				});
    				
    				
    				 $('#checkout-button').click(function(){
    					
    					 $('#add-order').attr("class","model show");   
    					 $('#add-order').modal({
    					 	 show:true,
    						 backdrop:'static',
    						 keyboard:false
    					  }); 
    					$('#add-order #arrivetime').val(time);
    					for(var i = number;i>0;i--){
    						var n = number-i+1;
    					$('#add-order #num').append("<option value=' "+n+" ' >"+n+"</option>");  
    					}
    					$('#add-order #cash').val(amount);
    				 });
    				 
    				 $('#addOrderCommit').click(function(){
    					 
    					 var sid= [];
    					 sc.find('selected').each(function () {
    						 
    						 sid.push(parseInt(this.settings.label));
    					 });
		    					  $.ajax({
		    					 	url:'/SeatOrder/SubmitSeatOrder',
		    					 	dataType:'json',
		    					 	type:"POST",
		    					 	async:false,
		    					 	traditional: true,
		    					 	data : {
		    					 		sid : sid,
		    					 		arrivetime : $('#add-order #arrivetime').val(),
		    					 		duration : $('#add-order #duration').val(),
		    					 		num:$('#add-order #num').val(),
		    					 		cash:$('#add-order #cash').val(),
		    					 	},
		 					 	
		    					 	success:function(data){			
		    					 		if(data==0){
		    					 			layer.msg("您还未登陆！请登陆后再进行此操作");
		    					 			setTimeout(function(){
		    			    					window.location.href="/login"
		    			    				},2000);
		    					 			
		    					 		}else {
		    					 			layer.msg("提交成功！");
	    					 				setTimeout(function(){
		    					 			window.location.href="/SeatOrder/StartAlipay?id="+data;  
	    					 				},2000);
		    					 		}
		    					 			
	    					 		},
		    					 	error:function(){
		    					 		layer.msg("服务器忙!！");	
		    					 	}
		    					 });   
    				 });
    				 
    		 });
    	 
    	
    	 
    });
	//已售出的座位
	/* sc.get(['1_2', '4_4','4_5','6_6','6_7','8_5','8_6','8_7','8_8', '10_1', '10_2']).status('unavailable'); */
	//sc.get(['5_E', '8_H']).status('unsetting');
	
		
	
});


//计算总金额
function recalculateTotal(sc) {
	var total = 0;
	sc.find('selected').each(function () {
		$.ajax({
			url:'/SeatManage/getSeatTypeBySeatId',
			dataType:'json',
			type:"GET",
			async:false,
			data : {
				sid :  parseInt(this.settings.label)
			},
			success:function(data){
				total += data.cash;
			},
			error:function(){
				layer.msg("服务器忙！");
			}
		});	
	});
			
	return total;	
}

//计算总就餐人数
function recalculateMaxnum(sc) {
	var maxnum = 0;
	sc.find('selected').each(function () {
		$.ajax({
			url:'/SeatManage/getSeatTypeBySeatId',
			dataType:'json',
			type:"GET",
			async:false,
			data : {
				sid :  parseInt(this.settings.label)
			},
			success:function(data){
				maxnum += data.capacity;
			},
			error:function(){
				layer.msg("服务器忙！");
			}
		});	
	});
			
	return maxnum;	
}
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