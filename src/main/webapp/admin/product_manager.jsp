<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int pageSize = 10;

int pageNum = 1;
if (request.getParameter("pageNum") != null) {
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}

int startRow = (pageNum - 1) * pageSize + 1;

int endRow = pageNum * pageSize;

List<ProductDTO> productTable = ProductDAO.getDAO().selectAllProductListGeneral("order by", startRow, endRow);

int totalproduct = ProductDAO.getDAO().selectProductCount("product");

int totalPage=(int)Math.ceil((double)totalproduct/pageSize);

if (pageNum <= 0 || pageNum > totalproduct) {
	pageNum = 1;
}

int number=totalproduct-(pageNum-1)*pageSize;

if (endRow > totalproduct) {
	 endRow = totalproduct;
	}

String[] imgMain = new String[productTable.size()];

for (int i = 0; i < productTable.size(); i++) {
	String image = productTable.get(i).getImg_source();
	imgMain[i] = image.split(",")[0];
}
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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

.productF input {
	font-size: 18px;
	border: none;
	padding-left: 1px;
	line-height: 20px;
	width: 250px;
	border-bottom: 1px solid white;
}

.productF input:focus {
	outline: none;
}

#searchP {
	width: 500px;
	margin: 0 auto;
	padding-top: 15px;
	text-align: center;
}

#searchBtnP {
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 5px 5px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

#searchBtnP:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}

.add {
	width: 500px;
	margin: 0 auto;
	text-align: center;
}

#reBtn {
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 5px 50px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

#addBtn {
	margin: 0 auto;
	background-color: rgb(171, 195, 159);
	cursor: pointer;
	padding: 5px 50px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

#reBtn:hover, #addBtn:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}

/* 검색창 정렬 */
#searchP {
	display: flex;
}
#searchP #search_Product {
	margin-left: 50px;
	height: 19px;
	margin-top: 5px;
}
#searchP #Pdata {
	margin-left: 5px;
}
#searchP #searchBtnP {
	margin-left: 2px;
}

</style>
</head>
<body>

	<div class="controlArea">
		<h1>제품관리</h1>
	</div>
	<br>
	<div id="searchP">

		<select id="search_Product" name="search_Produtc">
			<option value="name">제품명</option>
			<option value="idx">제품코드</option>
			<option value="kinds">카테고리</option>
		</select>
		<form action="<%=request.getContextPath()%>/admin/search_P.jsp"
			id="Pdata" name="Pdata" class="productF">
			<input type="text" name="productKw" id="productKw"> 
			<input type="hidden" name="product_op" id="product_op">
		</form>
		<a type="button" id="searchBtnP">조회</a>
	</div>
	<br>
	
	<div class="add">
		<button type="button" id="addBtn">추가</button>
	</div>
	<div class="prodeculist">
		<form name="productForm" id="productForm">
			<table>
				<tr>
					<th>번호</th>
					<th>제품코드</th>
					<th>제품명</th>
					<th>이미지</th>
					<th>가격</th>
					<th>카테고리</th>
					<th>수량</th>
					<th>등록일</th>
					<th>제품상태</th>
					<th>삭제</th>
				</tr>

				<%
				int j = 0;
				for (; j < productTable.size(); j++) {
				%>
				<tr>
				<th><%=number %></th>
					<th class="product_c"><%=productTable.get(j).getIdx()%></th>
					<th class="product_n"><%=productTable.get(j).getName()%></th>
					<th class="product_i"><img
						src="<%=request.getContextPath()%>/images/<%=imgMain[j]%>"
						width="50" height="50"></th>
					<th class="product_p"><%=productTable.get(j).getPrice()%></th>
					<th class="product_s"><%=productTable.get(j).getKinds()%></th>
					<th class="product_s"><%=productTable.get(j).getStock()%></th>
					<th><%=productTable.get(j).getRelease_date()%></th>
					<td class="product_status">
					<select class="status" name="<%=productTable.get(j).getIdx()%>">
							<option value="NEW"
								<%if (productTable.get(j).getNew_best() == "NEW") {%> selected
								<%}%>>NEW</option>
							<option value="BEST"
								<%if (productTable.get(j).getNew_best() == "BEST") {%> selected
								<%}%>>BEST</option>
							<option value="NEW_BEST"
								<%if (productTable.get(j).getNew_best() == "NEW_BEST") {%>
								selected <%}%>>NEW_BEST</option>
					</select></td>
					<td id="delete" class="delete" onclick="deleteProduct(<%=j%>)">삭제</td>
				</tr>
				<% number--; %>		
				<%
				}
				%>
			
	</table>
		</form>
		<form id="data" name="data" method="post"
			action="<%=request.getContextPath()%>/admin/product_remove.jsp">
			<input type="hidden" id="idx" name="idx">
		</form>
	</div>

	<div id="pageMove">
		
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
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=product_manager&pageNum=1">&lt;&lt;</a>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=product_manager&pageNum=<%=startPage - blockSize%>">&nbsp;&nbsp;[이전]</a>
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
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=product_manager&pageNum=<%=i%>">[&nbsp;<%=i%>&nbsp;]
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
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=product_manager&pageNum=<%=startPage + blockSize%>">&nbsp;[다음]</a>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=product_manager&pageNum=<%=totalPage%>">&nbsp;&nbsp;&gt;&gt;</a>
		<%
		} else {
		%>
		[다음]&nbsp;&nbsp;&nbsp;&gt;&gt;
		<%
		}
		%>
		<div>&nbsp;</div>
	</div>
	<script type="text/javascript">
	document.getElementById("searchBtnP").onclick=function() {
		var form = document.Pdata;
		var option = document.getElementById("search_Product");
		option = option,options[option.selectedIndex].value;
		
		if(document.getElementById("productKw").value=="") {
			alert("제품명을 입력해주세요.");
			return;
		}
		
		document.getElementById("option").setAttribute("value".option);
		form.submit();
	};
	
	document.getElementById("addBtn").onclick=function() {
		window.open("<%=request.getContextPath()%>/admin/product_add.jsp","제품추가"
				,"height=700, width=470");
	}
	
	function deleteProduct(i) {
		var form = document.data;
		var id = document.getElementById("product_idx"+i).value;
		document.getElementById("idx").value = idx;
		if(window.confirm("제품를 삭제하시겠습니까?")) {
			form.submit();
		};
	};	

	</script>
</body>
</html>