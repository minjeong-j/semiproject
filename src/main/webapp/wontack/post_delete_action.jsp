<%@page import="dto.PostDTO"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if (request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='" + request.getContextPath() + "/index.jsp'");
		out.println("</script>");
		return;
	}

	PostDTO post = PostDAO.getDAO().selectPost(request.getParameter("postIdx"));

	PostDAO.getDAO().deletePost(request.getParameter("postIdx"));
	
	if(post.getKinds_post().equals("NOTICE")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=wontack&work=notice';");
		out.println("</script>");
	
	} else if(post.getKinds_post().equals("QUESTION")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=wontack&work=question';");
		out.println("</script>");
	
	} else if(post.getKinds_post().equals("REVIEW")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=wontack&work=review';");
		out.println("</script>");
	
	} else {
		out.println("<script type='text/javascript'>");
		out.println("location.href='" + request.getContextPath() + "/index.jsp'");
		out.println("</script>");
		return;
		
	}

%>