
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.OrdersDAO"%>

<%@page import="dto.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<%

String email=loginMember.getEmail();

//List<OrdersDTO> orderlist = OrdersDAO.getDAO().selectOrdersEmail(email);

OrdersDTO order = OrdersDAO.getDAO().selectOrderEmail(email);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nookyoon</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
.one {
	margin-top: 30px;
	margin-bottom: 40px;
}

strong {
	font-size: 18px;
}
</style>
</head>



<body>
	<div id="wrap">
		<%-- header 불러오기 --%>
		<jsp:include page="../form/header.jsp" />
		<%-- side 불러오기 --%>
		<jsp:include page="../form/side.jsp" />
		<!-- container start -->
		<div id="container">
			<!-- content area => 안에 내용들 다 지우고본문작성 -->
			<div id="content">
				<div class="main">
					<div class="titleArea">
						<h1>Order Complete</h1>
						<br>
						<hr class="one">
						<div class="orderInfo">
							<p>
								<strong>고객님의 주문이 완료 되었습니다.</strong> <br> 주문내역 및 배송에 관한 안내는
								주문조회를 통하여 확인 가능합니다.
							</p>
							<br> <br> <br>
							<ul> 
								<li>주문번호 : <span><%=order.getIdx() %></span>
								</li>
								<li>주문일자 : <span><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%></span>
								</li>
							</ul>
						</div>
						<br> <br> <br>
						
					</div>
				</div>
			</div>
		</div>

		<!-- container end -->
		<%-- footer 불러오기 --%>
		<jsp:include page="../form/footer.jsp" />
	</div>
</body>
</html>