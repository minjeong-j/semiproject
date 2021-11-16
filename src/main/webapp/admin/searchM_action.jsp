<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	request.setCharacterEncoding("UTF-8");

	String option=request.getParameter("option");
	String keyword=request.getParameter("keyword");	
	
	List<MemberDTO> searchMember = new ArrayList<MemberDTO>();
	searchMember=MemberDAO.getDAO().searchMemberList(keyword, option);
	System.out.println(option+""+keyword);
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
<style type="text/css">
/* CSS 작성 */
#contents {
	margin: 0 auto;
	padding: 100px 0 80px;
}

h1 {
	text-align: center;
}

table {
	margin: 5px auto;
	border: 0.5px solid rgb(207, 207, 207);
	width: auto;
	border-collapse: collapse;
}

th, td {
	padding: 11px 10px 10px;
	height: 40px;
	border: 0.5px solid rgb(207, 207, 207);
	text-align: center;
}

form {
	text-align: center;
	font-size: 15px;
}

</style>
</head>
<body>
	<div id="wrap">
		<%-- side 불러오기 --%>
		<jsp:include page="/admin/admin_side.jsp" />
		<!-- container start -->
		<div id="container">
			<div id="content">
				<div class="controlArea">
					<h1>회원관리</h1>
				</div>
				<div class="memberlist">
					<form name="memberForm" id="memberForm">
						<table>
							<tr>
								<th>이메일</th>
								<th>이름</th>
								<th>누적금액</th>
								<th>등급</th>
								<th>상태</th>
							</tr>
						
							<%
							int i=0;
							for(; i<searchMember.size(); i++) { %>
							<tr>
								<th id="email" class="member_e"><%=searchMember.get(i).getEmail() %></th>
								<th id="name" class="member_n"><%=searchMember.get(i).getName() %></th>
								<th id="total" class="member_t"><%=searchMember.get(i).getTotal_pay() %></th>
								<th id="grade" class="member_g"><%=searchMember.get(i).getGrade() %></th>
							
								<td id="status" class="member_status">
									<select class="status" name="<%=searchMember.get(i).getEmail()%>">
										<option value="0" <% if(searchMember.get(i).getStatus()=="0") { %> selected <% } %>>활성화</option>
										<option value="1" <% if(searchMember.get(i).getStatus()=="1") { %> selected <% } %>>비활성화</option>
									</select>
								</td>
							</tr>
								<% } %>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		
	</script>
</body>
</html>