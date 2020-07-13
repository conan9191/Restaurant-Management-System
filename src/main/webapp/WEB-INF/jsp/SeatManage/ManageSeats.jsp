<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="col-md-10">
<div class="demo">
   	<div id="seat-map">
		<div class="front">餐厅大门</div>		
	</div>
	<div id = "DetailModal" class="modal hide" aria-hidden="true"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" >
		<div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <div class="modal-title" id="myModalLabel"><h4 ></h4></div>
            </div>
            <div class="modal-body">
            	<div class="col-sm-10">
            			<div class="seatInfo" id=seatInfo>
							<li id="l1"></li>
							<li id="l2"></li>
							<li id="l3"></li>
						</div>
						<button id="btn-modify" type="button" class="btn btn-modify" >修改</button>
						<button id="btn-delete" type="button" class="btn btn-delete" >删除</button>
						<button id="getScheduleBtn" type="button"   class="btn getScheduleBtn" style="margin:10px;">查看预定时间表</button>
						<br>	
						<div  id="getSchedule" class="getSchedule">
						<div class="row pre-scrollable">
							<table border="1" >
								<thead>
								   <tr id="tr1">	</tr> 
								</thead>
								<tbody id="tb">
								</tbody>
							 </table>
							 <h5 id="hh" ></h5>
							 </div>
						</div>
				</div>
			</div>
            <div class="modal-footer">
                <button id="returnBtn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
	</div>
	
	<!-- modal:修改座位 -->
<div class="modal hide" id="edit-seat" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<form role="form" action="/SeatManage/editSeatCommit" method="post">
					<input type="hidden" value=""  id="id" name="id" />
			<div class="form-group">
					<label for="name">修改座位名称</label> <input type="text"
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
						        <input type="radio" name="state"  value="true"  />空闲
						    </label>
						    <label >
						        <input type="radio" name="state" value="false" />占用
						    </label>
						</div>
			</div>
			<div class="form-group">
					<label for="place">座位位置</label> <input type="text"
						class="form-control" id="place" name="place" disabled="disabled"required="required">
			</div>
			<button type="button" class="btn btn-success" id = "editCommit">提交</button>
	</form>
			</div>
			<div class="modal-footer">
                <button id="returnBtn2" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
		</div>
	</div>
</div>
	<div class="booking-details">
		<button id="btn-add" type="button" class="btn btn-add" >添加座位</button>
		<div id="focused-seats">
			<h3 id='h1'></h3>
			<h3 id= 'h2'></h3>
			<h3 id= 'h3'></h3>
			<h6 id= 'h4'></h6>
		</div>
		<div id="legend"></div>
	</div>
</div>
</div>

