<%@page import="dao.OrdersDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<OrdersDTO> orderlist=OrdersDAO.getDAO().selectAllOrdersList("idx");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
#contents {
	margin: 0 auto;
	padding: 100px 0 80px;
}

h1 {
	text-align: center;
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	width: auto;
	border-collapse: collapse;
}

th, td {
	padding: 11px 10px 10px;
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

form {
	text-align: center;
	font-size: 15px;
}

</style>
</head>
<body>

			<!-- content area => 본문작성 -->
			<div id="content">
				<div class="controlArea">
					<h1>배송조회</h1>
				</div>
				<div class="oderlist">
					<form class="orderTable">
						<table>
							<tr>
								<th>이메일</th>
								<th>주소</th>
								<th>주문일</th>
								<th>제품금액</th>
								<th>제품코드</th>
								<th>배송</th>
							</tr>
							<% for(OrdersDTO order:orderlist) { %>
							<tr>
								<th class="order_e"><%=order.getEmail() %></th>
								<th class="order_a"><%=order.getAddress_id() %></th>
								<th class="order_d"><%=order.getOrder_date() %></th>
								<th class="order_p"><%=order.getPay_confirm() %></th>
								<th class="order_idx"><%=order.getIdx() %></th>
							
								<td class="order_dc">
									<select class="delivery" name="<%=order.getArrive_confirm()%>">
										<option value="0" <% if(order.getDelivery_confirm()=="0") { %> selected <% } %>>입금 전</option>
										<option value="1" <% if(order.getDelivery_confirm()=="1") { %> selected <% } %>>배송 준비 중</option>
										<option value="2" <% if(order.getDelivery_confirm()=="1") { %> selected <% } %>>배송 중</option>
										<option value="3" <% if(order.getDelivery_confirm()=="1") { %> selected <% } %>>배송 완료</option>
									</select>
								</td>
							</tr>
							<% } %>
						</table>
					</form>
				</div>
			</div>

</body>
</html>