<%@page import="dao.MemberDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.OrdersDAO"%>
<%@page import="dto.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<%
String email = loginMember.getEmail();
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>MyPage</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
#naviBtn {
	margin: 30px auto 80px;
}

#naviBtn ul {
	text-align: center;
}

#naviBtn .btn {
	display: inline-block;
	width: 120px;
	margin: 5px;
	box-sizing: border-box;
	text-align: center;
}

#naviBtn .btn h3 {
	font-size: 0.9em;
}

#naviBtn .btn h3 a {
	display: block;
	width: 100%;
	padding: 40px 0;
	border: 1px solid white;
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}

#naviBtn .btn h3 a:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
}

#orderList {
	margin: 20px auto 0;
	max-width: 700px;
	border: 1px solid white;
}

#orderList .title {
	padding: 11px 21px;
	margin: 0;
	border-bottom: 1px solid white;
}

#orderList .state {
	padding: 20px 0;
}

#orderList .state ul {
	text-align: center;
	width: 100%;
}

#orderList .state li {
	display: inline-block;
	text-align: center;
	padding : 10px 23px;
	width: 120px;
}

#orderList .state a {
	display: inline-block;
	/* width: 170px; */
	font-size: 14px;
	width: 100%;
	height: 100%;
	padding-bottom: 5px;
}

#orderList .state input {
	display: block;
	text-align: center;
	font-size: 18px;
	border: none;
	width: 120px;
} 
#orderList .state input:focus{
	outline: none;
}
</style>
</head>
<body>
	<div class="titleArea">
		<h1>My Page</h1>
		<br>
	</div>

	<div id="naviBtn">
		<ul>
			<li class="btn order">
				<h3>
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=namkyu&work=orderList"> Order<br> 주문내역 조회
					</a>
				</h3>
			</li>
			<li class="btn profile">
				<h3>
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=profile">
						Profile<br> 회원 정보
					</a>
				</h3>
			</li>
			<li class="btn cart">
				<h3>
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=minjeong&work=cart">
						Cart<br> 장바구니 조회
					</a>
				</h3>
			</li>
			<li class="btn address">
				<h3>
					<a id = "address_search" style="cursor: pointer;"> Address<br> 주소록 관리
					</a>
				</h3>
			</li>
		</ul>
	</div>

	<div id="orderList">
		<div class="title">
			<h3>나의 주문처리 현황</h3>
		</div>
		<div class="state">
			<ul class="deli">
				<li style="border-right: 1px solid white;"><a>입금전</a> <input id = "waiting" readonly="readonly">
				</li>
				<li style="border-right: 1px solid white;"><a>배송준비중</a> <input id = "pay" readonly="readonly">
				</li>
				<li style="border-right: 1px solid white;"><a>배송중</a> <input id = "delivery" readonly="readonly">
				</li>
				<li><a>배송완료</a> <input id = "arrive" readonly="readonly">
				</li>
			</ul>
		</div>
	</div>
<script type="text/javascript">
$("document").ready(function () {
	<%
	List<OrdersDTO> orderlist = new ArrayList<OrdersDTO>();
	orderlist = OrdersDAO.getDAO().selectOrdersEmail(email);
	
	int waiting, pay = 0, delivery = 0, arrive = 0;
	waiting = orderlist.size();
	
	for (int i = 0; i < orderlist.size(); i++){
		String pay_confirm = orderlist.get(i).getPay_confirm();
		String delivery_confirm = orderlist.get(i).getDelivery_confirm();
		String arrive_confirm = orderlist.get(i).getArrive_confirm();
		if(pay_confirm.equals("1")){
			pay++;
		}
		if(delivery_confirm.equals("1")){
			delivery++;
		}
		if(arrive_confirm.equals("1")){
			arrive++;
		}
	}	
	%>
		
	var waiting = <%=waiting%>;
	var pay = <%=pay%>;
	var delivery = <%=delivery%>;
	var arrive = <%=arrive%>;
	document.getElementById("waiting").setAttribute("value",waiting - pay);
	document.getElementById("pay").setAttribute("value",pay- delivery);
	document.getElementById("delivery").setAttribute("value",delivery- arrive);
	document.getElementById("arrive").setAttribute("value",arrive);
})

$("#address_search").click(function() {
	window.open("<%=request.getContextPath()%>/moosung/address_list.jsp"
			,"주소록","width=1000,height=800,left=100,top=50");
});
</script>

</body>
</html>