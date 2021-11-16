<%@page import="dao.ProductDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String orderBy = "release_date desc";

String new_best = null;
if (request.getParameter("new") != null) {
	new_best = request.getParameter("new");
} else if (request.getParameter("best") != null) {
	new_best = request.getParameter("best");
}
String category = request.getParameter("category");
String keyword = request.getParameter("keyword");
List<ProductDTO> productlist = new ArrayList<ProductDTO>();

if (keyword != null) {
	productlist = ProductDAO.getDAO().searchProductNameList(keyword);
} else if (category != null) {
	productlist = ProductDAO.getDAO().selectProductkindsList(category, orderBy);
} else if (new_best != null) {
	productlist = ProductDAO.getDAO().selectProductNewBestList(new_best, orderBy);
} else {
	productlist = ProductDAO.getDAO().selectAllProductList(orderBy);
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
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>nookyoon</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
img {
	width: 400px;
	height: 500px;
}

#container .main {
	text-align: center;
}

#container .mainImg{
	display: inline-block;
	position: relative;
	margin: 5px;
}

#container .mainImg .text{
	position: absolute;
	width:400px;
	height:500px;
	top: -10px;
	left: -10px;
	z-index: 1;
	opacity: 0;
	display: table;
	margin: 10px;
	transition-property: opacity;
	/*변형 완료 1초*/
	transition-duration: 0.5s;
	/*빠른 시작 서서히 감속*/
	transition-timing-function: ease-out;
}

#container .mainImg .text:hover {
	opacity: 0.7;
	transition: opacity 0.5s linear;
} 

#container .mainImg a {
	display: table-cell;
	vertical-align: middle;
	width: 400px;
	height: 500px;
	font-size: 15px;
	font-family: bold;
}

</style>
</head>
<body>
	<div class="mainone">
	<%
	int i = 0;
	for (; i < productlist.size(); i++) {
	%>
		<div class="mainImg">
			<img src="<%=request.getContextPath()%>/images/<%=imgMain[i]%>" />
			<div id="text"<%=i %> class="text">
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=namkyu&work=product&productIdx=<%=productlist.get(i).getIdx()%>">
				<%=productlist.get(i).getName() %> <br><br>&#8361;<%=productlist.get(i).getPrice() %>
				</a>
			</div>
		</div>
	<%
	}
	%>
	</div>

	<script type="text/javascript">
		
	</script>
</body>
</html>