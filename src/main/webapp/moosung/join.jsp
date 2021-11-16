<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Join</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
.joinForm table {
	margin: 0 auto;
}

.joinForm table th {
	font-size: 15px;
	text-align: left;
	padding: 25px 0;
	display: block;
	text-align: left;
}

.joinForm table td {
	display: block;
	border-bottom: 1px solid white;
}

.joinForm table th, td {
	min-width: 100px;
	max-width: 500px;
}

.joinForm table th, td::after {
	content: "";
	display: block;
	clear: both;
}

.joinForm table th span {
	float: right;
	font-size: 12px;
	opacity: 0.5;
}

.joinForm table td span {
	float: right;
	font-size: 12px;
	opacity: 0.8;
}

.joinForm table input {
	font-size: 18px;
	border: none;
	padding-left: 1px;
	line-height: 20px;
	min-width: 300px;
}

.joinForm table input:focus {
	outline: none;
}

.joinButton {
	padding-top: 30px;
	text-align: center;
}

.button {
	width: 300px;
}
</style>
</head>
<body>
	<div class="titleArea">
		<h1>Join</h1>
	</div>
	<div class="joinTable">
		<form class="joinForm" id="joinForm" method="post"
			action="<%=request.getContextPath()%>/moosung/join_action.jsp">
			<table>
				<tbody>
					<tr>
						<th>이메일</th>
						<td><input type="text" id="email" name="email"><span
							id="emailCheck"></span></td>
					</tr>
					<tr>
						<th>비밀번호<span>(영문 대소문자/숫자/특수문자를 최소 1개 이상 조합, 10자~16자)</span>
						</th>
						<td><input type="password" id="password" name="password"><span
							id="pwCheck"></span></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="passwordCheck"
							name="passwordCheck"><span id="rePwCheck"></span></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name"><span
							id="nameCheck"></span></td>
					</tr>
					<tr>
						<th>휴대전화<span>(000-0000-0000 형식으로 입력해주세요)</span></th>
						<td><input type="text" id="phone" name="phone"><span
							id="phoneCheck"></span></td>
					</tr>
				</tbody>
			</table>
			<div class="joinButton">
				<button type="submit" class="button">Join</button>
			</div>
		</form>
	</div>

	<script type="text/javascript">
		$("#email").focus();
		$(document).ready(function() {

		});
		$("#joinForm")
				.submit(
						function() {
							var submitResult = true;

							var emailReg = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
							if ($("#email").val() == "") {
								$("#emailCheck").html("(이메일을 입력해주세요)");
								submitResult = false;
							} else if (!emailReg.test($("#email").val())) {
								$("#emailCheck").html("(이메일 형식에 맞게 입력해주세요)");
								submitResult = false;
							}

							var passwordReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,16}$/;
							if ($("#password").val() == "") {
								$("#pwCheck").html("(비밀번호를 입력해주세요)");
								submitResult = false;
							} else if (!passwordReg.test($("#password").val())) {
								$("#pwCheck").html("(비밀번호 형식에 맞게 입력해주세요)");
								submitResult = false;
							}

							if ($("#password").val() != $("#passwordCheck")
									.val()) {
								$("#rePwCheck").html("(비밀번호와 일치하지 않습니다)");
								submitResult = false;
							}

							var nameReg = /^[가-힣]{2,10}|[a-zA-Z]{2,50}$/;
							if ($("#name").val() == "") {
								$("#nameCheck").html("(이름을 입력해주세요)");
								submitResult = false;
							} else if (!nameReg.test($("#name").val())) {
								$("#nameCheck").html("(유효한 이름이 아닙니다)");
								submitResult = false;
							}

							var phoneReg = /^\d{2,3}-\d{3,4}-\d{4}$/;
							if ($("#phone").val() == "") {
								$("#phoneCheck").html("(전화번호를 입력해주세요)");
								submitResult = false;
							} else if (!phoneReg.test($("#phone").val())) {
								$("#phoneCheck").html("(올바른 전화번호를 입력해주세요)");
								submitResult = false;
							}

							return submitResult;
						});
	</script>
</body>
</html>