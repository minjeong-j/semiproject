<%@page import="dao.PostDAO"%>
<%@page import="dto.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	request.setCharacterEncoding("utf-8");

	String pageNum = request.getParameter("pageNum");
	
	PostDTO post = PostDAO.getDAO().selectPost(request.getParameter("postIdx"));
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String hit = request.getParameter("hit");
	String date = request.getParameter("date");
	String content = request.getParameter("content");
	
	if(post.getContent()==null) {
		content="";
	} else {
		content=post.getContent();
	}
	 


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

#writeBox {
	width: 1000px;
	text-align: right;
	margin-top: 40px;
	margin-right: 40px;
}

#writeBtn:hover {
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
	text-align: left;
	margin: 0px auto;
	padding: 10px;
}

#noticeForm {
	margin: 0px auto;
	text-align: center;
}

#noticeTitile, #noticeContent {
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

#noticeTitileLabel, #noticeContentLabel {
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
}

</style>
</head>
<body>
				<div class="main">
					<p class="titleArea">N&nbsp;&nbsp;o&nbsp;&nbsp;t&nbsp;&nbsp;i&nbsp;&nbsp;c&nbsp;&nbsp;e</p>

					<div id="editBox">
						
						<form id="noticeForm" method="post" name="noticeForm">
							<p id="noticeTitileLabel">제목</p>
							<textarea rows="1" style="width: 978px;" name="noticeTitle" id="noticeTitle"><%=post.getTitle()%></textarea>
							
							<p id="noticeContent">내용</p>
							<textarea rows="30" style="width: 978px;" name="noticeContent" id="noticeContent">
							<%=content.replace("&lt;", "<").replace("&gt;", ">").replaceAll("<br>","\r\n")%></textarea>
							
							<%-- 히든타입으로 페이지 번호 넘김 --%>
							<input type="hidden" name="postIdx" value="<%=post.getIdx() %>">
						</form>
						<div id="writeBox">
							<%-- List 버튼 누른 경우 --%>
							<a id="writeBtn">
								&nbsp;&nbsp;E&nbsp;d&nbsp;i&nbsp;t&nbsp;&nbsp;
							</a>
						</div>
					</div>
				</div>
	<script type="text/javascript">
		noticeForm.noticeTitle.focus();
		
		document.getElementById("writeBtn").onclick=function() {
			noticeForm.action="<%=request.getContextPath()%>/wontack/notice_modify_action.jsp";
			noticeForm.submit();
		}
	</script>

</body>
</html>