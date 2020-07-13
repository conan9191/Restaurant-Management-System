<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="header.jsp"%>

<div class="col-md-10">
	<div class="pull-right">
		
	</div>
	<div class="row pre-scrollable" style="max-height: 884px;">
	<table class="table table-striped" >
		<caption>明细信息</caption>
		<thead>
			<tr style="">
				<th>明细编号</th>
				<th>明细种类</th>
				<th>明细金额</th>
				<th>用户编号</th>
				<th>订座编号</th>
				<th>订单编号</th>
				<th>明细时间</th>
			</tr>
		</thead>
		
		<tbody>
			<c:forEach items="${details}" var="detail">
			
				<tr>
					<td>${detail.id}</td>
					<td>${detail.operation}</td>
					<td>${detail.money}</td>
					<td>${detail.uid}</td>
					<td>${detail.seatOrderId}</td>
					<td>${detail.itemOrderId}</td>
					<td><fmt:formatDate
							value="${detail.time}" type="both" /></td>
				</tr>
			</c:forEach>
			
			<%-- <tr>
				
					<div class="page">
						<input class="btn1" type="button" value="首页"
							onClick="location.href='finddetails?p=1'"> <input class="btn1"
							type="button" value="上一页"
							onClick="location.href='finddetails?p=<%out.print((Integer) request.getAttribute("pageNum") - 1);%>'">
						<input class="btn1" type="button" value="下一页"
							onClick="location.href='finddetails?p=<%out.print((Integer) request.getAttribute("pageNum") + 1);%>'">
						<input class="btn1" type="button" value="尾页"
							onClick="location.href='finddetails?p=<%out.print((Integer) request.getAttribute("maxPage"));%>'">
					</div>
				
			</tr> --%>
				
		</tbody>
	
	</table>
	</div>
	</div>
	




<%@ include file="footer.jsp"%>