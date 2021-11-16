<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dao.OrdersDAO"%>
<%@page import="dto.OrdersDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<%	
	List<OrdersDTO> orderList= OrdersDAO.getDAO().selectAllOrdersList(loginMember.getEmail());
	
%>

<style type="text/css">
#oderList {
	text-align: center;
	margin: 0 auto;
	width: 1200px;
}
#orderList .orderTable .tableTitle {
	min-width: 200px;
	max-width : 800px;
	margin: 0 auto;
}
#orderList .orderTable .tableTitle h3 {
	text-align: left;
	margin-bottom: 20px;
	padding-left: 12px;
	font: 15px bold;
}

#orderList .orderTable table {
	margin: 0 auto;
	min-width: 200px;
	max-width : 1000px;
}

#orderList .orderTable {
	text-align: center;
}

#question {
	min-width: 200px;
	max-width : 800px;
	margin: -0 auto;
	padding: 10px;
	text-align: right;
}

#question::after {
	content: "";
	display: block;
	clear: both;
}

#question a {
	border: 1px solid white;
	padding: 5px;
	float: right;
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}
#question a:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}
</style>
     	<div class="titleArea">
       		<h1>Order List</h1>
       		<br>
         	</div> 
       	<div id="orderList">
       		<div class="orderTable">
       			<div class="tableTitle">
        			<h3>주문 상품 정보&nbsp;<span style="font-size: 12px;">(주문번호를 클릭해주세요.)</span></h3>
        		</div>
         		<table border="1" summary="">
         			<caption style="display: none">주문 상품 정보</caption>
         			<colgroup>
         				<col style="width: 80px;">
         				<col style="width: 170px;">
         				<col style="width: 105px;">
         				<col style="width: 120px;">
         				<col style="width: 105px;">
         				<col style="width: 105px;">
         				<col style="width: 105px;">
         			</colgroup>
	         			<thead>
	         				<tr>
	         					<th scope="col" style="padding: 10px 0;">주문번호</th>
	         					<th scope="col">주문자</th>
	         					<th scope="col">배송지(별칭)</th>
	         					<th scope="col">주문일자</th>
	         					<th scope="col">주문확인</th>
	         					<th scope="col">배송확인</th>
	         					<th scope="col">도착확인</th>
	         				</tr>
	         			</thead>
	         			<tbody>

	      				<% if(orderList.isEmpty()) { %>
							<tr>
								<td colspan="7"> 주문 내역이 없습니다.</td>
							</tr>		      					
	      				<% } else { %>
	      					<% int i= 0;
	      					for(; i<orderList.size(); i++) {
	      					%>
	      					<tr>
	      						<td style="padding: 10px 0;">
	      							<%-- <input type="text" id="order_id<%=i%>"
	      							name="order_id<%=i%>" readonly="readonly"
	      							value="<%=orderList.get(i).getIdx()%>" style="width: 60px; border: none; text-align: center;" onclick="load()"> --%>
	      							<a href="<%=request.getContextPath()%>/namkyu/orderList_detail.jsp?name=<%=orderList.get(i).getIdx()%>" id="order_id<%=i%>"
	      							style="width: 80px; border: none; text-align: center;" 
	      							onclick="window.open(this.href, '주문조회', 'width=500, height=500'); return false;">
	      							<%=orderList.get(i).getIdx()%>
	      							</a>
	      						</td>
	      						<td id="idx<%=i%>"><%=orderList.get(i).getEmail()%></td>
	      						<td id="address_id<%=i%>"><%=orderList.get(i).getAddress_id()%></td>
	      						<td id="order_date<%=i%>"><%=orderList.get(i).getOrder_date().substring(0, 10)%></td>
	      						<td id="namePay<%=i%>">
	      							<input type="text" id="pay<%=i%>" value="<%=orderList.get(i).getPay_confirm()%>">
	      						</td>
	      						<td id="nameDeli<%=i%>">
	      							<input type="text" id="deli<%=i%>" value="<%=orderList.get(i).getDelivery_confirm()%>">
	      						</td>	      					
	      						<td id="nameArrive<%=i%>">
	      							<input type="text" id="arrive<%=i%>" value="<%=orderList.get(i).getArrive_confirm()%>">
	      						</td>
	      					</tr>
	      					<% } %>
	      				<% } %>	
	      				
	         			</tbody>
	         		</table>
         		</div>     	
         	</div>				
	<form method="post" action="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review_write" id="reviewIdx">
		<input type="hidden" name="productIdx" id="idx">	
		<!-- <input type="hidden" name="email" id="email"> -->
	</form>
	
	<div id="question">
		<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=question">문의사항 이동하기</a>
	</div>

<script type="text/javascript">
	var i= 0;
	 for(; i<<%=orderList.size()%>;i++){
		if(document.getElementById("pay"+i).getAttribute("value")=="0") {
			document.getElementById("namePay"+i).innerHTML="X";
		} else if(document.getElementById("pay"+i).getAttribute("value")=="1") {
			document.getElementById("namePay"+i).innerHTML="O";
		}
		
		if(document.getElementById("deli"+i).getAttribute("value")=="0") {
			document.getElementById("nameDeli"+i).innerHTML="X";
		} else if(document.getElementById("deli"+i).getAttribute("value")=="1") {
			document.getElementById("nameDeli"+i).innerHTML="O";
		}
		if(document.getElementById("arrive"+i).getAttribute("value")=="0") {
			document.getElementById("nameArrive"+i).innerHTML="X";
		} else if(document.getElementById("arrive"+i).getAttribute("value")=="1") {
			document.getElementById("nameArrive"+i).innerHTML="O";
		}
		
		if(document.getElementById("address_id"+i).value=="null") {
			document.getElementById("address_id"+i).innerHTML="";
		}
	}
	
</script>
</html>