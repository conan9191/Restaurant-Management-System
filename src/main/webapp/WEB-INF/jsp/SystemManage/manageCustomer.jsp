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
	href="/plugins/dtree/css/dtree.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<link rel="stylesheet" type="text/css" href="/css/SeatOrder.css" />
<script type="text/javascript" src="/plugins/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/js/jquery-weui.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/js/swiper.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/lib/fastclick.js"></script>
<script type="text/javascript" src="/plugins/layer/layer.js"></script>
<script type="text/javascript" src="/js/shizumine.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript" src="/plugins/dtree/js/dtree.js"></script>
<style type="text/css">

#update-user .modal-body{height: 200px;}
#delete-user .modal-body{height: 270px;}
#update-user button{width:100%;}


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
	
 <div class="col-md-10">
	<div class="pull-right">

	</div>
	<table class="table table-striped">
		<caption>用户管理</caption>
		<thead>
			<tr>
				<th>用户编号</th>
				<th>用户名</th>
				<th>用户昵称</th>
				<th>联系电话</th> 
				<th>电子邮箱</th>
				<th>注册日期</th>
				<th>会员等级</th>
				<th>会员积分</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${customers}" var="customer">
				<tr>
					<td>${customer.id}</td>
					<td>${customer.username}</td>
					<td>${customer.nickname}</td>
					<td>${customer.phone}</td>
					<td>${customer.email}</td>
					<td>${customer.createdDate}</td>
					<td style="text-align:center;"><img class="vip_image" src="${customer.rankURL}" width="25px" height="25px" ></td>
					<td style="text-align:center;">${customer.point}</td>
					<td><a id="button1" onclick="k(${customer.id})" class="btn btn-success" >会员权限</a>
						<button class="btn btn-danger"
							onclick="show_confirm('/SystemManage/deleteUser/${customer.id}')">删除用户</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


<div class="modal fade" id="update-user" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				
					<div class="form-group">
						<div class="col-sm-12 col-sm-offset--2">
							<a class="btn btn-primary btn-block" onclick="g()">授权会员</a>
						</div>
					</div>
					<div id="addVip">
					<div class="form-group">
						<label for="rank" class="col-sm-8 control-label">会员等级</label>
						<div class="col-sm-12">
						<select id="rank" class="form-control" name="rank" >
								<option>---设置会员等级---</option>
								<option value="1">VIP1</option>
								<option value="2">VIP2</option>
								<option value="3">VIP3</option>
						</select>
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<label for="point" class="col-sm-8 control-label">会员积分</label>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="point" name="point"
								value="0" placeholder="设置会员积分" maxlength="20" >
						</div>
					</div> 
					</div>
					<br>
					<br>
					
					<div class="form-group" >
						<div class="col-sm-10 col-sm-offset-1">
							<button type="submit" id="submitBtn"class="btn btn-success">提交</button>
							<button class="btn btn-danger" id ="returnBtn" data-dismiss="modal">取消</button>
						</div>
					</div>
				
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="delete-user" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				
					
					
					<div class="form-group">
						<label for="rank" class="col-sm-8 control-label">会员等级</label>
						<div class="col-sm-12">
						<select id="rank" class="form-control" name="rank">
								<option>---设置会员等级---</option>
								<option value="1">VIP1</option>
								<option value="2">VIP2</option>
								<option value="3">VIP3</option>
						</select>
						</div>
					</div>
					<br>
					<br>
					<div class="form-group">
						<label for="point" class="col-sm-8 control-label">会员积分</label>
						<div class="col-sm-12">
							<input type="text" class="form-control" id="point" name="point"
								placeholder="设置会员积分" maxlength="20" >
						</div>
					</div>
					
					<br>
					<br>
					<br>
					
					
					<div class="form-group">
					<div class="col-sm-offset--2 col-sm-10" id="deleteVip">
						 <!-- <button class="btn  btn-danger"
							onclick="show_confirm('/SystemManage/deleteVip/10')">解除会员</button>  -->
						</div>
						<div class="col-sm-offset-8 col-sm-10">
							
							<button type="submit" id="submitBtn2"class="btn btn-success">提交</button>
							<button class="btn btn-danger" id ="returnBtn" data-dismiss="modal">取消</button>
						</div>
					</div>
				
			</div>
		</div>
	</div>
</div>
	
</body>
<script type="text/javascript">

var uid = 0;
function k(id){ 
	$('#deleteVip').text("");
	$('#addVip').css("display","none");
	$('#submitBtn').attr("disabled","true");
	$('#update-user .modal-body').css("height","200px");
	var rank=0;
	var point=0;
	$.ajax({
		url:'/SystemManage/getVip',
		dataType:'json',
		type:"GET",
		async:false, 
		traditional: true,
		data:{
			uid:id
		},
		success:function(data){
			
				rank=data.rank;
				point=data.point;
			
		},
		error:function(){
			layer.msg("服务器忙！");
		}
	});  
	
	if(rank!=null){
		$('#delete-user #point').val(point);
		$('#delete-user #rank').val(rank);
		$('#delete-user').modal({
		 	 show:true,
			 backdrop:'static',
			 keyboard:false
		  });
		 
		 var str="/SystemManage/deleteVip/"+id;
		 
		$('#deleteVip').append("<button class=\"btn  btn-danger\"onclick=\"show_confirm('"+str+"')\">解除会员</button>"); 
	
		
		
	}else{
		
		$('#update-user').modal({
		 	 show:true,
			 backdrop:'static',
			 keyboard:false
		  });
		
		
		
	}
	
	uid=id;
}
function g(){
	
	$('#addVip').css("display","block");
	$('#submitBtn').removeAttr("disabled");
	$('#update-user .modal-body').css("height","250px");
	 $('#submitBtn').click(function(){
		
		var u_point=$('#update-user #point').val();
		var u_rank=$('#update-user #rank').val();
		var u_uid = uid;

	    $.ajax({
			url:'/SystemManage/addVip',
			dataType:'json',
			type:"POST",
			async:false, 			
			data:{
				rank:u_rank,
				point:u_point,
				uid:u_uid			
			},
			success:function(data){
				layer.msg("会员授权成功！");
				setTimeout(function(){
					window.location.reload();
					},1000);
			},
			error:function(){
				layer.msg("服务器忙！");
				window.location.reload();
			}
		});    
	}); 
}

 $('#submitBtn2').click(function(){
	var d_point=$('#delete-user #point').val();
	var d_rank=$('#delete-user #rank').val();
	$.ajax({
		url:'/SystemManage/updateVip',
		dataType:'json',
		type:"POST",
		async:false, 
		traditional: true,
		data:{
			uid:uid,
			rank:d_rank,
			point:d_point
		},
		success:function(data){
			layer.msg("会员信息更新成功！");
			setTimeout(function(){
				window.location.reload();
				},1000);
		},
		error:function(){
			layer.msg("服务器忙！");
			window.location.reload();
		}
	});  
});  
 
 
</script>
</html>
	