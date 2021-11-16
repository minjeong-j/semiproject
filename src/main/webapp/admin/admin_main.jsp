<%@page import="dto.MemberDTO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%--@include file="/security/admin_check.jspf" --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/common.css">
<link rel="icon" href="<%=request.getContextPath()%>/images/favicon.ico">
<style type="text/css">
/* CSS 작성 */
#contents {
	margin: 0 auto;
	padding: 130px 0 80px;
}

h1 {
	text-align: center;
}

.area {
	width: auto;
	padding: 120px 90px 480px;
	/* border: 0.5px solid  rgb(207, 207, 207); */
	margin-top: 100px;
}

.area p {
	font-size: 22px;
}

/* 메인 요소 */
.area_2 {
   display: flex;
   position:absolute;
   
}
.one {
   text-align:left;
   margin-left: 40px;
   line-height: 22px;
   /* float:left; */
}
.two {
   text-align:left;
   margin-left: 30px;
   line-height: 22px;
   /* float: right; */
}
.three {
   text-align:right;
   margin-left: 550px;
   line-height: 22px;
}
</style>
</head>
<body>
	<div class="manager">
		<h1>관리자</h1>
	</div>
	<div class="area">
		<p>&lt;관리자&gt;님 반갑습니다.</p>	
	</div>
	
	<div class="area_2">
      <div class="one">
             <ul>
           <li>Copyright © 김무성 Corp.</li>
            <li>All rights reserved.</li>
            </ul>
       </div>     
       <div class="two">
          <ul>
             <li>Mon-Fri 10:00-19:00</li>
               <li>Weekend, Holiday off</li>
           </ul>
       </div>
       <div class="three">
          <ul>
             <li>nookyoon</li>
               <li>모던 감성 악세서리 쇼핑몰</li>
           </ul>
       </div>
   </div>
</body>
</html>