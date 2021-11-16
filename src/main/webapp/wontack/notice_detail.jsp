<%@page import="dto.MemberDTO"%>
<%@page import="dto.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	PostDTO post=PostDAO.getDAO().selectPost(request.getParameter("postIdx"));

	int pageNum=Integer.parseInt(request.getParameter("pageNum"));
	
	PostDAO.getDAO().updatePostHit(request.getParameter("postIdx"));
	
	MemberDTO member = (MemberDTO)session.getAttribute("loginMember");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
table {
	width: 1200px;
	margin: 5px auto;
	border: 0.5px solid white;
	border-collapse: collapse;
}


td {
	height: 40px;
	border: 0.5px solid white;
	padding: 20px;
}

#title {
	padding: 20px;
	margin: 5px auto;
	text-align: center;
	width: 1000px;
}

.mainContet {
	width: 1000px;
	margin: 0px auto;
	border: 0.5px solid white;
	padding: 20px;
	border-collapse: collapse;
}

#listBox {
	text-align: right;
	margin: 40px 0px 40px 0px;
	
}

#listBtn:hover {
	background-color: white;
	color: black;
}

#listBtn {
	border: 0.5px solid white;
	padding: 10px;
}

#modifyBox {
	text-align: right;
	margin: 40px 0px 40px 0px;
	
}

#modifyBtn:hover {
	background-color: white;
	color: black;
}

#modifyBtn {
	border: 0.5px solid white;
	padding: 10px;
}

#deleteBtn:hover {
	background-color: white;
	color: black;
}

#deleteBtn {
	border: 0.5px solid white;
	padding: 10px;
	margin-left: 10px;
}

#main {
	width: 1200px;
	margin: 5px auto;
	border-collapse: collapse;
}

.other {
	height: 30px;
	width: 100px;
	border: 0.5px solid white;
	padding: 10px;
	text-align: center;
}

.otherSubject {
	height: 30px;
	padding: 10px;
}

</style>
</head>
<body>
	<div class="main" id="main">
		<h1 class="titleArea">N&nbsp;&nbsp;o&nbsp;&nbsp;t&nbsp;&nbsp;i&nbsp;&nbsp;c&nbsp;&nbsp;e</h1>

		<table id="tableTop">
			<tr>
				<td style="text-align: left;">
					<p><%=post.getTitle() %></p>
					<p>&nbsp;</p>
					<p>Writer&nbsp;&nbsp;[관]<%=post.getEmail().split("@")[0]%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Hit&nbsp;&nbsp;
						<%=post.getHit()+1 %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date&nbsp;&nbsp;<%=post.getPosted_date().substring(0,16) %></p>
				</td>
			</tr>
			<tr>
				<td style="text-align: left;"><span> <%=post.getContent() %>
				</span></td>
			</tr>
		</table>
		
		<table style="border: 0px;">
		<tr style="height: 80px">
		<td style="padding-left: 0px; text-align: left; border: 0px;">
		<% if(member==null) { %>
		<% } else { %>
		<% if(!member.getGrade().equals("00")) { %>
		<% } else { %>
			<a id="modifyBtn">
				&nbsp;&nbsp;M&nbsp;o&nbsp;d&nbsp;i&nbsp;f&nbsp;y&nbsp;&nbsp;
			</a>
			
			<a id="deleteBtn">
				&nbsp;&nbsp;D&nbsp;e&nbsp;l&nbsp;e&nbsp;t&nbsp;e&nbsp;&nbsp;
			</a>
		</td>
		<% } %>
		<% } %>
		<td style="padding-right: 0px; text-align: right; border: 0px;">
			<%-- List 버튼 누른 경우 --%>
			<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=notice&pageNum=<%=pageNum %>" id="listBtn">
				&nbsp;&nbsp;L&nbsp;i&nbsp;s&nbsp;t&nbsp;&nbsp;
			</a>
		</td>
		</tr>
		</table>
	</div>
	
	<form id="postForm" method="post">
		<input type="hidden" name="postIdx" value="<%=post.getIdx() %>">
	</form>
	
	<script type="text/javascript">
	$("#modifyBtn").click(function() {
		$("#postForm").attr("action", "<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=notice_modify");
		$("#postForm").submit();
	});
	
	$("#deleteBtn").click(function() {
		if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
			$("#postForm").attr("action", "<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=post_delete_action");
			$("#postForm").submit();
		}
	});
	</script>	
	
</body>
</html>