<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("UTF-8");

	String option=request.getParameter("option");	

	MemberDTO member=new MemberDTO();
	member.setStatus(option);
	
	MemberDAO.getDAO().updateMember(member);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/admin_index.jsp?workgroup=admin&work=member_manager'");
	out.println("</script>");
%>