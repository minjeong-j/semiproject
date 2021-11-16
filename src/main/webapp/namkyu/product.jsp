<%@page import="dto.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.PostDAO"%>
<%@page import="dto.PostDTO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	
	MemberDTO member = (MemberDTO)session.getAttribute("loginMember");

	
 	String productIdx= request.getParameter("productIdx");
	/* ProductDTO product=new ProductDTO(); 
	product = ProductDAO.getDAO().selectProduct(productIdx); */
	ProductDTO product= ProductDAO.getDAO().selectProduct(productIdx);
	

	
	String idx= product.getIdx();
	String productName= product.getName();
	int productPrice= product.getPrice();
	String image = product.getImg_source();
	
	String[] imgList= image.split(",");
		
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"> 
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */

caption {
	display: none;
}
col {
	display: table-column;
}

#contentArea {
	padding: 30px 0;
	margin-top: -140px;
}

#content {
	margin: 0 auto;
	padding: 85px; 0;
	max-width: 1200px;
}

#content #main {
	position: relative;
	margin: 0 auto 30px;
	padding: 30px 10px 0;
}
#content #contentArea::after {
	content: "";
	display: block;
	clear: both;
}

#content #main .mainImg {
	float: left;
	width: 40%;
	margin-left: 100px;
}

#content #main .infoArea {
	float: right;
	width: 40%;
	margin-right: 100px;
	line-height: 50px;
}

.btn button {
	width: 200px;
	height: 50px;
	border: 1px solid rgb(13, 13, 13);
	font-size: 15px;
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}

.btn button:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 2px solid rgb(207, 207, 207);
}

#moveBtn {
	text-align: center;
	position: sticky;
	top: 0;
}
#moveBtn a {
	width: 200px;
	line-height: 30px;
	border: 1px solid rgb(13, 13, 13);
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
	display: inline-block;
	font-size: 15px;
}

#moveBtn a:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}

.imgArea .img1, .img2 {
	text-align: center;
	margin: 30px 0;
}
.imgArea div p {
	margin: 30px 0;
}

#infoBox {
	margin: 0 auto;
	width: 800px; 
	height: 1060px; 
	border: 1px solid white; 
	line-height: 17px; 
}
#infoBox .cont {
	padding: 20px 0 16px 10px;
	text-align: left;
}

#table {
	width: 800px;
	margin: 20px auto;
}


#table #review h3 {
	float: left;
	text-align: left;
}
#table #review span {
	float: right;
	text-align: right;
}
#table #review p {
	margin: 2px 0 0;
	border: 1px solid rgb(207, 207, 207);
	line-height: 50px;
	text-align: center;
	clear: both;
}
#table #qna {
	margin-top: 30px;
}

#table #qna h3 {
	float: left;
	text-align: left;
}
#table #qna span {
	float: right;
	text-align: right;
}
#table #qna p {
	margin: 2px 0 0;
	border: 1px solid rgb(207, 207, 207);
	line-height: 50px;
	text-align: center;
	clear: both;
}

#table span a {
	width: 100px;
	line-height: 20px;
	border: 1px solid rgb(13, 13, 13);
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
	display: inline-block;
	font-size: 15px;
	text-align: center;
}

#table a:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}

.table {
	margin: 0 auto;
}
.table table {
	margin: 10px 0;
}

