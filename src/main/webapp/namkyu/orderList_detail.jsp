<%@page import="dao.OrdersDetailDAO"%>
<%@page import="dto.OrdersDetailDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<%		
	request.setCharacterEncoding("UTF-8");

	String idx= request.getParameter("name");
	String email= request.getParameter("email");
		
	List<OrdersDetailDTO> orderList= OrdersDetailDAO.getDAO().selectOrderDetailIDXList(idx);
 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nookyoon</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
#orderTable {
	text-align: center;
}
#orderTable table {
	border: 1px solid white;
	border-collapse: collapse;
	margin: 0 auto;
	width: 400px;
}
#orderTable th, #orderTable td {
	border: 1px solid white;
	line-height: 20px;
	padding: 3px;
}
#orderTable table td button{
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
	padding: 2px;
}
#orderTable table td button:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 2px solid white;
}
</style>
</head>
<body>
	<div class="titleArea">
		<h1>주문 상세페이지</h1>
		<br>
	</div>
	<div id="orderTable">
		<table border="1" summary="">
			<caption style="display: none">주문 상품 정보</caption>
			<colgroup>
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
				<col style="width: 120px;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">주문번호</th>
					<th scope="col">제품코드</th>
					<th scope="col">수량</th>
					<th scope="col">가격</th>
					<th scope="col">리뷰</th>
				</tr>
			</thead>
			<tbody>
				<% if(orderList.isEmpty()) { %>
					<tr>
						<td colspan="5">주문 내역이 없습니다.</td>
					</tr>
				<% } else { %>
			
					<%  
					for(int i=0; i<orderList.size();i++) { %>
					<tr>
						<td><%=orderList.get(i).getOrders_idx() %></td>
						<td id="no<%=i%>"><%=orderList.get(i).getProduct_idx()%></td>
						<td><%=orderList.get(i).getQuantity()%></td>
						<td><%=orderList.get(i).getPrice()%></td>
						<td id="boverBtn">
							<button type="button" id="review<%=i%>" onclick="review(<%=i%>)" style="padding: 2px;">리뷰</button>
						</td>
					</tr>
					<% 	} %>	
			</tbody>
		</table>
		
		<form id="data" name="data" method="post">
		<%for(int i=0; i<orderList.size();i++) { %>
			<input type="hidden" id="id<%=i%>" name="id" value="<%=orderList.get(i).getProduct_idx()%>">
		<% } %>
			<%-- <input type="hidden" id="email" name="email" value="<%=email%>"> --%>
			<!-- <button type="submit" >ㄴㅁㅇㄹ</button> -->
		</form>
		<% }  %>
	
	</div>
</body>
<script type="text/javascript">

	function review(i) {
		/* var form = document.data; */
		var id = document.getElementById("id"+i).value;
		/* var email = document.getElementById("email").value; */
		
		document.getElementById("data").setAttribute("action", "<%=request.getContextPath()%>/namkyu/orderList.jsp");
	 	if(window.confirm("리뷰페이지로 이동하시겠습니까?")) {
	 		window.opener.document.getElementById("idx").setAttribute("value", id);
	 		/* window.opener.document.getElementById("email").setAttribute("value", email); */
	 		window.opener.document.getElementById("reviewIdx").submit();
			window.close();
		} 
	}
	
	

</script>