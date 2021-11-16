<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style type="text/css">
#wrap #left_bar {
	font-size: 15px;
	position: fixed;
	/* top: 232px; */
	line-height: 2em;
	text-align: left;
	width: 100px;
	height: 100%;
	z-index: 8;
}

#left_bar {
 top: 0;
 bottom: 0;
 padding-top: 310px;
 box-sizing: border-box;
 height: 100%
}

#wrap #right_bar {
	font-size: 15px;
	text-align: right;
	width: 100px;
	height: 100%;
	z-index: 8;
	top:0;
    bottom:0;
    padding-top:306px;
    box-sizing:border-box;
}

</style>
<!-- left side bar -->
<div id="left_bar">

	<div class="left_navi1">
		<ul>
			<li><a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=product_manager">제품관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=order_manager">배송관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=member_manager">회원관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=notice_manager">NOTICE 관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=question_manager">QUESTION 관리</a></li>
			<li><a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=review_manager">REVIEW 관리</a></li>
		</ul>
	</div>
</div>

<!-- right side bar -->
<div id="right_bar">
	<div class="right_naiv" id="right_navi">
		<ul>
			<li><a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=admin_main">Home</a></li>
			<li><a href="<%=request.getContextPath()%>">Main</a></li>
			<li><a
				href="<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=login">LogIn</a></li>
		</ul>
	</div>
</div>

<body>
	<script type="text/javascript">
		
	</script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</body>
