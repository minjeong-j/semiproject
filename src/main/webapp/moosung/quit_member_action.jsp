<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@include file="/security/login_check.jspf"%>
<%
String email = loginMember.getEmail();

MemberDAO.getDAO().deleteMember(email);

out.println("<script type='text/javascript'>");
out.println("alert('회원탈퇴가 완료되었습니다.')");
out.println("location.href='" + request.getContextPath() + "/index.jsp'");
out.println("</script>");

%>