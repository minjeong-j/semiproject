<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="dto.PostDTO"%>
<%@page import="dao.PostDAO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//하나의 페이지에 검색되어 출력될 게시글의 갯수 설정
	int pageSize = 10;
	
	//초기 페이지 또는 원래 있던 페이지 설정
	int pageNum = 1;
	if (request.getParameter("pageNum") != null) {
	 pageNum = Integer.parseInt(request.getParameter("pageNum"));
	}
	
	//요청 페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
	//ex) 1Page : 1, 2Page : 11, 3Page : 21, 4Page : 31,...
	int startRow = (pageNum - 1) * pageSize + 1;
	
	//요청 페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
	//ex) 1Page : 10, 2Page : 20, 3Page : 30, 4Page : 40,...
	int endRow = pageNum * pageSize;
	
	//Post테이블에서 글 종류 notice, REVIEW, QUESTION인 행 모두 호출 
	List<PostDTO> postList = PostDAO.getDAO().selectAllPostListGeneral("REVIEW", startRow, endRow);
	
	//전체 게시글의 갯수를 계산하여 저장
	int totalPost = PostDAO.getDAO().selectPostCount("REVIEW");
	
	//전체 페이지의 갯수를 계산하여 저장
	int totalPage=(int)Math.ceil((double)totalPost/pageSize);
	
	//전달된 페이지 번호가 비정상적인 경우
	if (pageNum <= 0 || pageNum > totalPost) {
	 pageNum = 1;
	}
	
	//페이지에 출력될 게시글에 대한 글번호 시작값을 계산하여 저장
	int number=totalPost-(pageNum-1)*pageSize;
	
	//마지막 페이지에 대한 처리 - 마지막 페이지 묶음의 최대 페이지수와 전체 게시글에서 나올 수 있는 페이지 수를 비교
	if (endRow > totalPost) {
	 endRow = totalPost;
	}
	
	//오늘 날짜 시간
	String currentDate=new SimpleDateFormat("yyyy-MM-dd").format(new Date());
%>
<!DOCTYPE html>
<html>
<head>
<title>관리자</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
h1 {
	text-align: center;
	/*br 대신 사용*/
	margin-bottom: 30px;
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	width: auto;
	border-collapse: collapse;
	margin-top: 30px;
}

th, td {
	padding: 11px 10px 10px;
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

#data input {
	font-size: 18px;
	padding-left: 1px;
	line-height: 20px;
}

#data input:focus {
	outline: none;
}

#searchBtnR {
   margin: 0 auto;
   background-color: rgb(207, 207, 207);
   cursor: pointer;
   padding: 5px 5px;
   color: rgb(13, 13, 13);
   font-size: 15px;
   font-family: 'Montserrat', sans-serif;
}
#searchBtnR:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}

/**/
#pageMove {
	margin: 0 auto;   
}

.deletebtn {
	width: 15px;
}
</style>
</head>
<body>
		<div class="controlArea">
			<h1>REVIEW 관리</h1>
		</div>
		<br>
		
		<div class="postlist">
			<table>
				<tr>
					<th></th>
					<th>게시판 종류</th>
					<th>이메일</th>
					<th>제목</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				
				 <% 
                  int j = 0;
                  for(; j < postList.size(); j++)  { 
                  %>
				<tr>
					<td>
                        <input type="button" value="X" id="delete"
                        class="deletebtn" onclick="deleteIdx(<%=j%>)">
		             <input type="hidden" id="idx<%=j %>" value="<%=postList.get(j).getIdx() %>">
                       </td>
					<td>REVIEW</td>
					<td id="email<%=j %>" class="post_e"><%=postList.get(j).getEmail() %></td>
                     	<td id="title<%=j %>" class="post_t"><%=postList.get(j).getTitle() %></td>
                     	<td id="post_date<%=j %>" class="post_d"><%=postList.get(j).getPosted_date() %></td>
                     	<td id="hit<%=j %>" class="post_h"><%=postList.get(j).getHit() %></td>
				</tr>
				<% } %>
			</table>
			<form id="data" name="data" method="post" action="<%=request.getContextPath()%>/admin/delete_r.jsp">
         	  <input type="hidden" id="idx" name="idx">
            </form>
		</div>
		<div id="pageMove">
		<%-- 페이지 번호 출력 및 링크 설정 - 페이징 처리 --%>
		<%
			//페이지 블럭에 출력될 페이지의 갯수 저장
			int blockSize = 5;

			//페이지 블럭에 출력될 시작 페이지 번호를 계산하여 저장
			int startPage = (pageNum - 1) / blockSize * blockSize + 1;

			//페이지 블럭에 출력될 종료 페이지 번호를 계산하여 저장
			int endPage = startPage + blockSize - 1;

			//마지막 페이지 블럭의 종료 페이지 번호 변경
			if (endPage > totalPage) {
				endPage = totalPage;
			}
		%>
		<% if (startPage > blockSize) {//2번째 블럭 이상인 경우 - 링크 설정 %>
			<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=review_manager&pageNum=1">&lt;&lt;</a>
			<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=review_manager&pageNum=<%=startPage - blockSize%>">&nbsp;&nbsp;[이전]</a>
		<% } else { %>
			&lt;&lt;&nbsp;&nbsp;&nbsp;[이전]&nbsp;
		<% } %>

		<% for (int i = startPage; i <= endPage; i++) { %>
			<% if (pageNum != i) { %>
				<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=review_manager&pageNum=<%=i%>">[&nbsp;<%=i%>&nbsp;]</a>
			<% } else { %>
				<span style="font-size: 20px">[&nbsp;<%=i%>&nbsp;]
				</span>
			<% } %>
		<% } %>

		<% if (endPage != totalPage) {//마지막 페이지 블럭이 아닌 경우 - 링크 설정 %>
			<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=review_manager&pageNum=<%=startPage + blockSize%>">&nbsp;[다음]</a>
			<a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=review_manager&pageNum=<%=totalPage %>">&nbsp;&nbsp;&gt;&gt;</a>
		<% } else { %>
			[다음]&nbsp;&nbsp;&nbsp;&gt;&gt;
		<% } %>
		<div>&nbsp;</div>
		</div>
		
<script type="text/javascript">

function deleteIdx(j) {
	 var form = document.data;
	 var idx = document.getElementById("idx"+j).value;
	 document.getElementById("idx").value = idx;
	 
	 if(window.confirm("선택 게시글을 삭제하시겠습니까?")) {
	       form.submit();
 	}
}
</script>
</body>
</html>