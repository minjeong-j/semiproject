<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>

<%
List<CartDTO> cartList = CartDAO.getDAO().selectAllCartList(loginMember.getEmail());
List<ProductDTO> productList = new ArrayList<ProductDTO>();
List<Integer> qtylist =  new ArrayList<Integer>();

for (CartDTO cart : cartList) {
   String productIdx = cart.getProduct_idx();
   ProductDTO product = ProductDAO.getDAO().selectProduct(productIdx);
   productList.add(product);
   qtylist.add(cart.getQuantity());
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Cart</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
.titleArea h1 {
	margin: 0 0 30px;
	text-align: center;
}

.basketinfo .menu {
	text-align: center;
	border-bottom: 0.3px solid rgb(207, 207, 207);
	max-width: 180px;
	margin: 0 auto;
}

.basketinfo .menu p {
	font-size: 18px;
	margin: 20px 20px 12px;
	padding: 13px 10px 0px;
}

/*
.order-empty p {
   margin: 100px 0;
   text-align: center;
}
*/
.removeBtn {
	text-align: center;
}

.removeBtn .textAndBtn {
	margin-right: 631px;
}

.removeBtn #removeAllBtn {
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	color: rgb(13, 13, 13);
	width: 125px;
	height: 35px;
	padding: 6px 12px;
}

.removeBtn #removeAllBtn:hover {
	background-color: rgb(13, 13, 13);
	border: 1px solid rgb(207, 207, 207);
	color: rgb(207, 207, 207);
}

.basket_btn {
	margin: 0 auto;
	width: 400px;
	height: 50px;
	font-size: 1.2em;
	cursor: pointer;
	padding: 12px 0;
	text-align: center;
	margin-top: 10px;
}

.basket_btn .submitAllBtn {
	font-weight: bold;
	color: rgb(13, 13, 13);
	background-color: rgb(171, 195, 159);
	padding: 11px 27px 11px;
	border: none;
}

.basket_btn .submitAllBtn:hover {
	background-color: rgb(13, 13, 13);
	border: 1px solid rgb(207, 207, 207);
	color: rgb(207, 207, 207);
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	border-collapse: collapse;
	width: 900px;
}

th {
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

td {
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

.price .count {
	display: inline-block;
	position: relative;
	vertical-align: top;
}

.count #down .downBtn {
	position: static
}

.cartTable table {
	font-size: 13px;
}

.cartTable table input {
	text-align: center;
}

.name {
	cursor: pointer;
}

.name:hover {
	border-bottom: 1px solid rgb(207, 207, 207)
}

.cartTable .quantity button {
	padding: 4px 8px;
	margin: 8px 5px 8px;
	border : none;
}

.name, .price, .total {
	border: none;
	font-size: 15px;
}

.name, .price, .total:focus {
	outline: none;
}

.removeBtn #removeSelectBtn {
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	color: rgb(13, 13, 13);
	padding: 6px 12px;
}
.removeBtn #removeSelectBtn:hover {
	background-color: rgb(13, 13, 13);
	border: 1px solid rgb(207, 207, 207);
	color: rgb(207, 207, 207);
}

.quantity .upBtn {
	border: none;
}

.empty { 
	text-align: center;
}

/* cart만 고정 */
body {
	width: 100;
	margin: 0 auto;   
	height: 800px;  
}
#width {
	width: 1000px;
    margin: 0 auto; 
    text-align: center;
}
#selectedTotal{
	font-size: 15px;
	border:none;
	padding-left: 4px;
	line-height: 20px;
	cursor: text;
}
</style>
</head>
<body>
<div id="width">
	<div class="titleArea">
		<h1>Shopping Cart</h1>
	</div>
	<div class="basketinfo">
		<div class="menu">
			<p>국내배송상품</p>
		</div>
	</div>
	<br>
	<%-- 있으면 목록 출력 없으면 비어있음 표시--%>
	<% if (cartList.isEmpty()) { %>
		<div class="empty">
		<p>Your cart is empty</p>
		</div>
	<%} else {%>
	<form id = "cartForm" class="cartTable" method="post" action = "<%=request.getContextPath()%>/index.jsp?workgroup=minjeong&work=cart_submit">
		<div class="cartlist">
			
				<table>
					<tr>
						<th><input type="checkbox" id="allCheck" name="allcheck"></th>
						<th>Item</th>
						<th>Qty</th>
						<th>Price</th>
						<th>Delivery</th>
						<th>Total</th>
					</tr>
					<%
		            int i = 0;
		            for (; i < productList.size(); i++) {
		            %>
					<tr>
						<td>
							<input type="checkbox" name="checkP" value="<%=cartList.get(i).getCart_idx()%>" class="check">
							<input type="hidden" name="productIdx" value="<%=productList.get(i).getIdx()%>">
						</td>
						<td>
							<input type="button" id="name<%=i%>" class="name" name="name" value="<%=productList.get(i).getName()%>" >
						</td>
						<td id="quantity<%=i%>" class="quantity">
							<span class="count count-box"> 
								<button type="button" name="countBtn" class="upBtn">
									<img
										src="<%=request.getContextPath()%>/namkyu/image/btn_count_up.gif">
								</button>
								<input type="text" class="countInput" id = "quantity"<%=i %>
									name="countInput" value="<%=qtylist.get(i) %>" readonly="readonly"
									style="width: 20px; border: none;">
								<button type="button" name="countBtn" class="downBtn">
									<img
										src="<%=request.getContextPath()%>/namkyu/image/btn_count_down.gif">
								</button>
							</span>
						</td>
		
						<td>
							<input id="price<%=i%>" class="price" name="price" value="<%=productList.get(i).getPrice()%>" readonly="readonly">
						</td>
						<td>기본배송</td>
						<td>
							<input id="total<%=i%>" class="total"
							value="<%=(productList.get(i).getPrice()*qtylist.get(i))%>" name="total" readonly="readonly">
						</td>
					</tr>
					<%}%>
					<tr>
						<td colspan="5">결제예정금액</td>
						<td><input id="selectedTotal" readonly="readonly" value="0"></td>
					</tr>
				</table>
		
			
			<br>
			<div class="removeBtn">
				<button type="button" id="removeSelectBtn" class="textAndBtn">선택상품 삭제하기</button>
				<button type="button" id="removeAllBtn">장바구니비우기</button>
			</div>
		</div>
		<br>
		<div class="basket_btn">
			<input type="submit" id="submitAllBtn" class = "submitAllBtn" value="주문하기">
		</div>
		</form>
		<%}%>
