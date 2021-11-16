<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nookyoon</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"> 
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
}
#orderList .state li {
	display: inline-block;
	padding: 10px 23px;
	text-align: center;
	width: 120px;
	
}
#orderList .state a {
	display: inline-block;
	/* width: 170px; */
	font-size: 14px;
	width: 100%;
	height: 100%;
}
#orderList .state span {
	display: block;
	text-align: center;
}

</style>
</head>
<body>
  <div id="wrap">
	<%-- header 불러오기 --%>
	<jsp:include page="../form/header.jsp"/>
    <%-- side 불러오기 --%>
    <jsp:include page="../form/side.jsp"/>
    <!-- container start -->  
    <div id="container">
	   <!-- content area => 안에 내용들 다 지우고본문작성 -->
      <div id="content">   
        <div class="main"> 
        	<div class="titleArea">
        		<h1>My Page</h1>
        		<br>
         	</div>  
        	
        	<div id="naviBtn">
        		<ul>
        			<li class="btn order">
        				<h3>
        					<a href="<%=request.getContextPath()%>/namkyu/orderList.jsp">
        						Order<br>
        						주문내역 조회
	        				</a>
        				</h3>
       				</li>
        			<li class="btn profile">
        				<h3>
        					<a href="<%=request.getContextPath()%>/moosung/profile.jsp">
        						Profile<br>
        						회원 정보
	        				</a>
        				</h3>
       				</li>
        			<li class="btn cart">
        				<h3>
        					<a href="<%=request.getContextPath()%>/minjeong/cart.jsp"">
        						Cart<br>
        						장바구니 조회
	        				</a>
        				</h3>
       				</li>
        			<li class="btn board">
        				<h3>
        					<a href="#">
        						Board<br>
        						게시물 관리
	        				</a>
        				</h3>
       				</li>
        			<li class="btn address">
        				<h3>
        					<a href="#">
        						Address<br>
        						배송 조회
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
    					<li style="border-right: 1px solid white;">
    						<a href="">입금전</a>
    						<span>0</span>
    					</li>
    					<li style="border-right: 1px solid white;">
    						<a href="">배송준비중</a>
    						<span>0</span>
    					</li>
    					<li style="border-right: 1px solid white;">
    						<a href="">배송중</a>
    						<span>0</span>
    					</li>
    					<li>
    						<a href="">배송완료</a>
    						<span>0</span>
    					</li>
    				</ul>
    			</div>    		
        	</div>
        </div>
      </div>
    </div>
    <!-- container end -->
	<%-- footer 불러오기 --%>
	<jsp:include page="../form/footer.jsp"/>
  </div>
  
</body>
</html>