/**
 * 
 */
$(function() {
		$('#add_material_02').on('click',function(){
			$.ajax({
				url : '/manage/getItemMaterials',
				dataType : "json",
				type : "POST",
				success : function(data) {
					var option = "";
					for (var i = 0; i < data.length; i++) {
						var str = "<option  value='"
								+ data[i].id + "'>"
								+ data[i].name
								+ "</option>";
						option = option + str;
					}
					var html = "<div class='form-group'>"
							+ "<label class='col-sm-2 control-label'>菜品原料及数量</label>"
							+ "<div class='col-sm-5'>"
							+ "<select class='form-control' name='materialId'>"
							+ "<option>---请选择原料---</option>"
							+ option
							+ "</select>"
							+ "</div>"
							+ "<div class='col-sm-5'>"
							+ "<input type='text' name='materialNum'"
							+ "class='form-control pull-left ' style='width: 50%;'>"
							+ "</div>" + "</div>";
					$('#material-line-02').append(html);
					layer.msg("添加成功");
				},
				error : function() {
					layer.msg("服务器正忙！");
						}
					});
		});
});

function add_material_01(){
	$.ajax({
		url : '/manage/getItemMaterials',
		dataType : "json",
		type : "POST",
		success : function(data) {
			var option = "";
			for (var i = 0; i < data.length; i++) {
				var str = "<option  value='"
						+ data[i].id + "'>"
						+ data[i].name
						+ "</option>";
				option = option + str;
			}
			var html = "<div class='form-group'>"
					+ "<label class='col-sm-2 control-label'>菜品原料及数量</label>"
					+ "<div class='col-sm-5'>"
					+ "<select class='form-control' name='materialId'>"
					+ "<option>---请选择原料---</option>"
					+ option
					+ "</select>"
					+ "</div>"
					+ "<div class='col-sm-5'>"
					+ "<input type='text' name='materialNum'"
					+ "class='form-control pull-left ' style='width: 50%;'>"
					+ "</div>" + "</div>";
			$('#material-line-01').append(html);
			layer.msg("添加成功");
		},
		error : function() {
			layer.msg("服务器正忙！");
				}
			});
}

/*
 * 获取要修改的item，并弹出模态框
 */
function edit_item(id) {
	$.ajax({
		url : '/manage/getItem',
		dataType : "json",
		type : "POST",
		data : {
			id : id
		},
		success : function(data) {
			$("#edit-item #id").val(data.id);
			$("#edit-item #name").val(data.name);
			$("#edit-item #discount").val(data.discount);
			$("#edit-item #price").val(data.price);
			$("#edit-item #vipprice").val(data.vipprice);
			$("#edit-item #cost").val(data.cost);
			$("#edit-item #sale").val(data.sale);
			$("#edit-item").modal('show');
		},
		error : function() {
			layer.msg("服务器正忙！");
		}
	});
}

function edit_itemType(id) {
	$.ajax({
		url : '/manage/getItemType',
		dataType : "json",
		type : "POST",
		data : {
			id : id
		},
		success : function(data) {
			$("#edit-itemType #id").val(data.id);
			$("#edit-itemType #name").val(data.name);
			$("#edit-itemType").modal('show');
		},
		error : function() {
			layer.msg("服务器正忙！");
		}
	});
}

function edit_itemMaterial(id){
	$.ajax({
		url : '/manage/getItemMaterial',
		dataType : "json",
		type : "POST",
		data : {
			id : id
		},
		success : function(data) {
			$("#edit-itemMaterial #id").val(data.id);
			$("#edit-itemMaterial #name").val(data.name);
			$("#edit-itemMaterial #stock").val(data.stock);
			$("#edit-itemMaterial #unit").val(data.unit);
			$("#edit-itemMaterial #price").val(data.price);
			$("#edit-itemMaterial").modal('show');
		},
		error : function() {
			layer.msg("服务器正忙！");
		}
	});
}