<%@page import="dto.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

String search=request.getParameter("search");
if(search==null) {
	search="";
}

String keyword=request.getParameter("keyword");
if(keyword==null) {
	keyword="";
}

//하나의 페이지에 검색되어 출력될 게시글의 갯수 설정
int postSize = 10;

//초기 페이지 또는 원래 있던 페이지 설정
int pageNum = 1;
if (request.getParameter("pageNum") != null) {//전달값이 있는 경우
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}

//요청 페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
//ex) 1Page : 1, 2Page : 11, 3Page : 21, 4Page : 31,...
int startRow = (pageNum - 1) * postSize + 1;

//요청 페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
//ex) 1Page : 10, 2Page : 20, 3Page : 30, 4Page : 40,...
int endRow = pageNum * postSize;

//Post테이블에서 글 종류가 notice인 행 모두 호출
List<PostDTO> postList = PostDAO.getDAO().selectAllPostListGeneral("NOTICE", startRow, endRow, search, keyword);

//공지사항 NOTICE의 전체 게시글의 갯수를 계산하여 저장
int totalPost = PostDAO.getDAO().selectPostCount("NOTICE", search, keyword);

//공지사항 NOTICE의 전체 페이지의 갯수를 계산하여 저장
int totalPage = (int) Math.ceil((double) totalPost / postSize);

//전달된 페이지 번호가 비정상적인 경우
if (pageNum <= 0 || pageNum > totalPost) {
	pageNum = 1;
}

//페이지에 출력될 게시글에 대한 글번호 시작값을 계산하여 저장
int number = totalPost - (pageNum - 1) * postSize;

//마지막 페이지에 대한 처리 - 마지막 페이지 묶음의 최대 페이지수와 전체 게시글에서 나올 수 있는 페이지 수를 비교
if (endRow > totalPost) {
	endRow = totalPost;
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
table {
	width: 1000px;
	margin: 5px auto;
	border: 0.5px solid white;
	border-collapse: collapse
}

th {
	height: 40px;
	border: 0.5px solid white;
	text-align: center;
}

td {
	height: 40px;
	border: 0.5px solid white;
}

.num {
	width: 60px;
	text-align: center;
}

#body .subject {
	width: 700px;
	text-align: left;
	padding-left: 10px;
}

.writer {
	width: 120px;
	text-align: center;
}

.hit {
	width: 120px;
	text-align: center;
}

#pageMove {
	margin: 5px auto;
	text-align: center;
}

p {
	text-align: center;
	padding: 20px;
}

#pageMove {
	width: 1000px;
}
</style>
</head>
	<h1 class="titleArea">N&nbsp;&nbsp;o&nbsp;&nbsp;t&nbsp;&nbsp;i&nbsp;&nbsp;c&nbsp;&nbsp;e</h1>
	
		<table>
			<tr id="header">
				<th class="num">번호</th>
				<th class="subject">제목</th>
				<th class="writer">작성자</th>
				<th class="hit">조회수</th>
			</tr>
			<%-- List에 저장된 PostDTO 인스턴스 이용해 값 전달 --%>
			<% for (PostDTO post : postList) { %>
			<tr id="body">
				<td class="num"><%=number%></td>
				<%--<td class="subject"><%=post.getTitle()%></td> --%>
				<%--<td class="subject"><a href="<%=request.getContextPath()%>/wontack/notice_detail.jsp?pageNum="><%=post.getTitle()%></a></td>--%>
				<td class="subject"><a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=notice_detail&pageNum=<%=pageNum %>&postIdx=<%=post.getIdx() %>"><%=post.getTitle() %></a></td>
				<td class="writer">[관]<%=post.getEmail().split("@")[0]%></td>
				<td class="hit"><%=post.getHit()%></td>
			</tr>
			<% number--; %>
			<% } %>

		</table>

		<div id="pageMove">
			<%-- 페이지 번호 출력 및 링크 설정 - 페이징 처리 --%>
			<%
			//페이지 블럭에 출력될 페이지의 갯수 저장
			int blockSize = 5;

			//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장
			//ex) 1Block : 1, 2Block : 6, 3Block : 11, 4Block :	 16,...
			int startPage = (pageNum - 1) / blockSize * blockSize + 1;

			//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
			//ex) 1Block : 5, 2Block : 10, 3Block : 15, 4Block : 20,...
			int endPage = startPage + blockSize - 1;

			//마지막 페이지 블럭의 종료 페이지 번호 변경
			if (endPage > totalPage) {
				endPage = totalPage;
			}
			%>
			
			<% if (startPage > blockSize) {//2번째 블럭 이상인 경우 - 링크 설정 %>
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=notice&pageNum=1">&lt;&lt;</a>
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=notice&pageNum=<%=startPage - blockSize%>">&nbsp;&nbsp;[이전]</a>
			<% } else { %>
				&lt;&lt;&nbsp;&nbsp;&nbsp;[이전]&nbsp;
			<% } %>

			<% for (int i = startPage; i <= endPage; i++) { %>
				<% if (pageNum != i) { %>
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=notice&pageNum=<%=i%>">[&nbsp;<%=i%>&nbsp;] </a>
				<% } else { %>
					<span style="font-size: 20px">[&nbsp;<%=i%>&nbsp;] </span>
				<% } %>
			<% } %>

			<% if (endPage != totalPage) {//마지막 페이지 블럭이 아닌 경우 - 링크 설정 %>
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=notice&pageNum=<%=startPage + blockSize%>">&nbsp;[다음]</a>
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=notice&pageNum=<%=totalPage%>">&nbsp;&nbsp;&gt;&gt;</a>
			<% } else { %>
				[다음]&nbsp;&nbsp;&nbsp;&gt;&gt;
			<% } %>
			<div>&nbsp;</div>

		</div>
		
</body>
</html>