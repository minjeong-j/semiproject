<%@page import="dto.PostDTO"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	request.setCharacterEncoding("utf-8");

	PostDTO postModify = PostDAO.getDAO().selectPost(request.getParameter("postIdx"));

	// DTO 인스턴스 생성 후 값 입력
	PostDTO post = new PostDTO();
	
	// 어느 관리자인지 인스턴스 DTO 필요
	String idx=postModify.getIdx();

	post.setIdx(idx);
	post.setTitle(request.getParameter("noticeTitle").replace("<", "&lt;").replace(">", "&gt;").replaceAll("\r\n", "<br>"));
	post.setContent(request.getParameter("noticeContent").replace("<", "&lt;").replace(">", "&gt;").replaceAll("\r\n", "<br>"));
	
	PostDAO.getDAO().updatePost(post);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=wontack&work=notice';");
	out.println("</script>");
%>