$(function(){
	
	$('#edit-list').find('#btn-edit').on('click',function(){
		$.ajax({
			url:"admin/editUser",
			type:"post",
			data: {
				nickname:$('#edit-nickname').val(),
				phone:$('#edit-phone').val(),
				email:$('#edit-email').val()
			},
			success : function(data){
				layer.msg("修改成功!");
				setTimeout(function(){
					window.location.href="/order";
				},1000);
			},
			error : function(){
				layer.msg("系统繁忙,请稍后再试!");
			}
		});
	});
	
	$.ajax({
		url:"admin/getUser",
		type:"get",
		success:function(data){
			console.log(data);
			if(data==""){
				window.location.href="/login";
			}
			
			$('#edit-nickname').val(data.nickname);
			$('#edit-phone').val(data.phone);
			$('#edit-email').val(data.email);
		},
		error :function(){
			layer.msg("服务器正忙");
		}
	});
});