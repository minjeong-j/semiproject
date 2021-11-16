<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String workgroup=request.getParameter("workgroup");
	if(workgroup==null) workgroup="admin";
	
	String work=request.getParameter("work");
	if(work==null) work="admin_main";
	
	String contentPath=workgroup+"/"+work+".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
h1 {
	text-align: center;
}

.area {
	margin: 0 auto;
	padding: 150px 350px;
}

p {
	text-align: center;
	font-size: 30px;
}

/* width 값 주고 가운데정렬 */
#wrap {
	width: 100;
	margin: 0 auto;   
	height: 800px;   
}
#container {
   width: 1000px;
   margin: 0 auto;      
}
#container {
	text-align: center;
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
			<div class="main">
				<jsp:include page="<%=contentPath %>"/>	
			</div>
		</div>
		</div>
		<!-- container end -->
	</div>
</body>
</html>