.price .count {
	display: inline-block;
	position: relative;
	vertical-align: top;
}
#up {
	position: absolute;
	left: 28px;
	top: 19;
}
#down {
	position: absolute;
	left: 28px;
	top: 42px;
}
#select {
	width: 50px;
	position: absolute;
	left: 60px;
	top: 30px;
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}
#select:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}
@media only screen and (max-width){
	
}
</style>

	
    <!-- container start -->
    <div id="container">  
	   <!-- content area => 안에 내용들 다 지우고본문작성 -->
      <div id="content">   
        <div id="main"> 
			
        	<div class="titleArea">
        		<!-- <h1>타이틀 내용 입력</h1> -->
        		<br>
         	</div>  
        <%-- 제품페이지 --%>
        	<div id="contentArea">
        		<div class="mainImg">
        			<img src="<%=request.getContextPath()%>/images/<%=imgList[0]%>" height="500" width="400">
        		</div>
        		<div class="infoArea" id="buy">
        			<h1 id="productName"><%=productName%></h1>
        			<span>&#8361;</span>
        			<span id="productPrice">
        				<%=productPrice%>
        			</span>
        			<p style="font-size: 12px; margin: 10px 0;">2500(배송비)</p>
	        		<div class="price">
	        		
	        			<span class="count">
	        				수량
	        				<br> 
	        				<!-- <span id="cnt">0</span> -->
	        				<input type="text" id="cnt" name="count" value="1" readonly="readonly" style=" width: 20px; border: none;">
	        				<a href="#none" id="up" onclick="up()">
	        					<img src="<%=request.getContextPath()%>/namkyu/image/btn_count_up.gif" id="upBtn">
	        				</a>
	        				<a href="#none" id="down" onclick="down()">
	        					<img src="<%=request.getContextPath()%>/namkyu/image/btn_count_down.gif" id="downBtn">
	        				</a>
	        				<button type="button" id="select" onclick="priceSelect()">확인</button>	        				

	        			</span>
	        		
	        			<form method="POST" id="formAction">
	        				<%-- 제품코드 --%>
	        				<label></label>
	        				<input id="idx" name="productIdx" type="hidden" value="<%=idx%>">	
	        				<%-- 제품가격 --%>
	        				<label></label>
	        				<input id="price" name="price" type="hidden" value="">
	        				<%-- 수량 --%>
	        				<label></label>
	        				<input id="quantity" name="quantity" type="hidden" value="">
	        			</form>
	       				</div>
	       				
	       				<div class="totalSelect">
	       					<span>Total : &#8361;</span>
	       					<span id="totalMoney">
	       					</span>
	       				</div>
		        		<div id="btn" class="btn">
		        			<button type="button" id="buyBtn">Buy Now</button>
		        			<button type="button" id="cartBtn">Add to Cart</button>
		        			<script type="text/javascript">
		        			</script>
		        		</div>
	        		</div>
        		</div>
        	</div>
        	<hr>
        	<br>
        	<div id="moveBtn" class="btn">
        		<a href="#buy">구매</a>
        		<a href="#img1">제품사진</a>
        		<a href="#img2">착용사진</a>
        		<a href="#infoBox">결제, 배송정보</a>
        		<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review">리뷰 보러가기</a>
        	</div>
        	
        <%-- 제품설명 --%>
        	<div class="imgArea">
			<%-- 이미지 삽입(더미 이미지) --%>
				<div class="img1" id="img1">
					<p><img src="<%=request.getContextPath()%>/images/<%=imgList[1]%>" height="500" width="400"/></p>
					<p><img src="<%=request.getContextPath()%>/images/<%=imgList[2]%>" height="500" width="400"/></p>			
				</div>
				<div class="img2" id="img2">
					<p><img src="<%=request.getContextPath()%>/images/<%=imgList[3]%>" height="500" width="400"/></p>
					<p><img src="<%=request.getContextPath()%>/images/<%=imgList[4]%>" height="500" width="400"/></p>			
				</div>
        	
        	<div id="infoBox">
        		<div class="cont">
        			<h2>상품결제정보</h2>
        			고액결제의 경우 안전을 위해 카드사에게 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의
        			사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할
        			수 있습니다. &nbsp;
        			<br>
        			<br>
        			무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시
        			면 됩니다.&nbsp;
        			<br>
        			주문시 입력한&nbsp;입금자명과 실제입금자의 성명이 반드시 일치하여하 하며, 7일 이내로 입금을 하
        			셔야 하며&nbsp;입금되지 않은 주문은 자동 취소됩니다.
        		</div>
        		<br>
        		
        		<div class="cont">
        			<h2>배송정보</h2>
        			<div>- 산간벽지나 도서피방은 별도의 추가금액을 지불하셔야 하는 경우가 있습니다.</div>
        			<br>
        			<div>- 주문하신 상품은 결제 완료 후 1~3일 이내 출고됩니다.</div>
        			<br>
        			<div>- 거래처 사정으로 입고 및 제작이 지연되는 상품이 포홤되어 있을 시 부득이하게 출고가 지연될 수 있으며 따로 지연 안내 연락을 드립니다.</div>
        			<br>
        			<div>- 2만원 이상 결제 시 무료배송입니다.</div>
        		</div>
        		<br>
        		
        		<div class="cont">
        			<h2>교환 및 반품정보</h2>
        			<br>
        			
        			<h3>교환 및 반품 주소</h3>
        			<br>
        			<div>- [XXXXX] 서울특별시 어딘가이지 않을까? 어디인지 모르겠네요</div>
        			<br>
        			
        			<h3>교환 및 반품이 가능한 경우</h3>
        			<br>
        			<div>- 제품 수령 후 7일 이내 고객센터[02.xxx.xxxx]전화, 게시판 문의, 교환 및 반품 신청 등으로 접수</div>
        			<br>
        			<div>&nbsp; * 여행, 출장 등 개인적인 사유로 기간이 지날 경우 처리가 불가합니다. 모든 고객님께 동등하게 적용되는 부분이니 양해부탁드립니다.</div>
        			<br>
        			<div>- 교환 및 반품 의사를 밝혀주시면 눅윤에서 택배사 측에 방문 수거 요청을 해드립니다.</div>
        			<br>
        			<div>- 수령일로부터 7일 이내 미접수 및 임의로 제품을 보내주실 경우 반송 될 수 있으니 주의바랍니다. </div>
        			<br>
        			<div>- 상품 확인이 가능한 포장된 투명 폴리 비닐 개봉 시 교환 및 반품이 어렵습니다.</div>
        			<br>
        			<div>&nbsp; * 악세서리는 한 번의 착용만으로도 상품가치가 떨어지며 비닐을 뜯는 경우 착용 여부를 확인할 수 없으니 양해 부탁드립니다.</div>
        			<br>
        			<div>※ 상품 하자를 제외한 고객 변심으로 인한 교환 및 반품 시에는 왕복 배송비 5,200원이 부과됩니다.</div>
        			<br>
        			
        			<h3>교환 및 반품이 불가능한 경우</h3>
        			<br>
        			<div>- 포장된 투명 폴리 비닐 개봉하여 상품가치가 상실된 경우</div>
        			<div>- 화면 해상도로 인한 색상 차이 및 기재된 상세 사이즈의 미세한 오차</div>
        			<div>- 고객 과실로 인한 상품의 훼손</div>
        			<div>- 본딩 자국, 땜, 자국, 미세한 스크래치 및 흡집 등 제작 과정에서 생기는 자연스러운 현상</div>
        			<div>- 간단하게 교정되는 정도의 하자(귀얼이 침 휘어짐, 스틱 휘어짐, O링 틈 벌어짐 등)</div>
        			<div>- 알레르기 반응(개인차에 따른 알레르기 반응)</div>
        			<div>- 관리법 미숙으로 인한 변색</div>
        			<div>- 각 제품의 침의 굵기 또는 길이 및 양쪽 대칭의 미세한 오차</div>
        			<div>- 생산시기에 따른 색상 차이</div>
        			<br>
        			
        			<h3>등급 안내</h3>
        			<br>
        			<div>- 신규 회원 가입 시 적립금 2천원 지급</div>
        			<div>- 적립금 5000원 이상 소유 시 사용할 수 있습니다.</div>
        			<div>- 상품 구매 합계액 20,000원 이상일 시 적립금 사용 가능합니다.</div>
        			<div>- 상품 후기 작성 시 적립금 500원 지급, 사진 후기 작성 시 적립금 1,000원 지급</div>
        		</div>
        	</div>      
        </div>
      </div>
    </div>
    <!-- container end -->
