<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String option=request.getParameter("product_op");
	String productKw=request.getParameter("prodcutKw");
	
	List<ProductDTO> searchProduct = new ArrayList<ProductDTO>();
	searchProduct=ProductDAO.getDAO().searchProductList(productKw, option);
	System.out.println(option+""+productKw);
	
	List<ProductDTO> productlist = new ArrayList<ProductDTO>();
	
	String[] imgMain = new String[productlist.size()];

	for (int i = 0; i < productlist.size(); i++) {
		String image = productlist.get(i).getImg_source();
		imgMain[i] = image.split(",")[0];
	}
%>
<!DOCTYPE html>
<html>
<head>
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

</style>
</head>
<body>
	<div id="wrap">
		<%-- side 불러오기 --%>
		<jsp:include page="/admin/admin_side.jsp" />
		<!-- container start -->
		<div id="container">
			<!-- content area => 본문작성 -->
			<div id="content">
				<div class="controlArea">
					<h1>제품조회</h1>
				</div>
				<div class="prodeculist">
					<form class="productTable">
						<table>
							<tr>
								<th>제품코드</th>
								<th>제품명</th>
								<th>이미지</th>
								<th>가격</th>
								<th>카테고리</th>
								<th>수량</th>
								<th>등록일</th>
								<th>제품상태</th>
							</tr>
							
							<% int i=0;
									for(; i<searchProduct.size(); i++) { %>
							<tr>
								<th class="product_c"><%=searchProduct.get(i).getIdx() %></th>
								<th class="product_n"><%=searchProduct.get(i).getName() %></th>
								<th class="product_i">
									<img src="<%=request.getContextPath()%>/images/<%=imgMain[i]%>" width="50" height="50"></th>
								<th class="product_p"><%=searchProduct.get(i).getPrice() %></th>
								<th class="product_s"><%=searchProduct.get(i).getKinds() %></th>
								<th class="product_s"><%=searchProduct.get(i).getStock()%></th>
								<th class="product_d"><%=searchProduct.get(i).getRelease_date() %></th>
								
								<td class="product_status">
									<select class="status" name="<%=searchProduct.get(i).getIdx()%>">
										<option value="0" <% if(searchProduct.get(i).getNew_best()=="0") { %> selected <% } %>>NEW</option>
										<option value="1" <% if(searchProduct.get(i).getNew_best()=="1") { %> selected <% } %>>BEST</option>
										<option value="2" <% if(searchProduct.get(i).getNew_best()=="2") { %> selected <% } %>>NEW_BEST</option>
									</select>
								</td>
							</tr>
							<% } %>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>