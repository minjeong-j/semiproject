<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Login</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
#contents {
	margin: 0 auto;
	padding: 100px 0;
	max-width: 1200px;
}

.titleArea {
	text-align: center;
}

.loginForm table {
	margin: 0 auto;
}

.loginForm table th {
	font-size: 15px;
	text-align: left;
	padding: 25px 0;
	display: block;
	text-align: left;
}

.loginForm table td {
	display: block;
	border-bottom: 1px solid white;
}

.loginForm table th, td {
	min-width: 100px;
	max-width: 500px;
}

.loginForm table th, td::after {
	content: "";
	display: block;
	clear: both;
}

.loginForm table th span {
	float: right;
	font-size: 12px;
	opacity: 0.5;
}

.loginForm table td span {
	float: right;
	font-size: 12px;
	opacity: 0.8;
}

.loginForm table input {
	font-size: 18px;
	border: none;
	padding-left: 1px;
	line-height: 20px;
	min-width: 300px;
}

.loginForm table input:focus {
	outline: none;
}

.button {
	height: 49px;
	width: 300px;
	margin: 0 auto;
	background-color: rgb(207, 207, 207);
	cursor: pointer;
	padding: 15px 15px;
	border: 15px;
	color: rgb(13, 13, 13);
	font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}

.button:hover {
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 2px solid rgb(207, 207, 207);
}

.loginButton {
	text-align: center;
	padding: 15px 1px;
	border: 15px;
}

.areaS {
	text-align: center;
	font-family: 'Montserrat', sans-serif;
}

</style>
</head>
<body>
			<div id="contents">
				<div class="titleArea">
					<h1>Log In</h1>
				</div>
				<div class="logintable">
					<div class="login">
						<form id="loginForm" class="loginForm" method="post"
							action="<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=login_action">
							<table>
								<tbody>
									<tr>
										<th>이메일</th>
										<td><input type="text" id="email" name="email"> <span
											id="emailCheck"></span></td>
									</tr>
									<tr>
										<th>비밀번호</th>
										<td><input type="password" id="password" name="password">
											<span id="pwCheck"></span></td>
									</tr>
								</tbody>
							</table>

							<div class="loginButton">
								<button type="submit" class="button">LogIn</button>
							</div>

							<div class="areaS">
								<div class="searchM">
									<a style="font-size: 11px;"
										href="<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=searchE"
										class="se">이메일 찾기</a> &nbsp;/&nbsp;
									<a style="font-size: 11px;"
										href="<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=searchP"
										class="sp">비밀번호 찾기</a>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>

	<!-- container end -->
	<script type="text/javascript">
		loginForm.email.focus();

		$(document).ready(function() {

		});
		$("#loginForm").submit(function() {
			var submitResult = true;

			if ($("#email").val() == "") {
				$("#emailCheck").html("(이메일을 입력해주세요)");
				submitResult = false;
			}

			if ($("#password").val() == "") {
				$("#pwCheck").html("(비밀번호를 입력해주세요)");
				submitResult = false;
			}

			return submitResult;
		});
	</script>
</body>
</html>


