<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="/security/login_url.jspf" %>--%>
<%
	
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/common.css"> 
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
caption {
	display: none;
}

table {
	border: 1px solid rgb(207, 207, 207);
	border-collapse: collapse;
	font-size: 100%;
	margin: 0 auto;

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
td, th {
	border: 1px solid rgb(207, 207, 207);
}
th {
	text-align: left;
	padding: 11px 0 10px 18px;
}
td {
	text-align: left;
	padding: 10px 10px 10px;
}
input {
	border: 1px solid white;
	padding: 4px;
}
label {
	padding: 4px;
	margin: 10px 0;
}
input [type=text] {
	height: 18px;
	line-height: 20px;
	padding: 4px 4px;
}
.addr{
	padding: 5px 0;
}
a {
	padding: 5px;
}
#btn {
	text-align: right;
	margin: 30px 166px 0 0;
}
#btn button {
	width: 100px;
	line-height: 30px;
	margin: 0 10px;
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}
#btn button:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
}
</style>
</head>
<body>
  <div id="wrap">
	<%-- header 불러오기 --%>
	<jsp:include page="../form/header.jsp"/>
    <%-- side 불러오기 --%>
    <jsp:include page="../form/side.jsp"/>
    <!-- container start -->  
    <div id="container">
	   <!-- content area -->
      <div id="content">   
        <div class="main"> 
        	<div class="titleArea">
        		<h1>Profile</h1>
        		<br>
         	</div>  
        	<div id="profile">
        		<form action="">
	        		<table>
	        			<caption>프로필</caption>
	        			<colgroup>
	        				<col style="width: 150px;">
	        				<col style="width: 1000px;">
	        			</colgroup>
	        			<tbody>
	        				<tr>
	        					<th>아이디(이메일)</th>
	        					<td style="">
	        						<input type="email" style="width: 150px;">
	        					</td>
	        				</tr>
	        				<tr>
	        					<th>비밀번호</th>
	        					<td>
	        						<input type="password" style="width: 150px;">&nbsp;&nbsp;(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10~16자)
	        					</td>
	        				</tr>
	        				<tr>
	        					<th>비밀번호 확인</th>
	        					<td>
	        						<input type="password" style="width: 150px;">
	        					</td>
	        				</tr>
	        				<tr>
	        					<th>이름</th>
	        					<td>
	        						<input type="text" style="width: 150px;">
	        					</td>
	        				</tr>
	        				<tr>
	        					<th>주소</th>
	        					<td>
	        						<div class="addr">
	        							<div style="margin-bottom: 7px;">
											<label for="addrName1">별칭 : </label>
											<input type="text" id="addrName1" style="width: 80px;">
	        							</div>
			       						<input type="text" style="width: 50px;">
			       						<a href="" style="border: 1px solid white; margin-left: 5px;">우편번호</a>
			       						<br>
			       						<input type="text" style="margin: 10px 0; width: 250px;">&nbsp;&nbsp;기본주소
			       						<br>
			       						<input type="text" style="width: 250px;">&nbsp;&nbsp;나머지주소(선택입력가능)
	        						</div>
	        					</td>
	        				</tr>
	      					<tr>
	        					<th>휴대전화</th>
	        					<td>
	        						<select id="phone">
	        							<option value="010">010</option>
	        							<option value="011">011</option>
	        						</select>
	        						<span>-</span>
	        						<input type="text" maxlength="4" style="border: 1px solid white; width: 60px">
	        						<span>-</span>
	        						<input type="text" maxlength="4" style="border: 1px solid white; width: 60px">
	        					</td>
	        				</tr>
	        			</tbody>
	        		</table>
        		</form>      		
        	</div>
        	<div id="btn">
        		<button type="submit">변경완료</button>
        		<button type="submit">회원탈퇴</button>
        	</div>
        </div>
      </div>
    </div>
    <!-- container end -->

	<%-- footer 불러오기 --%>
	<jsp:include page="../form/footer.jsp"/>
  </div>
</body>
</html>