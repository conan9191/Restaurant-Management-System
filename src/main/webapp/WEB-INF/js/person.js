
$(function(){
	$.ajax({
		url:"/admin/getUser",
		type:"get",
		success:function(data){
			if(data==""){
				layer.msg("您尚未登录，请登录后再来。");
				window.location.href="/login";	
				return;
			}
			console.log(data);
			$('#header').find('#user-name').html(data.nickname);
			$('#header').find('#user-id').val(data.id);
		},
		error:function(){
			layer.msg("服务器繁忙");
		}
	});
});