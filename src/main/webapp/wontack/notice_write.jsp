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
<style type="text/css">
#editBox {
	padding: 0px;
	margin: 0px auto;
	width: 1000px;
}

#modifyBox {
	width: 1000px;
	text-align: right;
	margin-top: 40px;
	margin-right: 40px;
}

#modifyBtn:hover {
	cursor: pointer;
	background-color: white;
	color: black;
}

#modifyBtn {
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
							<textarea rows="1" style="width: 978px;" name="noticeTitle" id="noticeTitle"></textarea>
							
							<p id="noticeContent">내용</p>
							<textarea rows="30" style="width: 978px;" name="noticeContent" id="noticeContent"></textarea>
						</form>
						<div id="modifyBox">
							<%-- List 버튼 누른 경우 --%>
							<a id="modifyBtn">
								&nbsp;&nbsp;W&nbsp;r&nbsp;i&nbsp;t&nbsp;e&nbsp;&nbsp;
							</a>
						</div>
					</div>
				</div>
	<script type="text/javascript">
		noticeForm.noticeTitle.focus();
		
		document.getElementById("modifyBtn").onclick=function() {
			noticeForm.action="<%=request.getContextPath()%>/wontack/notice_action.jsp";
			noticeForm.submit();
		}
	</script>

</body>
</html>