<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="dao.OrdersDAO"%>
<%@page import="java.util.List"%>
<%@page import="dto.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<OrdersDTO> orderlist=OrdersDAO.getDAO().selectAllOrdersList("idx");

request.setCharacterEncoding("utf-8");

int pageSize = 10;

int pageNum = 1;
if (request.getParameter("pageNum") != null) {
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}

int startRow = (pageNum - 1) * pageSize + 1;

int endRow = pageNum * pageSize;

List<OrdersDTO> productTable = OrdersDAO.getDAO().selectAllOrderListGeneral("order by", startRow, endRow);

int totalproduct = OrdersDAO.getDAO().selectOrderCount("product");

int totalPage=(int)Math.ceil((double)totalproduct/pageSize);

if (pageNum <= 0 || pageNum > totalproduct) {
	pageNum = 1;
}

int number=totalproduct-(pageNum-1)*pageSize;

if (endRow > totalproduct) {
	 endRow = totalproduct;
	}

%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">

h1 {
	text-align: center;
	margin-bottom: 30px;
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	width: auto;
	border-collapse: collapse;
	margin-top: 30px;
}

th, td {
	padding: 11px 10px 10px;
	height: 30px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

.orderF input {
	font-size: 18px;
	border: none;
	padding-left: 1px;
	line-height: 20px;
	min-width: 300px;
	border-bottom: 1px solid white;
}

.orderF input:focus {
	outline: none;
}

#searchO {
	width: 500px;
	margin: 0 auto;
	padding-top: 15px;
	text-align: center;
}

#searchBtnO {
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 5px 5px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

#searchBtnO:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}

</style>
</head>
<body>
				<div class="controlArea">
					<h1>배송관리</h1>
				</div>
				<br>
				<div id="searchO">
					<form method="post" name="oForm" class="orderF">
						<select>
							<option value="email" selected="selected">이메일</option>
							<option value="idx" selected="selected">제품코드</option>
						</select>
						<input type="text" name="order">
						<a type="button" id="searchBtnO" >조회</a>
					</form>
				</div>
				<br>
				<div class="oderlist">
					<form class="orderTable">
						<table>
							<tr>
								<th>번호</th>
								<th>이메일</th>
								<th>주소</th>
								<th>주문일</th>
								<th>주문코드</th>
								<th>배송</th>
							</tr>
							<% 
							String idx = ""; 
							for(OrdersDTO order:orderlist) { %>
							<tr>
							<th><%=number %></th>
								<th class="order_e"><%=order.getEmail() %></th>
								<th class="order_a"><%=order.getAddress_id() %></th>
								<th class="order_d"><%=order.getOrder_date() %></th>
								<th class="order_idx"><%=order.getIdx() %></th>
								<%idx = order.getIdx(); %>
							
								<td class="order_dc">
									<select id = "confirm" class="delivery" name="<%=order.getArrive_confirm()%>">
										<option value="0" <% if(order.getPay_confirm()=="0") { %> selected <% } %>>입금 전</option>
										<option value="1" <% if(order.getPay_confirm()=="1") { %> selected <% } %>>배송 준비 중</option>
										<option value="2" <% if(order.getDelivery_confirm()=="1") { %> selected <% } %>>배송 중</option>
										<option value="3" <% if(order.getArrive_confirm()=="1") { %> selected <% } %>>배송 완료</option>
									</select>
								</td>
							</tr>
							<% number--; %>	
							<% } %>
						</table>
					</form>
				</div>
	<%
	//페이지 블럭에 출력될 페이지의 갯수 저장
	int blockSize = 5;

	//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장
	int startPage = (pageNum - 1) / blockSize * blockSize + 1;

	//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
	int endPage = startPage + blockSize - 1;

	//마지막 페이지 블럭의 종료 페이지 번호 변경
	if (endPage > totalPage) {
		endPage = totalPage;
	}
	%>
		<%
		if (startPage > blockSize) {//2번째 블럭 이상인 경우 - 링크 설정
		%>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=order_manager&pageNum=1">&lt;&lt;</a>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=order_manager&pageNum=<%=startPage - blockSize%>">&nbsp;&nbsp;[이전]</a>
		<%
		} else {
		%>
		&lt;&lt;&nbsp;&nbsp;&nbsp;[이전]&nbsp;
		<%
		}
		%>

		<%
		for (int i = startPage; i <= endPage; i++) {
		%>
		<%
		if (pageNum != i) {
		%>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=order_manager&pageNum=<%=i%>">[&nbsp;<%=i%>&nbsp;]
		</a>
		<%
		} else {
		%>
		<span style="font-size: 20px">[&nbsp;<%=i%>&nbsp;]
		</span>
		<%
		}
		%>
		<%
		}
		%>

		<%
		if (endPage != totalPage) {//마지막 페이지 블럭이 아닌 경우 - 링크 설정
		%>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=order_manager&pageNum=<%=startPage + blockSize%>">&nbsp;[다음]</a>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=order_manager&pageNum=<%=totalPage%>">&nbsp;&nbsp;&gt;&gt;</a>
		<%
		} else {
		%>
		[다음]&nbsp;&nbsp;&nbsp;&gt;&gt;
		<%
		}
		%>
		<div>&nbsp;</div>
	<script type="text/javascript">
		document.getElementById("searchBtnO").onclick=function() {
			if(oForm.order.value=="") {
				alert("이메일을 입력해주세요.");
				return;
			} else {			
				window.open("<%=request.getContextPath()%>/admin/searchO_action.jsp","회원조회"
				    ,"height=550, width=900");
			}
			oForm.submit();
		}
	$("document").ready(function() {
		$("#confirm").on('change',function() {
			<%
			OrdersDTO order = new OrdersDTO();
			order = OrdersDAO.getDAO().selectOrders(idx);
			%>			
			
			if(this.value=="0"){
				<%
				order.setPay_confirm("0");
				order.setDelivery_confirm("0");
				order.setArrive_confirm("0");
				%>
			} else if(this.value=="1"){
				<%
				order.setPay_confirm("1");
				order.setDelivery_confirm("0");
				order.setArrive_confirm("0");
				%>
			} else if(this.value=="2"){
				<%
				order.setPay_confirm("1");
				order.setDelivery_confirm("1");
				order.setArrive_confirm("0");
				%>
			} else if(this.value=="3"){
				<%
				order.setPay_confirm("1");
				order.setDelivery_confirm("1");
				order.setArrive_confirm("1");
				%>
			}
			<%
			OrdersDAO.getDAO().updateOrders(order);
			%>
		});
	});
		
	</script>
</body>
</html>