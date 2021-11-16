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

#questionForm {
	margin: 0px auto;
	text-align: center;
}

#questionTitile, #questionContent {
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

#selectBox{
	margin: 0px auto;
	text-align: left;
}

</style>
</head>
<body>
				<div class="main">
					<h1 class="titleArea">Q&nbsp;&nbsp;u&nbsp;&nbsp;e&nbsp;&nbsp;s&nbsp;&nbsp;t&nbsp;&nbsp;i&nbsp;&nbsp;o&nbsp;&nbsp;n</h1>

					<div id="editBox">
						
						<form id="questionForm" method="post" name="questionForm">
						<div id="selectBox">
							<span id="questionTitile">제품명</span>
							<select name="product">
								<% for(ProductDTO product: productList) { %>
								<option selected="selected" value="<%=product.getName() %>">&nbsp;<%=product.getName() %>&nbsp;</option>
								<% } %>
							</select>
						</div>
							
							<p id="questionTitile">제목</p>
							<textarea rows="1" style="width: 978px;" name="questionTitle" id="questionTitle"></textarea>
							
							<p id="questionContent">내용</p>
							<textarea rows="30" style="width: 978px;" name="questionContent" id="questionContent"></textarea>
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
		questionForm.questionTitle.focus();
		
		document.getElementById("writeBtn").onclick=function() {
			
			questionForm.action="<%=request.getContextPath()%>/wontack/question_action.jsp";
			
			questionForm.submit();
		}
	</script>

</body>
</html>