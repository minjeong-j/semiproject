<%@page import="java.util.ArrayList"%>
<%@page import="dto.CartDTO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CartDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
</head>
<!-- left side bar -->
	<div id="left_bar">
      <div class="logo">
        <h1><a href="<%=request.getContextPath()%>/index.jsp">nookyoon</a></h1>
       </div>

 <div class="left_navi1">
        <ul>
          <li><a href="index.jsp?workgroup=moosung&work=main&new=NEW">New</a></li>
          <li><a href="index.jsp?workgroup=moosung&work=main&best=BEST">Best 15</a></li>
          <li><a href="index.jsp?workgroup=moosung&work=main&category=RING">Ring</a></li>
          <li><a href="index.jsp?workgroup=moosung&work=main&category=EARRING">Earring</a></li>
          <li><a href="index.jsp?workgroup=moosung&work=main&category=NECKLACE">Necklace</a></li>
          <li><a href="index.jsp?workgroup=moosung&work=main&category=BRACELET">Bracelet</a></li>
          <li><a href="index.jsp?workgroup=moosung&work=main&category=ANKLET">Anklet</a></li>
        </ul>
      </div>

      <div class="left_navi2">
        <ul>
          <li><a href="index.jsp?workgroup=wontack&work=notice">Notice</a></li>
          <li><a href="index.jsp?workgroup=wontack&work=question">Question</a></li>
          <li><a href="index.jsp?workgroup=wontack&work=review">Review</a></li>
        </ul>
      </div>
    </div>

<!-- right side bar -->
  <div id="right_bar">
    <div class="search">
      <fieldset>
        <input id="keyword" type="text">
        <img onclick="search()" src="<%=request.getContextPath()%>/images/btn_image/searchBtn.png">
      </fieldset>
    </div>

    <div class="right_name">
        <a id = "cart" href="<%=request.getContextPath()%>/index.jsp?workgroup=minjeong&work=cart" style="font-size: 16px">CART - 0</a>
    </div>
    <div class="right_naiv" id="right_navi">
    <% if(loginMember==null) { %>
      <ul>
        <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=login">Log in</a></li>
        <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=join">Join</a></li>
        <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=login">Order</a></li>
        <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=myPage">My Page</a></li>
      </ul>
      <% } else { %>
      <ul>
        <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=profile">Profile</a></li>
        <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=chanhyuk&work=logout_action">Log Out</a></li>
        <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=order">Order</a></li>
        <li><a href="<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=myPage">My Page</a></li>
        <% if(loginMember.getGrade().equals("00")) { %>
        <li><a href="<%=request.getContextPath()%>/admin_index.jsp?workgroup=admin&work=admin_main">Admin</a></li>
        <% } %>
      </ul>      	
      <% } %>
    </div>
  </div>
  
  <body>
  <script type="text/javascript">
  <% if(loginMember!=null){%>
  	$("document").ready(function() {
  		<%
  		String email = loginMember.getEmail();
  		List<CartDTO> cartlist = new ArrayList<CartDTO>();
  		cartlist = CartDAO.getDAO().selectAllCartList(email);
  		%>
		$("#cart").text("CART - <%=cartlist.size() %>");
	});
  <%} %>
  	function search() {
  		var key = document.getElementById("keyword").value;
  		
  		if(key == null || key.trim() == ""){
  			alert("검색어를 입력해주세요.");
  			return;
  		}
  		location.href = "<%=request.getContextPath()%>/index.jsp?workgroup=moosung&work=main&keyword="+key;
	}
  </script>
  </body>
  
  </html>