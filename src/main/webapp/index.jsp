<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String workgroup=request.getParameter("workgroup");
if(workgroup==null) workgroup="moosung";

String work=request.getParameter("work");
if(work==null) work="main";

String contentPath=workgroup+"/"+work+".jsp";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nookyoon</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
</style>
</head>
<body>
	<div id="wrap">
		<%-- header 불러오기 --%>
		<jsp:include page="form/header.jsp" />
		<%-- side 불러오기 --%>
		<jsp:include page="form/side.jsp" />
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

		<%-- footer 불러오기 --%>
		<jsp:include page="form/footer.jsp" />
	</div>
</body>
</html>