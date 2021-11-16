<%@page import="dto.MemberDTO"%>
<%@page import="dto.PostDTO"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	request.setCharacterEncoding("utf-8");

	MemberDTO member = (MemberDTO)session.getAttribute("loginMember");

	// DTO 인스턴스 생성 후 값 입력
	PostDTO post = new PostDTO();
	
	String idx=request.getParameter("NOTICE");
	String kinds_post="NOTICE";
	String email=member.getEmail();
	String product_idx="RI43";
	String title=request.getParameter("noticeTitle").replace("<", "&lt;").replace(">", "&gt;").replaceAll("\r\n", "<br>");
	String content=request.getParameter("noticeContent").replace("<", "&lt;").replace(">", "&gt;").replaceAll("\r\n", "<br>");
	
	
	post.setIdx(idx);
	post.setKinds_post(kinds_post);
	post.setEmail(email);
	post.setProduct_idx(product_idx);
	post.setTitle(title);
	post.setContent(content);
	
	PostDAO.getDAO().insertPost(post);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=wontack&work=notice';");
	out.println("</script>");
%>