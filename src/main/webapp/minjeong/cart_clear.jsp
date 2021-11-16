<%@page import="java.util.List"%>
<%@page import="dao.CartDAO"%>
<%@page import="dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%--장바구니 전체삭제--%>
<%-- 이메일을 전달받아 cart 테이블에 저장된 해당 이메일의 cart정보를 삭제하고
장바구니목록 출력페이지로 이동하는 JSP 문서 --%>
<%
	request.setCharacterEncoding("UTF-8");

	String email = loginMember.getEmail();

	List<CartDTO> cart=CartDAO.getDAO().selectAllCartList(email);
	CartDAO.getDAO().clearCart(email);

	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=minjeong&work=cart';");
	out.println("</script>");	
%>
