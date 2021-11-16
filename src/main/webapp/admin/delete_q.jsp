<%@page import="java.util.List"%>
<%@page import="dao.PostDAO"%>
<%@page import="dto.PostDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");	
	
	String idx = request.getParameter("idx"); 
	
	PostDAO.getDAO().deletePost(idx);

	out.println("<script type='text/javascript'>");	
	out.println("location.href='"+request.getContextPath()+"/admin_index.jsp?workgroup=admin&work=question_manager';");
	out.println("</script>");	
%>