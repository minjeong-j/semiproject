<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	margin-bottom: 30px;
}

.btnNormal {
	padding: 4px 8px;
}

table {
	width: 950px;
	margin: 10px auto;
	border: 0.2px solid white;
	border-collapse: collapse;
}

.orderButton {
	text-align: center;
	line-height: height;
}

.button {
	line-height: height;
	border: none;
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
						<h1>Order Form</h1>
						<br>
					</div>
					<hr class="one">
					<!-- 주문 내역 -->


					<div class="orderListArea">
						<div class="title">
							<h3>주문내역</h3>
							<br>
						</div>
						<div class="table1">
							<table border="1">
								<colgroup>
									
									<col style="width: 92px">
									<col style="width: auto">
									<col style="width: 98px">
									<col style="width: 98px">
									<col style="width: 98px">
									<col style="width: 85px">
									<col style="width: 98px">
								</colgroup>
								<thead>
									<tr>
										
										<th scope="col">Image</th>
										<th scope="col">Item</th>
										<th scope="col">Price</th>
										<th scope="col">Point</th>
										<th scope="col">Delivery</th>
										<th scope="col">Charge</th>
										<th scope="col">Total</th>
									</tr>
								</thead>
								<tfoot class="right">
									<tr>
										<td colspan="9"><span class="gLeft">[기본배송]</span> 상품구매금액
											<strong> 00,000 
										</strong> + 배송비 2,500 <span id="normal_total_benefit_price_area"
											class="displaynone"></span> = 합계 : <strong
											class="txtEm gIndent10"> ₩ <span
												id="domestic_ship_fee_sum" class="txt18"> 00,000 </span>
										</strong></td>
									</tr>
								</tfoot>
								<tbody class="tablein">
									<tr class="xans-record-">
										
										<td class="thumb gClearLine">
											<li><a href="#"><img
													src="https://via.placeholder.com/75x100" /></a></li>
										</td>
										<td class="left gClearLine"><span class="name"> <a
												class="ec-product-name">시스루 곱창 헤어밴드</a>
										</span>
											<div class="option ">[옵션: 그레이]</div></td>
										<td>
											<div id="product_sale_price_div0" class="displaynone">
												<strong> ₩<span id="product_sale_price_front0">6,000</span>
												</strong>
												<p class="displaynone"></p>
											</div>
										</td>
										<td>수량 1</td>
										<td><div class="txtInfo">
												기본배송 <br>
											</div></td>
										<td rowspan="2" class="">[무료]</td>
										<td><strong> ₩ <span
												id="product_total_price_front0">6,000</span>
										</strong>
											<div class="displaynone"></div></td>
									</tr>
								</tbody>
							</table>
						</div>

						
 <br> <br>
						<hr class="one">

						<!-- 배송정보 -->
						<div class="orderArea">
							<div class="title">
								<h3>배송 정보</h3>
								<p class="required" style="font-size: 11px;">
									<img
										src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
										alt="필수"> 필수입력사항
								</p>
							</div>
	
							<!-- 2. 배송정보 -->
							<div class="table2">
								<table border="1">
									<colgroup>
										<col style="width: 139px;">
										<col style="width: auto;">
									</colgroup>
									<tbody class="">
										<tr class="">
											<th scope="row">배송지 선택</th>
											<td>
												<div class="address">
													<input id="sameaddr0" name="sameaddr" fw-filter=""
														fw-label="1" fw-msg="" value="M" type="radio"> <label
														for="sameaddr0">회원 정보와 동일</label> <input id="sameaddr1"
														name="sameaddr" fw-filter="" fw-label="1" fw-msg=""
														value="F" type="radio"> <label for="sameaddr1">새로운
														배송지</label>
												</div>
											</td>
										</tr>

										<tr>
											<th scope="row">받으시는 분 <img
												src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
												alt="필수">
											</th>
											<td><input id="rname" name="rname" fw-filter="isFill"
												fw-label="수취자 성명" fw-msg="" class="inputTypeText"
												placeholder="" size="15" value="" type="text"></td>
										</tr>

										<tr>
											<th scope="row">주소 <img
												src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
												alt="필수">
											</th>
											<td><input id="rzipcode1" name="rzipcode1"
												fw-filter="isFill" fw-label="수취자 우편번호1" fw-msg=""
												class="inputTypeText" placeholder="" size="6" maxlength="6"
												readonly="1" value="" type="text"> <a href="#none"
												id="btn_search_rzipcode" class="btnNormal">우편번호</a> <br>
												<input id="raddr1" name="raddr1" fw-filter="isFill"
												fw-label="수취자 주소1" fw-msg="" class="inputTypeText"
												placeholder="" size="40" readonly="1" value="" type="text">
												<span class="grid" style="font-size: 12px;">기본주소</span> <br>
												<input id="raddr2" name="raddr2" fw-filter=""
												fw-label="수취자 주소2" fw-msg="" class="inputTypeText"
												placeholder="" size="40" value="" type="text"> <span
												class="grid" style="font-size: 12px;">나머지주소</span> <span
												class="grid " style="font-size: 12px;">(선택입력가능)</span></td>
										</tr>

										<tr class=>
											<th scope="row">휴대전화 <span class=""> <img
													src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
													alt="필수">
											</span>
											</th>
											<td><select id="rphone2_1" name="rphone2_[]"
												fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
												fw-alone="N" fw-msg="">
													<option value="010">010</option>
													<option value="011">011</option>
													<option value="016">016</option>
													<option value="017">017</option>
													<option value="018">018</option>
													<option value="019">019</option>
											</select> - <input id="rphone2_2" name="rphone2_[]" maxlength="4"
												fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
												fw-alone="N" fw-msg="" size="4" value="" type="text">
												- <input id="rphone2_3" name="rphone2_[]" maxlength="4"
												fw-filter="isNumber&amp;isFill" fw-label="수취자 핸드폰번호"
												fw-alone="N" fw-msg="" size="4" value="" type="text">
											</td>
										</tr>

									</tbody>

									<!-- 이메일부분 -->
									<tbody
										class="email ec-orderform-emailRow ec-shop-deliverySimpleForm">
										<tr>
											<th scope="row">이메일 <img
												src="//img.echosting.cafe24.com/skin/base_ko_KR/order/ico_required.gif"
												alt="필수">
											</th>
											<td><input id="oemail1" name="oemail1"
												fw-filter="isFill" fw-label="주문자 이메일" fw-alone="N" fw-msg=""
												class="mailId" value="" type="text"> @ <input
												id="oemail2" name="oemail2" fw-filter="isFill"
												fw-label="주문자 이메일" fw-alone="N" fw-msg=""
												class="mailAddress" readonly="readonly" value="" type="text">
												<select id="oemail3" fw-filter="isFill" fw-label="주문자 이메일"
												fw-alone="N" fw-msg="">
													<option value="" selected="selected">- 이메일 선택 -</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="nate.com">nate.com</option>
													<option value="hotmail.com">hotmail.com</option>
													<option value="yahoo.com">yahoo.com</option>
													<option value="empas.com">empas.com</option>
													<option value="korea.com">korea.com</option>
													<option value="dreamwiz.com">dreamwiz.com</option>
													<option value="gmail.com">gmail.com</option>
													<option value="etc">직접입력</option>
											</select>

												<p class="gBlank5" style="font-size: 12px;">
													이메일을 통해 주문처리과정을 보내드립니다. <br> 이메일 주소란에는 반드시 수신가능한
													이메일주소를 입력해 주세요.
												</p></td>
										</tr>
									</tbody>

									<!-- 배송관련 정보 -->
									<tbody class="delivery ">
										<tr class="">
											<th scope="row">배송메시지 <span class="displaynone"></span>
											</th>
											<td><textarea id="omessage" name="omessage" fw-filter=""
													fw-label="배송 메세지" fw-msg="" maxlength="255" cols="70">
                                  </textarea></td>
										</tr>
									</tbody>
								</table>
							</div>
							<br> <br> <br>  <strong>결제 예정 금액</strong> <br> <br>
							<table id="table3" border="1" summary="">
								<colgroup>
									<col style="width: 33.33%">
									<col style="width: 33.33%" class="">
									<col style="width: 33.33%">
								</colgroup>
								<thead>
									<tr>
								
										<th scope="col"><span>총 주문 금액</span></th>
										<th scope="col" class=""><span>총 할인 금액</span></th>
										<th scope="col"><span>총 결제예정 금액</span></th>
									</tr>
								</thead>

								<tbody class="center">
									<tr>
										<td class="price"><div class="box txt13">
												<strong>₩<span id="total_order_price_view"
													class="txt16">8,500</span></strong> <span class="displaynone"><span
													id="total_order_price_ref_view"></span></span>
											</div></td>
										<td class="option "><div class="box txt13">
												<strong>-</strong> <strong>₩<span
													id="total_sale_price_view" class="txt16">0</span></strong> <span
													class="displaynone"><span
													id="total_sale_price_ref_view"></span></span>
											</div></td>
										<td><div class="box txtEm txt13">
												<strong>=</strong> <strong>₩<span
													id="total_order_sale_price_view" class="txt16">8,500</span></strong>
										
												<span class="displaynone"><span
													id="total_order_sale_price_ref_view"></span></span>
											</div></td>
								</tbody>
							</table>
							<br>  <br>
							<form action="<%=request.getContextPath()%>/index.jsp?workgroup=moonhee&work=order_complete"
							method="post" id="orderForm">
							<div class="orderButton">
								<button type="submit" class="button">결제하기</button>
							</div>
							</form>					
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- container end -->
		<script type="text/javascript">
		$("#orderForm").submit(function() {
			
		});
	</script>
		<%-- footer 불러오기 --%>
		<jsp:include page="../form/footer.jsp" />
	</div>
</body>
</html>