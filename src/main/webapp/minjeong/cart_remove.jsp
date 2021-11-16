<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@include file="/security/login_url.jspf" %> --%>
<%-- 선택삭제 --%>
<%
	request.setCharacterEncoding("UTF-8");	
	
	String[] checkP=request.getParameterValues("checkP");
	String[] cart = checkP[0].split(",");
	
	for(int i = 0;i<cart.length;i++){
		CartDAO.getDAO().deleteCart(cart[i]);
	}
	out.println("<script type='text/javascript'>");	
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=minjeong&work=cart';");
	out.println("</script>");	
%>