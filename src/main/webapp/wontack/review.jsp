<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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

//if(search.equals("productIdx")) {
//	ProductDTO product = ProductDAO.getDAO().searchProductName(keyword);
//	keyword = product.getIdx();
//}

List<ProductDTO> productList = ProductDAO.getDAO().searchProductNameList(keyword);
	
//하나의 페이지에 검색되어 출력될 게시글의 갯수 설정
int pageSize = 10;

//초기 페이지 또는 원래 있던 페이지 설정
int pageNum = 1;
if (request.getParameter("pageNum") != null) {//전달값이 있는 경우
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}

//요청 페이지 번호에 대한 게시글 시작 행번호를 계산하여 저장
//ex) 1Page : 1, 2Page : 11, 3Page : 21, 4Page : 31,...
int startRow = (pageNum - 1) * pageSize + 1;

//요청 페이지 번호에 대한 게시글 종료 행번호를 계산하여 저장
//ex) 1Page : 10, 2Page : 20, 3Page : 30, 4Page : 40,...
int endRow = pageNum * pageSize;

//Post테이블에서 글 종류가 notice인 행 모두 호출
List<PostDTO> postList = PostDAO.getDAO().selectAllPostListGeneral("REVIEW", startRow, endRow, search, keyword);


//공지사항 NOTICE의 전체 게시글의 갯수를 계산하여 저장
int totalPost = PostDAO.getDAO().selectPostCount("REVIEW", search, keyword);

//공지사항 NOTICE의 전체 페이지의 갯수를 계산하여 저장
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
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
table {
	width : 1120px;
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
	width: 80px;
	text-align: center;
}

.item {
	width: 200px;
	text-align: center;
}

#body .subject {
	width: 600px;
	text-align: left;
	padding-left: 1em;
}

.writer {
	width: 120px;
	text-align: center;
}

.date {
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

#search {
	text-align: right;
}

#pageMove {
	width: 1120px;
}

#writeBtn:hover {
	cursor: pointer;
	background-color: white;
	color: black;
}

#writeBtn {
	border: 0.5px solid white;
	padding: 10px;
}

</style>
</head>
<body>
	<div class="main">
		<h1 class="titleArea">R&nbsp;&nbsp;e&nbsp;&nbsp;v&nbsp;&nbsp;i&nbsp;&nbsp;e&nbsp;&nbsp;w</h1>

		<table>
			<tr id="header">
				<th class="num">문의번호</th>
				<th class="item">제품명</th>
				<th class="subject">제목</th>
				<th class="writer">작성자</th>
				<th class="date">작성일</th>
			</tr>
			<%-- List에 저장된 PostDTO 인스턴스 이용해 값 전달 --%>
			
			<% for (PostDTO post : postList) { %>
			<tr id="body">
				<td class="num"><%=number %></td>
				<td class="item"><%=ProductDAO.getDAO().selectProduct(post.getProduct_idx()).getName() %></td>
				<td class="subject">
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review_detail&pageNum=<%=pageNum %>&postIdx=<%=post.getIdx() %>">
						<%=post.getTitle()%>
					</a>
				</td>
				<td class="writer">
				
				<%
					MemberDTO member = MemberDAO.getDAO().selectMember(post.getEmail());
				%>
				
				<% if(member.getGrade().equals("00")) {	%>
				[관]
				<% } else {} %>
				<%=post.getEmail().split("@")[0]%>
				</td>
				<td class="date">
					<% if(currentDate.equals(post.getPosted_date().substring(0, 10))) {//날짜가 같은 경우 %>
						<%=post.getPosted_date().substring(11).substring(0, 5) %> <%-- 시간만 출력 --%>
					<% } else { %> 
						<%=post.getPosted_date().substring(0,10) %> <%-- 날짜와 시간 출력 --%>
					<% } %>
				</td>

			</tr>
			
			<%-- 번호를 하나씩 줄이는 기능 --%>
			<% number--; %>
			
			<% } %>
			<tr>
				<td colspan="5">
					<form
						action="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review&pageNum=1"
						method="post" id="search">
						<!-- select 입력태그에 의해 전달되는 값은 컬럼명과 동일하게 설정 -->
						<select name="search">
							<option value="title" selected="selected">&nbsp;제목&nbsp;</option>
							<option value="email">&nbsp;작성자&nbsp;</option>
							<%--<option value="productIdx">&nbsp;제품명&nbsp;</option>--%>
						</select> <input type="text" name="keyword">
						<button type="submit">검색</button>
						&nbsp;&nbsp;
					</form>
				</td>
			</tr>

		</table>
		
		<table style="border: 0px; margin-top: 20px">
			<tr style="border: 0px;">
				<td style="width: 160px; border: 0px;"></td>
				<td style="width: 800px; border: 0px; text-align: center;">

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
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review&pageNum=1">&lt;&lt;</a>
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review&pageNum=<%=startPage - blockSize%>">&nbsp;&nbsp;[이전]</a>
			<% } else { %>
				&lt;&lt;&nbsp;&nbsp;&nbsp;[이전]&nbsp;
			<% } %>

			<% for (int i = startPage; i <= endPage; i++) { %>
				<% if (pageNum != i) { %>
					<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review&pageNum=<%=i%>">[&nbsp;<%=i%>&nbsp;]</a>
				<% } else { %>
					<span style="font-size: 20px">[&nbsp;<%=i%>&nbsp;]
					</span>
				<% } %>
			<% } %>

			<% if (endPage != totalPage) {//마지막 페이지 블럭이 아닌 경우 - 링크 설정 %>
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review&pageNum=<%=startPage + blockSize%>">&nbsp;[다음]</a>
				<a href="<%=request.getContextPath()%>/index.jsp?workgroup=wontack&work=review&pageNum=<%=totalPage %>">&nbsp;&nbsp;&gt;&gt;</a>
			<% } else { %>
				[다음]&nbsp;&nbsp;&nbsp;&gt;&gt;
			<% } %>
			
			</td>
				
				<td style="text-align: right; width: 160px; border: 0px;">
					<%-- List 버튼 누른 경우 --%>
					<a id="writeBtn">
						&nbsp;&nbsp;W&nbsp;r&nbsp;i&nbsp;t&nbsp;e&nbsp;&nbsp;
					</a>
				</td>
				
			</tr>
		</table>
	</div>
	<script type="text/javascript">
	$("#writeBtn").click(function() {
		<% if(session.getAttribute("loginMember")==null) { %>
		location.href = "<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=login";	
		<% } else{%>
		alert("리뷰작성은 구매내역에서 작성해 주시기 바랍니다.");
		location.href = "<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=myPage";
		<%}%>
	});
	</script>	
</body>
</html>