<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/index.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
.loginForm table {
	margin: 0 auto;
}
.loginForm table th {
	text-align: left;
	padding: 25px 0;
	display: block;
}
.lofinForm table td {
	display: block;
}

.joinTable::after {
	content='';
	display: block;
	clear:both;
}

.loginForm table th span {
	float: right;
	font-size: 10px;
	opacity: 0.5;
}

.loginForm table input {
	width: 500px;
}

</style>
</head>
<body>
	<div id="wrap">
		<%-- header 불러오기 --%>
		<jsp:include page="../form/header.jsp" />
		<!-- container start -->
		<div id="container">
			<%-- side 불러오기 --%>
			<jsp:include page="../form/side.jsp" />
			<!-- content area -->
			<div id="content">
				<div class="titleArea">
					<h1>Join</h1>
				</div>
				<div class="joinTable">				
					<form action="" class="loginForm">
						<table>
							<tbody>
								<tr >
									<th style="display: block;">아이디
										<span>(영문소문자/숫자. 4~16자)</span>
									</th>
									<td style="display: block; border-bottom: 1px solid white;"><input type="text" style="border: none;"></td>
								</tr>
								<tr >
									<th style="display: block;">비밀번호
										<span>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10자~16자)</span>
									</th>
									<td style="display: block; border-bottom: 1px solid white;"><input type="text" style="border: none; font-size: 15px;"></td>
								</tr>
								<tr >
									<th style="display: block;">비밀번호확인</th>
									<td style="display: block; border-bottom: 1px solid white;"><input type="text" style="border: none;"></td>
								</tr>
								<tr >
									<th style="display: block;">이름</th>
									<td style="display: block; border-bottom: 1px solid white;"><input type="text" style="border: none;"></td>
								</tr>
								<tr >
									<th style="display: block;">휴대전화</th>
									<td style="display: block; border-bottom: 1px solid white;"><input type="text" style="border: none;"></td>
								</tr>
								<tr >
									<th style="display: block;">이메일</th>
									<td style="display: block; border-bottom: 1px solid white;"><input type="text" style="border: none;"></td>
								</tr>

							</tbody>
						</table>
					</form>
				</div>
			</div>
		</div>
		<!-- container end -->
		<%-- footer 불러오기 --%>
		<jsp:include page="../form/footer.jsp" />
	</div>
</body>
</html>