<%@page import="dto.CartDTO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dao.CartDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<%
String memberEmail = loginMember.getEmail();

request.setCharacterEncoding("UTF-8");	

List<ProductDTO> productlist = new ArrayList<ProductDTO>();
List<CartDTO> cartlist = new ArrayList<CartDTO>();
List<Integer> qtylist =  new ArrayList<Integer>();

String productIdx = request.getParameter("productIdx");

if(productIdx==null){
	//Cart DB에서 정보 가져오기
	cartlist = CartDAO.getDAO().selectAllCartList(memberEmail);
	for (int i =0; i < cartlist.size(); i++){
		productIdx = cartlist.get(i).getProduct_idx();
		productlist.add(ProductDAO.getDAO().selectProduct(productIdx));
		qtylist.add(cartlist.get(i).getQuantity());
	}
} else {
	int quantity = Integer.parseInt(request.getParameter("quantity"));
	productlist.add(ProductDAO.getDAO().selectProduct(productIdx));
	qtylist.add(quantity);
}

String[] imgMain = new String[productlist.size()];

for (int i = 0; i < productlist.size(); i++) {
	String image = productlist.get(i).getImg_source();
	imgMain[i] = image.split(",")[0];
}
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	margin-bottom: 30px;
}

.btnNormal {
	padding: 4px 8px;
}

table {
	width: 850px;
	margin: 10px auto;
	border: 0.2px solid white;
	border-collapse: collapse;
}

.orderButton {
	text-align: center;
	line-height: height;
}

button {
	width: 120px;
	margin: auto;
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}

button:hover {
	cursor: pointer;
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
	background-color: rgb(13, 13, 13);
}

#table3 {
	text-align: center;
}

#table3 th {
	padding: 15px;
}

.center td {
	padding: 25px;
}

.required {
	text-align: right;
}

.table1 th {
	padding: 15px;
}

.table1 input{
	font-size: 15px;
	border:none;
	padding-left: 4px;
	line-height: 20px;
	cursor: text;
}

.tablein tr {
	text-align: center;
}

.tablein td {
	padding: 20px;
}

.right td {
	padding: 13px;
}

.table2 th {
	padding: 25px;
}

.table2 td {
	padding: 7px;
}

.table2 input{
	font-size: 18px;
	border:none;
	padding-left: 1px;
	line-height: 20px;
	cursor: text;
	border-bottom: 1px solid rgb(207, 207, 207);
}

.table2 input:focus{
	outline: none;
}

.table2 input.read{
	cursor: not-allowed;
}

.title{
	text-align: center;
	/* margin-top: -45px; */
	margin: 0px 0 40px 0;
}

#address_id, #road_address {
	margin: 10px 0;
}

