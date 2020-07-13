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

#update-menu .modal-body{height: 100px;}
#add-menu .modal-body{height: 200px;}

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
		<button class="btn btn-success" data-toggle="modal"
			data-target="#add-menu">
			<span class="glyphicon glyphicon-plus"></span> 新添加一行
		</button>
	</div>
	<table class="table table-striped">
		<caption>子菜单管理</caption>
		<thead>
			<tr>
				<th>子菜单编号</th>
				<th>子菜单名称</th>
				<th>描述信息</th>
				<th>URL</th>
				<th>操作</th> 
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${childs}" var="child">
				<tr>
					<td>${child.id}</td>
					<td>${child.name}</td>
					<td>${child.description}</td>
					<td>${child.url}</td>
				<td><a id="button1" onclick="k(${child.id})" class="btn btn-success" >修改子菜单URL</a>
						<button class="btn btn-danger"
							onclick="show_confirm('/SystemManage/deleteMenu/${child.id}')">删除菜单</button>
					<a href="/SystemManage/manageMenu"
						class="btn btn-success">返回父级菜单</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- 添加子菜单 -->
<div class="modal fade" id="add-menu" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">菜单名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="请输入菜单名称" maxlength="20" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="description" class="col-sm-3 control-label">菜单描述</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="description" name="description"
								placeholder="请输入菜单描述" maxlength="20" >
						</div>
					</div>
					<div class="form-group">
						<label for="a_url" class="col-sm-3 control-label">URL</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="a_url" name="a_url"
								placeholder="请输入菜单URL" maxlength="50" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-4">
							<button type="submit" id="submitBtn"class="btn btn-success">提交</button>
							<button class="btn btn-danger" id ="returnBtn" data-dismiss="modal">取消</button>
						</div>
					</div>
				
			</div>
		</div>
	</div>
</div>
<!-- 修改子菜单 -->
<div class="modal fade" id="update-menu" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				
					<div class="form-group">
						<label for="url" class="col-sm-3 control-label">URL名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="url" name="url"
								placeholder="请输入URL" maxlength="50" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-4">
							<button type="submit" id="updateBtn"class="btn btn-success">提交</button>
							<button class="btn btn-danger" id ="returnBtn" data-dismiss="modal">取消</button>
						</div>
					</div>
				
			</div>
		</div>
	</div>
</div>


	
</body>
<script type="text/javascript">



function k(id){   

	
	$('#update-menu').modal({
	 	 show:true,
		 backdrop:'static',
		 keyboard:false
	  }); 
	
	var o_url = "";
	$.ajax({
		url:'/SystemManage/getMenu',
		dataType:'json',
		type:"GET",
		async:false, 
		traditional: true,
		data:{
			id:id
		},
		success:function(data){
			o_url=data.url
		},
		error:function(){
			layer.msg("服务器忙！");
		}
	});  
	
	
	$('#url').val(o_url);
	
	$('#updateBtn').click(function(){
		
		var url = $('#url').val();

		$.ajax({
			url:'/SystemManage/updateMenu',
			dataType:'json',
			type:"POST",
			async:false, 
			traditional: true,
			data:{
				
				id:id,
				url:url
				
			},
			success:function(data){
				layer.msg("URL更新成功！");
				setTimeout(function(){
					window.location.reload();
					},1000);
				
			},
			error:function(){
				layer.msg("服务器忙！");
			}
	});  
	});
	  
}

$('#add-menu').click(function(){
	$('#add-menu').modal({
	 	 show:true,
		 backdrop:'static',
		 keyboard:false
	  }); 

});

$('#returnBtn').click(function(){
	   
	window.location.reload();
});


$('#submitBtn').click(function(){
	var name = $('#name').val();
	var description = $('#description').val();
	var a_url = $('#a_url').val();
	var parentId=0;
	$.ajax({
		url:'/SystemManage/getParentId',
		dataType:'json',
		type:"GET",
		async:false, 
		traditional: true,
		success:function(data){
			parentId=data;
		},
		error:function(){
			layer.msg("服务器忙！");
		}
}); 
	
	$.ajax({
			url:'/SystemManage/addMenu',
			dataType:'json',
			type:"POST",
			async:false, 
			traditional: true,
			data:{
				name:name,
				description:description,
				url:a_url,
				parentId:parentId
			},
			success:function(data){
				layer.msg("菜单添加成功！");
				setTimeout(function(){
					window.location.reload();
					},1000);
				
			},
			error:function(){
				layer.msg("服务器忙！");
			}
	}); 
}); 
</script>
</html>
	