<script type="text/javascript">
	var count= 1;
	
	/* 올리기 버튼 */
	function up() {
		count++;
		document.getElementById("cnt").value= count;
		/* 0 방지 */
		if(count<=0) {
			alert("최소 수량을 확인해주세요.");
			document.getElementById("cnt").value=1;
			return;
		}	
	}
	/* 내리기 버튼 */
	function down() {
		count--;
		document.getElementById("cnt").value= count;
		/* 0 방지 */
		if(count<=0) {
			alert("최소 수량을 확인해주세요.");
			document.getElementById("cnt").value=1;
			return;
		}

	}
	
		var totalPrice= 0;	
	
	
	function priceSelect() {
		var price= document.getElementById("productPrice").innerText;
		
		totalPrice= <%=productPrice%>*count;
		if(totalPrice<=0) {
			alert("잘못된 값을 입력하셨습니다.");
			count=1;
			$("#totalMoney").html(0);	
			return;
		} 
		$("#totalMoney").html(totalPrice);
		document.getElementById("price").setAttribute("value", price);
		document.getElementById("quantity").setAttribute("value", count);
	}
	
	/* 구매 클릭 */	
	$("#buyBtn").click(function() {
		if(totalPrice==null || totalPrice==0) {
			alert("[확인]을 눌러 가격을 확인 후 눌러주세요.")
			return;
 		}
<%--		if(<%=member%>==null) {
			alert("로그인한 사용자만 이용가능합니다.");
		} --%>
		
		if(!confirm("구매페이지로 이동하시겠습니까?")) {
			 return;
		} else {
			$("#formAction").attr("action", "<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=order");
			$("#formAction").submit();	  
		}
	})
	
	/* cart 클릭 */
	$("#cartBtn").click(function() {
		if(totalPrice==null || totalPrice==0) {
			alert("[확인]을 눌러 가격을 확인 후 눌러주세요.")
			return;
		}
		<%
		if(member==null){
			%>
			location.href="<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=login";
			return;
		<%
		}
		%>
	
		
		$("#formAction").attr("action", "<%=request.getContextPath()%>/namkyu/product_cart_action.jsp"); <%-- 액션저장 --%>
		alert("장바구니에 상품이 정상적으로 담겼습니다");
 		$("#formAction").submit();
	});
	
 
</script>


</html>