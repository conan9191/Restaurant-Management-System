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
	href="/css/system.css" />
<link rel="stylesheet" type="text/css"
	href="/plugins/layer/theme/default/layer.css" />
<link rel="stylesheet" type="text/css" href="/css/main.css" />
<script type="text/javascript" src="/plugins/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="/plugins/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/js/jquery-weui.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/js/swiper.js"></script>
<script type="text/javascript" src="/plugins/jquery-weui/lib/fastclick.js"></script>
<script type="text/javascript" src="/plugins/layer/layer.js"></script>
<script type="text/javascript" src="/js/shizumine.js"></script>
<script type="text/javascript" src="/js/index.js"></script>
<script type="text/javascript" src="/plugins/dtree/js/dtree.js"></script>
<!-- <style type="text/css">
#select-menu{float: left;position: absolute;width: 450px;height: 500px;left:600px; top:150px;z-index:2000;outline: none; }
#select-menu{margin: 5px 5px 0 0;font-size: 16px;}
#select-menu p{line-height:26px; font-size:14px; color:#999}
#select-menu a{line-height:26px; font-size:13px; }
#select-menu h{line-height:26px; font-size:13px; }
#select-menu p span{color:#666}
#select-menu .modal-body{height: 230px;width: 200px;}
#select-menu .modal-content{width: 300px;height: 350px;}
#select-menu .pre-scrollable{width: 300px;;}
#select-menu .modal-head{margin-left:20px;margin-top:20px;}
#select-menu .dTreeNode{font-size:15px;}
</style> -->
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
			data-target="#add-item">
			<span class="glyphicon glyphicon-plus"></span> 新添加一行
		</button>
	</div>
	<table class="table table-striped">
		<caption>角色管理</caption>
		<thead>
			<tr>
				<th>角色编号</th>
				<th>角色类型</th>
				<th>描述信息</th>
				 <th>操作</th> 
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${roles}" var="role">
				<tr>
					<td>${role.id}</td>
					<td>${role.name}</td>
					<td>${role.description}</td>
				<td><a href="javascript:edit_menu(${role.id})"
						class="btn btn-success">查看/更改权限</a>
						<button class="btn btn-danger"
							onclick="show_confirm('/SystemManage/deleteRole/${role.id}')">删除角色</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

	<!-- modal:选择菜单 -->
<div class="modal hide" id="select-menu" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
		<div class="modal-head">
		<p><a href="javascript:  d.closeAll();">展开全部</a> | <a href="javascript: d.openAll();">折叠全部</a></p>
		</div>
		<div class="row pre-scrollable">
			<div class="modal-body">
					<div class="dtree">
						<script type="text/javascript">
							
						function getUrlParam(name)  
						{  
						var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象  
						var r = window.location.search.substr(1).match(reg);  //匹配目标参数  
						if (r!=null) return unescape(r[2]); return null; //返回参数值  
						} 

						var rid = getUrlParam('rid');
					
						 
						   d = new dTree('d');
							
							d.add(0,-1,'菜单管理');
							var sign = [];
							var check=0;
							$.ajax({
								url:'/SystemManage/getMenusByRoleId',
								dataType:'json',
								type:"POST",
								async:false, 
								data:{
									rid:rid
								},
								success:function(data){
									for (var i = 0; i < data.length; i++) {
										sign.push(data[i].id);
									}
								},
								error:function(){
									layer.msg("服务器忙！");
								}
							}); 
							
						  
							$.ajax({
								url:'/SystemManage/getMenus',
								dataType:'json',
								type:"GET",
								async:false, 
								success:function(data){
									 for (var i = 0; i < data.length; i++) {
										 for(var k = 0;k<sign.length; k++) {
											 if(data[i].id==sign[k]){
												 check++;
											 }
										}
										 if(check>0){
											 d.add(data[i].id,data[i].parentid,'authority',data[i].id,data[i].name,true);
										 }else if(check==0){
											 d.add(data[i].id,data[i].parentid,'authority',data[i].id,data[i].name);
										 }	
										 check=0;
									}
									 
										
								},
								error:function(){
									layer.msg("服务器忙！");
								}
							});
							
							document.write(d);
							
							d.openAll();
							
							$('#select-menu').attr("class","model show");    
							   $('#select-menu').modal({
							   	 show:true,
							   	 backdrop:'static',
							   	 keyboard:false,
							   	 
							    }); 
							
						/* 	d.add(1,0,'authority','0001','菜品管理');
							d.add(2,1,'authority','0002','管理菜品');
							d.add(3,1,'authority','0002','管理菜品种类');
							
							// dTree实例属性以此为：  节点ID，父类ID，chechbox的名称，chechbox的值，chechbox的显示名称，chechbox是否被选中--默认是不选，chechbox是否可用：默认是可用，节点链接：默认是虚链接
							d.add(6,0,'authority','0012','座位管理 ',true,false);
							d.add(7,6,'authority','0013','查看座位 ',true,false);
							d.add(8,6,'authority','0013','管理座位 ',true,false);
							d.add(9,6,'authority','0013','添加座位 ',true,false);
							
							d.add(11,0,'authority','0016','原料管理 ');
							d.add(12,11,'authority','0017','管理原料 '); */
							
						</script>

				</div>
			<div>
		</div>
			</div>
			</div>
			<div class="modal-footer">
				   	<input  class="btn btn-default"  type='button' name='bTest' value='保存' onclick='test();'/>
		           <button id="returnBtn" type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		     </div>
			</div>
		</div>
	</div>
</div>



</body>
<script type="text/javascript">


$('#returnBtn').click(function(){
		$('#select-menu').attr("class","model hide");   
		window.history.back(-1);
});

function getUrlParam(name)  
{  
var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象  
var r = window.location.search.substr(1).match(reg);  //匹配目标参数  
if (r!=null) return unescape(r[2]); return null; //返回参数值  
} 

var rid = getUrlParam('rid');
 
function test(){
	var count = 0;
	var obj = document.all.authority;	
	var mid=[];
	
	for(i=0;i<obj.length;i++){
		if(obj[i].checked){					
			mid.push(parseInt(obj[i].value));
			count ++;				
		}
	}	
	
		$.ajax({
			url:'/SystemManage/updateRoleMenu',
			dataType:'json',
			type:"POST",
			async:false, 
			traditional: true,
			data:{
				rid:rid,
				mid:mid
			},
			success:function(data){
				layer.msg("保存成功！");
				setTimeout(function(){
					window.history.back(-1);
					},1000);
			},
			error:function(){
				layer.msg("服务器忙！");
			}
		}); 
}

</script>
	
	</body>
</html>
	