<%@page import="dto.MemberDTO"%>
<%@page import="dao.ReplyDAO"%>
<%@page import="dto.ReplyDTO"%>
<%@page import="dto.PostDTO"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	request.setCharacterEncoding("utf-8");

	MemberDTO member = (MemberDTO)session.getAttribute("loginMember");
	
	// DTO 인스턴스 생성 후 값 입력
	ReplyDTO reply = new ReplyDTO();
	
	// 어느 관리자인지 인스턴스 DTO 필요
	String postIdx = request.getParameter("postIdx");
	String email = member.getEmail();
	String content=request.getParameter("replyContent").replace("<", "&lt;").replace(">", "&gt;").replaceAll("\r\n", "<br>");
	
	reply.setPost_idx(postIdx);
	reply.setEmail(email);
	reply.setContent(content);
	
	ReplyDAO.getDAO().insertReply(reply);
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=wontack&work=question_detail&pageNum="+request.getParameter("pageNum")+"&postIdx="+reply.getPost_idx()+"';");
	out.println("</script>");
%>