<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<%
String memberEmail = loginMember.getEmail();
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Profile</title>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
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

table input:focus {
	outline: none;
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

label {
	padding: 4px;
	margin: 10px 0;
}

table input {
	font-size: 18px;
	border:none;
	padding-left: 1px;
	line-height: 20px;
	min-width: 300px;
	cursor: not-allowed;
}
input.writable{
	cursor: text;
	border-bottom: 1px solid rgb(207, 207, 207);
}
.addr {
	padding: 5px 0;
}

button {
	width: 120px;
	height: 25px;
	margin: auto;
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

#btn {
	text-align: right;
	margin: 30px 166px 0 0;
}

#btn button {
	width: 100px;
	height: 30px;
	background-color: rgb(207, 207, 207);
	color: rgb(13, 13, 13);
}

#btn button:hover {
	cursor: pointer;
	background-color: rgb(13, 13, 13);
	color: rgb(207, 207, 207);
	border: 1px solid rgb(207, 207, 207);
	background-color: rgb(13, 13, 13);
}

#address_id, #road_address {
	margin: 10px 0;
}

span {
	opacity: 0.8;
}
</style>
</head>
<body>
	<div class="titleArea">
		<h1>Profile</h1>
		<br>
	</div>
	<div id="profile">
		<form class="profileForm" id="profileForm" method="post"
			action="<%=request.getContextPath()%>/moosung/profile_action.jsp">
			<table>
				<caption>프로필</caption>
				<colgroup>
					<col style="width: 150px;">
					<col style="width: 1000px;">
				</colgroup>
				<tbody>
					<tr>
						<th>이메일</th>
						<td><input type="text" id="email" name="email"
							readonly="readonly" value="<%=memberEmail%>"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="password" name="password" class="writable"><span
							id="pwCheck"></span></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td><input type="password" id="passwordCheck" class="writable"
							name="passwordCheck"><span id="rePwCheck"></span></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" id="name" name="name" class="writable"><span
							id="nameCheck"></span></td>
					</tr>
					<tr>
						<th>주소</th>
						<td><input type="text" id="address_id" name="address_id" class="writable"
							placeholder="주소록에 저장할 이름을 입력하세요">
							<button type="button" id=address_list>주소록 불러오기</button> <br>
							<input type="text" id="post_code" name="post_code" class="writable" style="cursor: not-allowed;"
							readonly="readonly">
							<button type="button" id=address_search	 onclick="sample4_execDaumPostcode()">새 주소 입력하기</button><br>												
							<input type="text" id="road_address" name="road_address" class="writable" style="cursor: not-allowed;"
							readonly="readonly"><br>
							<input type="text" id="detail_address" name="detail_address" class="writable"
							placeholder="상세 주소를 입력해주세요"></td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td><input type="text" id="phone" name="phone" class="writable"><span
							id="phoneCheck"></span></td>
					</tr>
				</tbody>
			</table>
			<div id="btn">
				<button type="submit">변경완료</button>
				<button type="button" id="quit">회원탈퇴</button>
			</div>
		</form>
	</div>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {

		});
		$("#profileForm").submit(function() {
			var submitResult = true;

			var passwordReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,16}$/;
			if ($("#password").val() == "") {
				$("#pwCheck").html("(비밀번호를 입력해주세요)");
				submitResult = false;
			} else if (!passwordReg.test($("#password").val())) {
				$("#pwCheck").html("(비밀번호 형식에 맞게 입력해주세요)");
				submitResult = false;
			}
			if ($("#password").val() != $("#passwordCheck").val()) {
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
		
		$("#address_list").click(function() {
			window.open("<%=request.getContextPath()%>/moosung/address_list.jsp"
					,"주소록","width=1000,height=800,left=100,top=50");
		});
		
		function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	            	var roadAddr = data.roadAddress;
	            	document.getElementById('post_code').value = data.zonecode;
	                document.getElementById("road_address").value = roadAddr;
	            }
	        }).open();
	    }
		
		$("#quit").click(function() {
			if(window.confirm("정말 탈퇴하시겠습니까?")) {
				location.href = "<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=quit_member_action";
			}
		});
	</script>
</body>
</html>