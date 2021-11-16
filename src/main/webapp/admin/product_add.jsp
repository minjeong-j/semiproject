<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<style type="text/css">
/* CSS 작성 */
#contents {
	margin: 0 auto;
	padding: 100px 0 80px;
}

h1 {
	text-align: center;
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	width: auto;
	border-collapse: collapse;
}

th, td {
	padding: 11px 10px 10px;
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

form {
	text-align: center;
	font-size: 15px;
}

.productForm table input {
	font-size: 18px;
	border: none;
	padding-left: 1px;
	line-height: 20px;
	min-width: 300px;
	border-bottom: 1px solid;
}

.productForm table input:focus {
	outline: none;
}

.button {
	width: 300px;
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 15px 15px;
	border: 15px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

.button:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 2px solid rgb(207, 207, 207);
}
</style>
</head>
<body>
		<div class="controlArea">
			<h1>제품조회</h1>
		</div>
		<div class="prodeculist">
			<form action="<%=request.getContextPath()%>/admin/product_add_action.jsp"
				method="post" id="productForm" class="productForm" enctype="multipart/form-data">
				<table>
					<tr>
						<th>제품명</th>
						<td>
							<input type="text" name="productName" id="productName">
							<span id="productNemaChek"></span>
						</td>
					</tr>
					<tr>
						<th>이미지</th>
						<td>
							<input type="file" name="mainImage" id="mainImage">
							<span id="mainImageCheck"></span>
							<input type="file" name="mainImage1" id="mainImage1">
							<input type="file" name="mainImage2" id="mainImage2">
							<input type="file" name="mainImage3" id="mainImage3">
							<input type="file" name="mainImage4" id="mainImage4">
							<!-- <input type="file" name="mainImage[]" id="mainImage"
							multiple="multiple"> -->
						</td>
					</tr>
					<tr>
						<th>가격</th>
						<td>
							<input type="text" name="productPrice" id="productPrice">
							<span id="productPriceCheck"></span>
						</td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td>
							<input type="text" name="category" id="category">
							<span id="CategoryCheck"></span>
						</td>
					</tr>
					<tr>
						<th>수량</th>
						<td>
							<input type="text" name="productStock" id="productStock">
							<span id="productStockCheck"></span>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<button id="productAdd" type="submit" class="button">제품등록</button>
						</td>
					</tr>
				</table>
			</form>
		</div>

	<script type="text/javascript">
		$("#productForm").submit(function() {
			var submitResult = true;
			
			if($("#productName").val()=="") {
				$("#productNameCheck").html("(제품이름을 입력해주세요.)");
				submitResult = false;
			}
			
			if($("#mainImage").val()=="") {
				$("#mainImageCheck").html("(메인 이미지를 넣어주세요.)");
				submitResult = false;
			}
			
			if($("#productPrice").val()=="") {
				$("#productPriceCheck").html("(제품 가격을 입력해주세요.)");
				submitResult = false;
			}
			
			if($("#category").val()=="") {
				$("#CategoryCheck").html("(카테고리를 입력해주세요.)");
				submitResult = false;
			}
			
			if($("#productStock").val()=="") {
				$("#productStockCheck").html("(제품 수량을 입력해주세요.)");
				submitResult = false;
			}
			
			return submitResult;
		});
	</script>
</body>