<%@page import="dao.PostDAO"%>
<%@page import="dto.PostDTO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	
	String productName = request.getParameter("productName");
	
	PostDTO post = PostDAO.getDAO().selectPost(request.getParameter("postIdx"));

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nookyoon</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">

<style type="text/css">
#editBox {
	padding: 0px;
	margin: 0px auto;
	width: 1000px;
}

#replyBox {
	width: 1000px;
	text-align: right;
	margin-top: 40px;
	margin-right: 40px;
}

#replyBtn:hover {
	cursor: pointer;
	background-color: white;
	color: black;
}

#replyBtn {
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

#replyForm {
	margin: 0px auto;
	text-align: center;
}

#replyTitile, #replyContent {
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
					<h1 class="titleArea">R&nbsp;&nbsp;e&nbsp;&nbsp;p&nbsp;&nbsp;l&nbsp;&nbsp;y</h1>

					<div id="editBox">
						
						<form id="replyForm" method="post" name="replyForm">
						<div id="selectBox">
							<span id="replyTitile" style="border: 0.5px solid; padding: 3px;">제품명</span>
							<span>&nbsp;&nbsp;<%=productName %></span>
							<p>&nbsp;</p>
							<span id="replyTitile" style="border: 0.5px solid; padding: 3px;">제목</span><span>&nbsp;&nbsp;<%=post.getTitle() %></span>
							<p>&nbsp;</p>
						</div>
							<textarea rows="30" style="width: 978px;" name="replyContent" id="replyContent">
							</textarea>
							<input type="hidden" name="postIdx" value="<%=post.getIdx() %>">
							<input type="hidden" name="pageNum" value="<%=request.getParameter("pageNum") %>">
						</form>
						<div id="replyBox">
							<%-- List 버튼 누른 경우 --%>
							<a id="replyBtn">
								&nbsp;&nbsp;R&nbsp;e&nbsp;p&nbsp;l&nbsp;y&nbsp;&nbsp;
							</a>
						</div>
					</div>
				</div>
				
	<script type="text/javascript">
		replyForm.replyContent.focus();
		
		document.getElementById("replyBtn").onclick=function() {
			
			replyForm.action="<%=request.getContextPath()%>/wontack/question_reply_action.jsp";
			
			replyForm.submit();
		}
	</script>

</body>
</html>