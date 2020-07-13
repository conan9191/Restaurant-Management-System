<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="header.jsp"%>

<div class="col-md-10">
	<div class="pull-right">
		<button class="btn btn-success" data-toggle="modal"
			data-target="#add-itemType">
			<span class="glyphicon glyphicon-plus"></span> 新添加一行
		</button>
	</div>
	<table class="table table-striped">
		<caption>菜品种类列表</caption>
		<thead>
			<tr>
				<th>菜品种类编号</th>
				<th>名称</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${itemTypes}" var="itemType">
				<tr>
					<td>${itemType.id}</td>
					<td>${itemType.name }</td>
					<td><a href="javascript:edit_itemType(${itemType.id})"
						class="btn btn-success">修改</a>
						<button class="btn btn-danger"
							onclick="show_confirm('/manage/deleteItemType/${itemType.id}')">删除</button></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<div class="modal fade" id="add-itemType" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<form role="form" class="form-horizontal"
					action="/manage/addItemTypeCommit" method="post">
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-4">
							<h3>添加菜品种类</h3>
						</div>
					</div>
					<div class="form-group">
						<label for="name" class="col-sm-3 control-label">菜品种类名称</label>
						<div class="col-sm-9">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="请输入菜品种类名称" maxlength="20" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-sm-4">
							<button type="submit" class="btn btn-success">提交</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="edit-itemType" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<form role="form" class="form-horizontal"
					action="/manage/editItemTypeCommit" method="post">
					<div class="form-group">
						<h3 class="col-sm-offset-2 col-sm-4">修改菜品种类</h3>
					</div>
					<input type="hidden" name="id" id="id" />
					<div class="form-group">
						<label class="col-sm-2" for="name">修改名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="请输入菜品种类名称" maxlength="20" required="required">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-4">
							<button type="submit" class="btn btn-success">提交</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="footer.jsp"%>