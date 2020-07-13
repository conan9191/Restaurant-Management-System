<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="http://cdn.static.runoob.com/libs/jquery/1.10.2/jquery.min.js">
</script>
<title>Insert title here</title>
</head>
<body>
<div class="col-md-10">
	<form role="form" action="/SeatManage/getSeatsListByTime" method="post">
		<input type="datetime" name=startTime>
		<button type="submit" class="btn-test" onclick="getSeatsListByTime()">提交</button>
	</form>
</div>

<script >
$(function(){

	$('#btn-test').on('click',function(){
		$.ajax({
			url:'/SeatManage/getSeatsListByTime',
			dataType:'json',
			type:"POST",
			data:{
				startTime:$('#startTime').val()
			},
			success:function(data){
				alert(data);
			},
			error:function(){
				layer.msg("服务器证忙！");
			}
		});
	});
});
</script>
</body>

</html>