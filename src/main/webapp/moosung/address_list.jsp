<%@page import="java.util.ArrayList"%>
<%@page import="dao.AddressDAO"%>
<%@page import="dto.AddressDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<%
String referer = request.getHeader("referer");

List<AddressDTO> addressList = AddressDAO.getDAO().selectAllAddressList(loginMember.getEmail());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>nookyoon</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
table {
	border: 1px solid rgb(207, 207, 207);
	border-collapse: collapse;
	font-size: 100%;
	margin: auto;
}

table a {
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}

table a:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}

table input:focus {
	outline: none;
}

td, th {
	border: 1px solid rgb(207, 207, 207);
}

th {
	font-size: 17px;
	text-align: center;
	padding: 5px;
}

td {
	text-align: left;
	padding: 10px 10px 10px;
	font-size: 15px;
}

table .delete {
	cursor: pointer;
}

label {
	padding: 4px;
	margin: 10px 0;
}

input {
	font-size: 13px;
	padding-left: 1px;
	line-height: 20px;
	border: none;
	max-width: 500px;
}

.clickable {
	cursor: pointer;
}

.clickable:hover {
	text-decoration: underline;
}

.addr {
	padding: 5px 0;
}

a {
	padding: 5px;
}

button {
	width: 100px;
	height: 20px;
	margin: 0 10px;
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}

button:hover {
	cursor: pointer;
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
	background-color: rgb(13, 13, 13);
}

.titleArea {
	text-align: center;
	padding-top: 70px;
	padding-bottom: 10px;
}

#add_address {
	text-align: center;
	width: 120px;
	line-height: 30px;
}
</style>
</head>
<body>
	<div class="titleArea">
		<h1>주소록</h1>
		<br>
	</div>

	<%
	if (addressList.isEmpty()) {
	%>
	<p>저장된 주소가 없습니다</p>
	<%
	} else {
	%>
	<table>
		<tr>
			<th>주소지명</th>
			<th>우편 번호</th>
			<th>도로명 주소</th>
			<th>상세 주소</th>
			<th>삭제</th>
		</tr>
		<%
		int i = 0;
		for (; i < addressList.size(); i++) {
		%>
		<tr>
			<td><input type="text" id="address_id<%=i%>"
				name="address_id<%=i%>" class="clickable" onclick="load(<%=i%>)"
				value="<%=addressList.get(i).getId()%>" readonly="readonly"></td>
			<td id="post_code<%=i%>"><%=addressList.get(i).getPost_code()%></td>
			<td id="road_address<%=i%>"><%=addressList.get(i).getRoad_address()%></td>
			<td id="detail_address<%=i%>"><%=addressList.get(i).getDetail_address()%></td>
			<td id="delete" class="delete" onclick="deleteAddress(<%=i%>)">삭제</td>
		</tr>
		<%
		}
		%>
	</table>
	<form id="data" name="data" method="post" action="<%=request.getContextPath()%>/moosung/address_delete_action.jsp">
		<input type="hidden" id="id" name = "id">
	</form>
	<%
	}
	%>

	<script type="text/javascript">
		function load(i) {
			opener.document.getElementById("address_id").value = document.getElementById("address_id"+i).value;
			opener.document.getElementById("post_code").value = document.getElementById("post_code"+i).innerText;
			opener.document.getElementById("road_address").value = document.getElementById("road_address"+i).innerText;
			opener.document.getElementById("detail_address").value = document.getElementById("detail_address"+i).innerText;
			
			window.open('','_self').close();
		}	
		
		function deleteAddress(i) {
			var form = document.data;
			var id = document.getElementById("address_id"+i).value;
			document.getElementById("id").value = id;
			if(window.confirm("주소지를 삭제하시겠습니까?")) {
				form.submit();
			}
		}	
	</script>
</body>
</html>