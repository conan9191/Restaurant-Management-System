<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<div class="col-md-10">
	<div class="pull-right">
		<button class="btn btn-success" data-toggle="modal"
			data-target="#add-item">
			<span class="glyphicon glyphicon-plus"></span> 新添加一行
		</button>
	</div>
	<table class="table table-striped">
		<caption>菜品信息</caption>
		<thead>
			<tr>
				<th>菜品编号</th>
				<th>名称</th>
				<th>折扣</th>
				<th>价格</th>
				<th>会员价</th>
				<th>成本</th>
				<th>销售量</th>
				<th>菜品种类</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${items }" var="item">
				<tr>
					<td>${item.id }</td>
					<td>${item.name }</td>
					<td>${item.discount }</td>
					<td>${item.price }</td>
					<td>${item.vipprice }</td>
					<td>${item.cost }</td>
					<td>${item.sale }</td>
					<td>${item.typeName}</td>
					<td><a href="javascript:edit_item(${item.id})"
						class="btn btn-success">修改</a>
						<button class="btn btn-danger"
							onclick="show_confirm('/manage/deleteItem/${item.id}')">删除</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!-- modal:添加菜品 -->
<div class="modal fade" id="add-item" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<form role="form" class="form-horizontal"
					action="/manage/addItemCommit" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<h2 class="col-sm-offset-2 col-sm-4">添加菜品</h2>
					</div>
					
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">菜品名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="请输入菜品名称" maxlength="20" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="discount" class="col-sm-2 control-label">折扣</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="discount"
								name="discount" placeholder="折扣(1-9)折，0为不打折" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="price" class="col-sm-2 control-label">价格</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="price" name="price"
								placeholder="请输入价格" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="vipprice" class="col-sm-2 control-label">会员价</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vipprice"
								name="vipprice" placeholder="请输入会员价" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="cost" class="col-sm-2 control-label">成本</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="cost" name="cost"
								placeholder="请输入成本" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="item-type" class="col-sm-2 control-label">菜品种类</label>
						<div class="col-sm-10">
							<select class="form-control" name="itemTypeId">
								<option>---请选择菜品种类---</option>
								<c:forEach items="${itemTypes}" var="itemType">
									<option value="${itemType.id }">${itemType.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10 col-sm-offset-2">
							<a class="btn btn-primary btn-block" onclick="add_material_01()">点我添加原料</a>
						</div>
					</div>
					<div id="material-line-01"></div>
					<input type="hidden" name="sale" value="0" />
					<div class="form-group">
						<div class="col-sm-offset-2">
							<label for="inputfile">上传图片</label> <input type="file"
								id="inputfile" name="inputfile">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2">
							<button type="submit" class="btn btn-success">提交</button>
							<button class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- modal:修改商品 -->
<div class="modal fade" id="edit-item" tabindex="-1" role="dialog"
	aria-labelledby="body" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-body">
				<form role="form" class="form-horizontal"
					action="/manage/editItemCommit" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<h2 class="col-sm-offset-2 col-sm-4">修改菜品</h2>
					</div>
					<input type="hidden" name="id" id="id">
					<div class="form-group">
						<label for="name" class="col-sm-2 control-label">菜品名称</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="name" name="name"
								placeholder="请输入菜品名称" maxlength="20" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="discount" class="col-sm-2 control-label">折扣</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="discount"
								name="discount" placeholder="折扣(1-9)折，0为不打折" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="price" class="col-sm-2 control-label">价格</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="price" name="price"
								placeholder="请输入价格" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="vipprice" class="col-sm-2 control-label">会员价</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="vipprice"
								name="vipprice" placeholder="请输入会员价" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="cost" class="col-sm-2 control-label">成本</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="cost" name="cost"
								placeholder="请输入成本" required="required">
						</div>
					</div>
					<div class="form-group">
						<label for="item-type" class="col-sm-2 control-label">菜品种类</label>
						<div class="col-sm-10">
							<select class="form-control" name="itemTypeId">
								<option>---请选择菜品种类---</option>
								<c:forEach items="${itemTypes}" var="itemType">
									<option value="${itemType.id }">${itemType.name }</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-10 col-sm-offset-2">
							<a class="btn btn-primary btn-block"
								id="add_material_02">点我添加原料</a>
						</div>
					</div>
					<div id="material-line-02"></div>
					<div class="form-group">
						<label for="sale" class="col-sm-2 control-label">销售量</label>
						<div class="col-sm-10">
							<input class="form-control" type="text" id="sale" name="sale" />
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2" for="inputfile">上传图片</label>
						<div class="col-sm-10">
							<input type="file" id="inputfile" name="inputfile">
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