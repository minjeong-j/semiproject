<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nookyoon</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<%
	
	List<ProductDTO> productList = ProductDAO.getDAO().selectAllProductList("NAME"); 
	
	request.setCharacterEncoding("utf-8");
	
	ProductDTO productName = ProductDAO.getDAO().selectProduct(request.getParameter("productIdx"));

%>
<style type="text/css">
#editBox {
	padding: 0px;
	margin: 0px auto;
	width: 1000px;
}

#writeBox {
	width: 1000px;
	text-align: right;
	margin-top: 40px;
	margin-right: 40px;
}

#writeBtn:hover {
	cursor: pointer;
	background-color: white;
	color: black;
}

#writeBtn {
	border: 0.5px solid white;
	padding: 10px;
}

.main {
	margin: 0px auto;
	width: 1000px;
}

#editor {
	height: 500px;
}

#boardForm {
	width: 1000px;
}

textarea {
	margin: 0px auto;
	padding: 10px;
}

#reviewForm {
	margin: 0px auto;
	text-align: center;
}

#reviewTitile, #reviewContent {
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

#selectBox {
	margin: 0px auto;
	text-align: left;
}

#imgSource {
	margin: 20px 10px 20px 0px;
}

#inputBox {
	padding: 0px;
	text-align: left;
}

</style>
</head>
<body>
				<div class="main">
					<h1 class="titleArea">R&nbsp;&nbsp;e&nbsp;&nbsp;v&nbsp;&nbsp;i&nbsp;&nbsp;e&nbsp;&nbsp;w</h1>

					<div id="editBox">
						
						<form id="reviewForm" method="post" name="reviewForm" enctype="multipart/form-data">
						<div id="selectBox">
							<span id="reviewTitile">제품명</span>
								<% if(request.getParameter("productIdx")==null) { %>
									<select name="productTest">
										<% for(ProductDTO product: productList) { %>
										<option selected="selected" value="<%=product.getName() %>">&nbsp;<%=product.getName() %>&nbsp;</option>
										<% } %>
									</select>
								<% } else { %>
									<span>&nbsp;&nbsp;&nbsp;&nbsp;<%=productName.getName() %></span>
								<% } %>
						</div>
							
							<p id="reviewTitile">제목</p>
							<textarea rows="1" style="width: 978px;" name="reviewTitle" id="reviewTitle"></textarea>
							
							<p id="reviewContent">내용</p>
							<textarea rows="30" style="width: 978px;" name="reviewContent" id="reviewContent"></textarea>
							<div id="inputBox">
								<input type="file" name="imgSource" id="imgSource">
							</div>
							<input type="hidden" name="product" value="<%=productName.getName() %>">
						</form>
						<div id="writeBox">
							<%-- List 버튼 누른 경우 --%>
							<a id="writeBtn">
								&nbsp;&nbsp;W&nbsp;r&nbsp;i&nbsp;t&nbsp;e&nbsp;&nbsp;
							</a>
						</div>
					</div>
				</div>
	<script type="text/javascript">
		reviewForm.reviewTitle.focus();
		
		document.getElementById("writeBtn").onclick=function() {
			reviewForm.action="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review_action";
			location.href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review&pageNum=1";
			
			reviewForm.submit();
		}
	</script>

</body>
</html>