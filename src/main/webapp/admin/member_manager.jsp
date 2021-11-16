<%@page import="dao.GradeDAO"%>
<%@page import="dto.GradeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

int pageSize = 10;

int pageNum = 1;
if (request.getParameter("pageNum") != null) {
	pageNum = Integer.parseInt(request.getParameter("pageNum"));
}

int startRow = (pageNum - 1) * pageSize + 1;

int endRow = pageNum * pageSize;

List<MemberDTO> productTable = MemberDAO.getDAO().selectAllNameListGeneral("order by", startRow, endRow);

int totalproduct = MemberDAO.getDAO().selectMemberCount("member");

int totalPage=(int)Math.ceil((double)totalproduct/pageSize);

if (pageNum <= 0 || pageNum > totalproduct) {
	pageNum = 1;
}

int number=totalproduct-(pageNum-1)*pageSize;

if (endRow > totalproduct) {
	 endRow = totalproduct;
	}

	List<MemberDTO> memberList=MemberDAO.getDAO().selectAllMemberList("email");
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">

h1 {
	text-align: center;
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
	height: 30px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

.memberF input {
	font-size: 15px;
	border: none;
	padding-left: 1px;
	border-bottom: 1px solid white;
}

.memberF input:focus {
	outline: none;
}


#searchM {
	width: 500px;
	margin: 0 auto;
	padding-top: 15px;
	text-align: center;
}

#searchBtnM {
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 5px 5px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

#searchBtnM:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}

/* 검색창 정렬 */
#searchM {
	display: flex;
}
#searchM #search_option {
	margin-left: 100px;
	height: 19px;
	margin-top: 5px;
}
#searchM #data {
	margin-left: 5px;
}
#searchM #searchBtnM {
	margin-left: 2px;
}
</style>
</head>
<body>
				<div class="controlArea">
					<h1>회원관리</h1>
				</div>
				<br>
				<div id="searchM">
					
						<select id = "search_option" name="search_option">
							<option value="email">이메일</option>
							<option value="name">이름</option>
						</select>
						<form id = "data" name = "data" class="memberF"
						action="<%=request.getContextPath()%>/admin/searchM_action.jsp">
						<input type="text" name="keyword" id="keyword">
						<input type="hidden" name="option" id="option">
						</form>
						<a type="button" id="searchBtnM">조회</a>
					
				</div>
				<br>
				<div class="memberlist">
				<form method="post" class="memberF" id="memberMF">
						<table>
							<tr>
								<th>번호</th>
								<th>이메일</th>
								<th>이름</th>
								<th>누적금액</th>
								<th>상태</th>
								<th>등급</th>
							</tr>
							
							<%
							for(int i = 0; i < memberList.size(); i++) { %>
							<tr>
							<td><%=number %></td>
								<th id="email<%=i %>" class="member_e"><%=memberList.get(i).getEmail() %></th>
								<th id="name" class="member_n"><%=memberList.get(i).getName() %></th>
								<th id="total" class="member_t"><%=memberList.get(i).getTotal_pay() %></th>
								<td id="status" class="member_status">
									<select id="changeStatus" class="status" 
									name="<%=memberList.get(i).getEmail()%>">
										<option value="1" <% if(memberList.get(i).getStatus()=="1") { %> selected <% } %>>활성화</option>
										<option value="0" <% if(memberList.get(i).getStatus()=="0") { %> selected <% } %>>비활성화</option>
									</select>
								
									<a type="button" id="memberM" class="memberM"
									href="<%=request.getContextPath()%>/admin/member_modify.jsp">변경</a>
								
								</td>
								<% if(memberList.get(i).getGrade().equals("20")) { %>
									<th id="grade" class="member_g">VIP</th>
								<% } else if(memberList.get(i).getGrade().equals("10")) { %>
									<th id="grade" class="member_g">Normal</th>
								<% } else { %>
									<th id="grade" class="member_g">관리자</th>
								<% } %>
							</tr>
							<% number--; %>	
							<% } %>
						</table>	
						</form>				
				</div>
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
		<%
		if (startPage > blockSize) {//2번째 블럭 이상인 경우 - 링크 설정
		%>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=member_manager&pageNum=1">&lt;&lt;</a>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=member_manager&pageNum=<%=startPage - blockSize%>">&nbsp;&nbsp;[이전]</a>
		<%
		} else {
		%>
		&lt;&lt;&nbsp;&nbsp;&nbsp;[이전]&nbsp;
		<%
		}
		%>

		<%
		for (int i = startPage; i <= endPage; i++) {
		%>
		<%
		if (pageNum != i) {
		%>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=member_manager&pageNum=<%=i%>">[&nbsp;<%=i%>&nbsp;]
		</a>
		<%
		} else {
		%>
		<span style="font-size: 20px">[&nbsp;<%=i%>&nbsp;]
		</span>
		<%
		}
		%>
		<%
		}
		%>

		<%
		if (endPage != totalPage) {//마지막 페이지 블럭이 아닌 경우 - 링크 설정
		%>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=member_manager&pageNum=<%=startPage + blockSize%>">&nbsp;[다음]</a>
		<a
			href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=member_manager&pageNum=<%=totalPage%>">&nbsp;&nbsp;&gt;&gt;</a>
		<%
		} else {
		%>
		[다음]&nbsp;&nbsp;&nbsp;&gt;&gt;
		<%
		}
		%>
		<div>&nbsp;</div>
	<script type="text/javascript">
		document.getElementById("searchBtnM").onclick=function() {
			var form = document.data;
			var option = document.getElementById("search_option");
			option = option.options[option.selectedIndex].value;
			
			if(document.getElementById("keyword").value=="") {
				alert("검색어를 입력해주세요.");
				return;
			} 
			
			document.getElementById("option").setAttribute("value",option);
			form.submit();
		};
		
		document.getElementById("memberM").click=function() {
			var form = document.data;
			var option = document.getElementById("changeStatus");
			option = option.options[option.seletedeIndex].value;
		};
		
		
		
	</script>
</body>
</html>