<<script type="text/javascript">
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
			'aaaaaaaaaa'],
			
		legend : { //定义图例
			node : $('#legend'),
			items : [
				[ 'a', 'available',   '空闲' ],
				[ 'a', 'unavailable', '占用'],
				/* [ 'a', 'selected', '已选'], */
				[ 'a', 'unsetting', '']
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
			  
             if (this.status() == 'available'||this.status() == 'unavailable') {  
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
							
            	 			$('#focused-seats #h1').text("当前座位："+this.settings.label);
							$('#focused-seats #h2').text("第"+n_row+"排，第"+n_column+"列");
							if(this.status() == 'unavailable')
							$('#focused-seats #h3').text("状态：占用中").css("color","red");
							else if(this.status() == 'available')
							$('#focused-seats #h3').text("状态：空闲中").css("color","green");
							$('#focused-seats #h4').text("点击查看详情");
                 return 'focused';  
             } else  {  
                 return this.style();  
             }  
         },  
         blur  : function() {  
        		/* $('#focused-seats #h1').text("当前座位：无");
        		$('#focused-seats #h2').text("第0排，第0列");
        		$('#focused-seats #h3').text("状态：无状态");
        		$('#focused-seats #h4').text("移动光标查看座位"); */
             return this.status();  
         },

 	click: function () { //点击事件

			 var detailmodal = $('#DetailModal');
			 
			 if(this.status()=='available'){
				 
				  detailmodal.attr("class","model show");   
				 	 detailmodal.modal({
				 	 show:true,
					 backdrop:'static',
					 keyboard:false
				 }); 
			
				 	
				 	var btn = $('#returnBtn');
				 	btn.click(function(){
				 		 detailmodal.attr("class","model hide");   
				 		 window.location.reload();
				 	});
				 	
					$('#returnBtn2').click(function(){
				 		$("#edit-seat").attr("class","model hide");   
				 	});
				 	
				 var place = this.settings.id;
				 var typeId=0;
				 var seatId=0;
				$.ajax({
					url:'/SeatManage/getSeatByPlace',
					dataType:'json',
					type:"GET",
					async:false,
					data:{
						place:place
					},
					success:function(data){
					    $("#myModalLabel").text("正在查看座位"+data.name+" 的信息..." );
					    $("#seatInfo #l1").text("座位名称： "+data.name);
				        $("#seatInfo #l3").text("座位状态：空闲中").css("color","Green");
					    typeId=data.seatTypeId;
					    seatId=data.id;
					},
					error:function(){
						layer.msg("服务器证忙！");
					}
				});
			
			 $.ajax({
					url:'/SeatManage/getSeatType',
					dataType:'json',
					type:"GET",
					async:false,
					data: {
						id: typeId
					},
					success:function(data){
						 $("#seatInfo #l2").text("座位类型："+data.name);
					},
					error:function(){
						layer.msg("服务器忙！");
					}
				});   
			 $('#getScheduleBtn').click(function(){
				 $('#getScheduleBtn').attr("disabled","disabled");
					$.ajax({
						url:'/SeatManage/getSeatScheduleListBySeatId',
						dataType:'json',
						type:"GET",
						async:false,
						data: {
							sid: seatId
						},
						success:function(data){
							 $("#getSchedule #tr1").append("<th>时间表号</th>");
							 $("#getSchedule #tr1 ").append("<th>订单号</th>");
							 $("#getSchedule #tr1 ").append("<th>到达时间</th>");
					  	 	 $("#getSchedule #tr1 ").append("<th>结束时间</th>");
						  	 	 if(data.length==0) 	 $("#getSchedule #hh").text("暂无订座信息").css("color","red");
							for (var i = 0; i < data.length; i++) {
								var time1 = new Date(data[i].starttime).format("yyyy-MM-dd hh:mm:ss");
								var time2 = new Date(data[i].endtime).format("yyyy-MM-dd hh:mm:ss");
								 $("#getSchedule #tb").append("<tr><td>"
																					 +data[i].id
																					 +"</td><td>"
																					 +data[i].soid
																					 +"</td><td>"
																					 +time1+"</td><td>"
																					 +time2+"</td></tr>");
							} 
						},
						error:function(){
							layer.msg("服务器忙！");
						}
					});   
			 });
			 	
			 $('#btn-delete').on('click',function() {  
				    $.ajax({ 
				    			type: "get",
				    			url: '/SeatManage/deleteSeat',
								data: {
									id:seatId
								},
				    			success:function(data){
									window.location.reload();
								}, 
								error:function(){
									layer.msg("服务器忙！");
								}
							});  
				});  
				
			 
				$('#btn-modify').click(function(){
					$.ajax({
						url : '/SeatManage/editSeat',
						dataType : "json",
						type : "GET",
						data : {
							sid : seatId
						},
						success : function(data) {
						
							$("#edit-seat #id").val(data.id);
							$("#edit-seat #name").val(data.name);
							$("#edit-seat #op1").val(data.seatTypeId);
						 	if(data.state==true)
							$("#edit-seat #state input[value='true']").prop("checked", true);
							else if(data.state==false)
							$("#edit-seat #state input[value='false']").prop("checked", true);
							var row="";
							var column="";
							var sign=0;
							for(var i=0;i<data.place.length;i++){
								if(data.place[i]=='_') sign=i;
							}
							for(var k=0;k<data.place.length;k++){
								if(k<sign) row=row+data.place[k];
								else if (k>sign)column=column+data.place[k];
							}
							var n_row=parseInt(row)+1;
							var n_column=parseInt(column)+1;
							$("#edit-seat #place").val("第"+ n_row+"排，第"+n_column+"列");
							$("#edit-seat").attr("class","model show");   
							$("#edit-seat").modal({
							 	 show:true,
								 backdrop:'static',
								 keyboard:false
							 }); 
						},
						error : function() {
							layer.msg("服务器正忙！");
						}
					});
				});
				 return 'available';
			 } else if(this.status()=='unavailable'){
					var btn = $('#returnBtn');
				 	btn.click(function(){
				 		 detailmodal.attr("class","model hide");   
				 		location.reload();
				 	});
				 	$('#returnBtn2').click(function(){
				 		$("#edit-seat").attr("class","model hide");   
				 	});
				  detailmodal.attr("class","model show");   
				 	 detailmodal.modal({
				 	 show:true,
					 backdrop:'static',
					 keyboard:false
				 }); 
				 var btn = $('#returnBtn');
				 	btn.click(function(){
				 		  detailmodal.attr("class","model hide");   
				 		  
				 	});
		
				 var place = this.settings.id;
				 var seatId=0;
				 var typeId=0;
				$.ajax({
					url:'/SeatManage/getSeatByPlace',
					dataType:'json',
					type:"GET",
					async:false,
					data:{
						place:place
					},
					success:function(data){
						    $("#myModalLabel").text("正在查看座位"+data.name+" 的信息..." );
						    $("#seatInfo #l1").text("座位名称： "+data.name);
						    $("#seatInfo #l3").text("座位状态：占用中").css("color","Red");
						   typeId=data.seatTypeId;
						   seatId=data.id;
					},
					error:function(){
						layer.msg("服务器证忙！");
					}
				});
				 $.ajax({
						url:'/SeatManage/getSeatType',
						dataType:'json',
						type:"GET",
						async:false,
						data: {
							id: typeId
						},
						success:function(data){
							 $("#seatInfo #l2").text("座位类型："+data.name);
						},
						error:function(){
							layer.msg("服务器忙！");
						}
					});   
				 $('#getScheduleBtn').click(function(){
					 $('#getScheduleBtn').attr("disabled","disabled");
						$.ajax({
							url:'/SeatManage/getSeatScheduleListBySeatId',
							dataType:'json',
							type:"GET",
							async:false,
							data: {
								sid: seatId
							},
							success:function(data){
									 $("#getSchedule #tr1").append("<th>时间表号</th>");
									 $("#getSchedule #tr1 ").append("<th>订单号</th>");
									 $("#getSchedule #tr1 ").append("<th>到达时间</th>");
							  	 	 $("#getSchedule #tr1 ").append("<th>结束时间</th>");
							  	 	 if(data.length==0) 	 $("#getSchedule #hh").text("暂无订座信息").css("color","red");
								for (var i = 0; i < data.length; i++) {
									var time1 = new Date(data[i].starttime).format("yyyy-MM-dd hh:mm:ss");
									var time2 = new Date(data[i].endtime).format("yyyy-MM-dd hh:mm:ss");
									 $("#getSchedule #tb").append("<tr><td>"
																					 +data[i].id
																					 +"</td><td>"
																					 +data[i].soid
																					 +"</td><td>"
																					 +time1+"</td><td>"
																					 +time2+"</td></tr>");
								} 
							},
							error:function(){
								layer.msg("服务器忙！");
							}
						});   
				 });
				 
				 $('#btn-delete').on('click',function() {  
					    $.ajax({ 
					    			type: "get",
					    			url: '/SeatManage/deleteSeat',
									data: {
										id:seatId
									},
					    			success:function(data){
										window.location.reload();
									}, 
									error:function(){
										layer.msg("服务器忙！");
									}
								});  
					});  
				 
					$('#btn-modify').click(function(){
						$.ajax({
							url : '/SeatManage/editSeat',
							dataType : "json",
							type : "GET",
							data : {
								sid : seatId
							},
							success : function(data) {
							
								$("#edit-seat #id").val(data.id);
								$("#edit-seat #name").val(data.name);
								$("#edit-seat #op1").val(data.seatTypeId);
							 	if(data.state==true)
								$("#edit-seat #state input[value='true']").prop("checked", true);
								else if(data.state==false)
								$("#edit-seat #state input[value='false']").prop("checked", true);
								var row="";
								var column="";
								var sign=0;
								for(var i=0;i<data.place.length;i++){
									if(data.place[i]=='_') sign=i;
								}
								for(var k=0;k<data.place.length;k++){
									if(k<sign) row=row+data.place[k];
									else if (k>sign)column=column+data.place[k];
								}
								var n_row=parseInt(row)+1;
								var n_column=parseInt(column)+1;
								$("#edit-seat #place").val("第"+ n_row+"排，第"+n_column+"列");
								$("#edit-seat").attr("class","model show");   
								$("#edit-seat").modal({
								 	 show:true,
									 backdrop:'static',
									 keyboard:false
								 }); 
							},
							error : function() {
								layer.msg("服务器正忙！");
							}
						});
					});
				 return 'unavailable';
			 }	
}

	
		
		/*  click: function () { //点击事件
			if (this.status() == 'available') { //可选座
				$('<li>桌号:'+this.settings.label+'</li>')
					.attr('id', 'cart-item-'+this.settings.id)
					.data('seatId', this.settings.id)
					.appendTo($cart);

				$counter.text(sc.find('selected').length+1);
				$total.text(recalculateTotal(sc)+price);
							
				return 'selected';
			} else if (this.status() == 'selected') { //已选中
				//更新数量
				$counter.text(sc.find('selected').length-1);
				//更新总计
				$total.text(recalculateTotal(sc)-price);
						
				//删除已预订座位
				$('#cart-item-'+this.settings.id).remove();
				//可选座
				return 'available';
			} else if (this.status() == 'unavailable') { //已售出
				return 'unavailable';
			} else {
				return this.style();
			}
		}  */
		
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
				else if(state==false) sc.get(place).status('unavailable');
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

$('#editCommit').on('click',function() {  
	var id = $('#edit-seat #id').val();
	var name = $('#edit-seat #name').val();
	var seatTypeId = $('#edit-seat #op1').val();
	 var state = $('#edit-seat #state input:radio:checked').val();
    $.ajax({ 
    			type: "POST",
    			url: '/SeatManage/editSeatCommit',
				data: {
					id:id,
				    name: name,
				    seatTypeId:seatTypeId,
				    state:state
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

$('#btn-add').on('click',function() {  
	
  			 $.ajax({ 
    			type: "GET",
    			url: '/SeatManage/addSeats',
				data: {
				},
    			success:function(data){
    				 window.location.href = 
    				'/SeatManage/addSeats';
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
