<%@page import="java.util.List"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

	if(request.getMethod().equals("GET")) {
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=chanhyuk&work=login';");
		out.println("</script>");
		return;
	}

String name = request.getParameter("name");
String phone = request.getParameter("phone");

MemberDTO member = MemberDAO.getDAO().returnEmail(phone);

if (member == null) {
	out.println("<script type='text/javascript'>");
	out.println("alert('존재하지 않는 이메일입니다.')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=searchE';");
	out.println("</script>");
	return;
}

if (member.getPhone().equals(phone)) {
	out.println("<script type='text/javascript'>");
	out.println("alert('" + member.getEmail() + "입니다.')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=login';");
	out.println("</script>");
	return;
}
%>