#address_list, #address_search{
	width: 120px;
	height: 25px;
}
.error{
	opacity: 0.8;
}
.center input{
	font-size: 15px;
	border:none;
	padding-left: 4px;
	line-height: 20px;
	cursor: text;
}
</style>
</head>
<body>
	<div class="titleArea">
		<h1>주문 결제</h1>
		<br>
	</div>
	<hr class="one">
	<div class="orderListArea">
		<div class="title">
			<h1>주문내역</h1>
			<br>
		</div>
		<form id="orderForm" name = "orderForm" action="<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=order_action"
				method="post" >
		<div class="table1">
			<table border="1">
				<thead>
					<tr>
						<th scope="col">Image</th>
						<th scope="col">Item</th>
						<th scope="col">Price</th>
						<th scope="col">Qty</th>
						<th scope="col">Total</th>
					</tr>
				</thead>

				<tbody class="tablein">
					<%
	            	int i = 0;
	    			for (; i < productlist.size(); i++) {
	       			%>
					<tr>
						<td>
						<input type="hidden" id = "price_post" name = "price_post" value="<%=(productlist.get(i).getPrice()*qtylist.get(i))%>">
						<input type="hidden" id = "quantity_post" name = "quantity_post" value="<%=qtylist.get(i) %>">
						<input type="hidden" id = "productIdx_post" name = "productIdx_post" value="<%=productlist.get(i).getIdx()%>">
							<a href="<%=request.getContextPath()%>/index.jsp?workgroup=namkyu&work=product&productIdx=<%=productlist.get(i).getIdx()%>">
							<img src="<%=request.getContextPath()%>/images/<%=imgMain[i]%>" style="width:50px; height: 100px;"/></a>
						</td>
						<td>
						<span id = "productName<%=i %>"> <%=productlist.get(i).getName()%></span>
						</td>
						<td>
							<div>
								<strong> ₩<span id="price<%=i %>"><%=productlist.get(i).getPrice() %></span>
								</strong>
							</div>
						</td>
						<td><span id = "quantity"<%=i %>><%=qtylist.get(i) %></span></td>
						<td><strong> ₩<input type="text" id ="total<%=i %>" name="total" value="<%=(productlist.get(i).getPrice()*qtylist.get(i))%>" readonly="readonly"></strong></td>
					</tr>
					<%} %>
				</tbody>
			</table>
		</div>

		<hr class="one">
		<div class="orderArea">
			<div class="title">
				<h1>배송 정보</h1>
				<br>
			</div>

			<div class="table2">
				<table border="1">
					<colgroup>
						<col style="width: 139px;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">받으시는 분</th>
							<td><input type="text" id="name" name="name"><span
							id="nameCheck" class = "error"></span></td>
						</tr>

						<tr>
							<th scope="row">주소</th>
							<td><input type="text" id="address_id" name="address_id" class="writable"
							placeholder="주소 별명">
							<button type="button" id=address_list>주소록 불러오기</button> <br>
							<input type="text" id="post_code" name="post_code" style="cursor: not-allowed;"
							readonly="readonly">
							<button type="button" id=address_search	 onclick="sample4_execDaumPostcode()">우편번호 찾기</button><br>												
							<input type="text" id="road_address" name="road_address" style="cursor: not-allowed;"
							readonly="readonly"><br>
							<input type="text" id="detail_address" name="detail_address"
							placeholder="상세 주소"><br><span id="address_Check" class="error"></span></td>
						</tr>

						<tr class=>
							<th scope="row">휴대전화</th>
							<td><input type="text" id="phone" name="phone"><span
							id="phoneCheck" class="error"></span></td>
						</tr>
					</tbody>
					<tbody>
						<tr>
							<th scope="row">이메일</th>
							<td><input type="text" id="email" name="email"
							readonly="readonly" value="<%=memberEmail%>"></td>
						</tr>
					</tbody>

					<!-- 배송관련 정보 -->
					<tbody class="delivery">
						<tr>
							<th scope="row">배송메시지</th>
							<td><textarea id="omessage" name="omessage" maxlength="255" cols="70">
                                  </textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="title">
				<br> <br>
				<h1>결제 예정 금액</h1>
				<br> <br>
			</div>
			<table id="table3" border="1" summary="">
				<colgroup>
					<col style="width: 33.33%">
					<col style="width: 33.33%" class="">
					<col style="width: 33.33%">
				</colgroup>
				<thead>
					<tr>

						<th scope="col"><span>총 주문 금액</span></th>
						<th scope="col"><span>총 할인 금액</span></th>
						<th scope="col"><span>총 결제예정 금액</span></th>
					</tr>
				</thead>

				<tbody class="center">
					<tr>
						<td><div>
								<strong>₩<input id="total_price" readonly="readonly" value="0"></strong>
							</div></td>
						<td><div>
								<strong>-</strong> <strong>₩<input type="text" readonly="readonly"
									id="total_discount" value="0"></strong> 
							</div></td>
						<td><div>
								<strong>=</strong> <strong>₩<input type="text" readonly="readonly"
									id="total_all" name = "total_call" value="0"></strong>
							</div></td>
				</tbody>
			</table>
			<br>
			
				<div class="orderButton">
					<button type="submit" class="button">결제하기</button>
				</div>	
				
		</div>	
		</form>		
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function() {		
		var total=Number(0);
		<%
		double discount=0;
		if(loginMember.getGrade().equals("10"))
			discount=0.1;
		else if(loginMember.getGrade().equals("11"))
			discount=0.2;
		
		for(int j=0;j<productlist.size();j++){%>
			total += Number(document.getElementsByName("total")[<%=j%>].value);
		<%}%>
		var discount=total*<%=discount%>;
		$('#total_price').val(total);
		$('#total_discount').val(discount);
		$('#total_all').val(total-discount);
	});
	
	$("#address_list").click(function() {
		window.open("<%=request.getContextPath()%>/moosung/address_list.jsp"
				,"주소록","width=1000,height=800,left=100,top=50");
	});
	
	function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	var roadAddr = data.roadAddress;
            	document.getElementById('post_code').value = data.zonecode;
                document.getElementById("road_address").value = roadAddr;
            }
        }).open();
    }	
	
	$("#orderForm").submit(function() {
		var submitResult = true;

		var nameReg = /^[가-힣]{2,10}|[a-zA-Z]{2,50}$/;
		if ($("#name").val() == "") {
			$("#nameCheck").html("(이름을 입력해주세요)");
			submitResult = false;
		} else if (!nameReg.test($("#name").val())) {
			$("#nameCheck").html("(유효한 이름이 아닙니다)");
			submitResult = false;
		}

		var phoneReg = /^\d{2,3}-\d{3,4}-\d{4}$/;
		if ($("#phone").val() == "") {
			$("#phoneCheck").html("(전화번호를 입력해주세요)");
			submitResult = false;
		} else if (!phoneReg.test($("#phone").val())) {
			$("#phoneCheck").html("(올바른 전화번호를 입력해주세요)");
			submitResult = false;
		}
		return submitResult;
	});	
	</script>
</body>
</html>