</div>	
<script type="text/javascript">
	$("document").ready(function() {
	  //selectedTotal
		var total=Number(0);
		  <%
		  for(int j=0;j<productList.size();j++){%>
			total += Number(document.getElementsByName("total")[<%=j%>].value);
		  <%}%>
		  $('#selectedTotal').val(total);
	});
	
	$("document").ready(function() {
      //count button 
      $(document).on('click','button[name="countBtn"]',function(e){
   		 e.stopPropagation();
   	     e.preventDefault();
    	 let countBox = $(this).closest('.count-box');
    	 let row = countBox.closest('tr');
    	 let countInput = countBox.find('input[name=countInput]');
    	 let count = parseInt(countInput.val());
    	 let price = row.find('input[name=price]').val(); 
    	 let totalInput = row.find('input[name=total]');
    	
    	 //upBtn일 경우
    	 if($(this).hasClass("upBtn")){
    		 count++;
    		
    	 //downBtn일 경우
    	 } else {
    		 count--;
    		 if(count < 1) return;
    	 }
    	 countInput.val(count);
    	 totalInput.val(count * price); 
    	 var total=Number(0);
		  <%
		  for(int j=0;j<productList.size();j++){%>
			total += Number(document.getElementsByName("total")[<%=j%>].value);
		  <%}%>
		  $('#selectedTotal').val(total);
      });
      
      //전체 체크
      $(document).on('change','#allCheck',function(e){
    	  let checkItem = $("input[name=checkP]");
          if($(this).prop("checked")) { 
        	  checkItem.prop("checked",true); 
          } else {
        	  checkItem.prop("checked",false);
          }
      });
      let checkItem = $("input[name=checkP]");
      $("#allCheck").prop("checked",true);
      checkItem.prop("checked",true); 
      
      //개별 체크
      $(document).on('change','input[name=checkP]',function(e){
         let totalPrice = $("#selectedTotal");
         let countInput = countBox.find('input[name=countInput]');
         let count = countInput.val();
         totalPrice = parseInt(document.getElementById("sum").val(count)); 
         let val = document.getElementById('input[name="checkP"]').checked;
         
         if($(this).prop("checked")) {
            totalPrice+=result;
         } else {
         totalPrice-=result;
      }
         document.getElementById("sum").value = totalPrice;
         
         totalPrice.empty();
         totalPrice.html(val);  
      }); 
      
     
    //개별 선택 삭제
     $("#removeSelectBtn").click(function() {
    	 let email = "email";
    	 
    	 let selectedItemArr = $('input[name="checkP"]:checked').map(function () {
    		    return this.value; 
    	 }).get();  
    	 
    	 console.log(email);
    	 console.log(selectedItemArr);
    	 
         if(window.confirm("선택 상품을 삭제하시겠습니까?")) {
            location.href="<%=request.getContextPath()%>/index.jsp?workgroup=minjeong&work=cart_remove&email="+email+"&checkP="+selectedItemArr;
         }
    });   
    
   //전체 선택 삭제
   $("#removeAllBtn").click(function() {
      if(window.confirm("장바구니를 비우시겠습니까?")) {
         location.href="<%=request.getContextPath()%>/index.jsp?workgroup=minjeong&work=cart_clear";
      }
   });
   
});
</script>
</body>
</html>