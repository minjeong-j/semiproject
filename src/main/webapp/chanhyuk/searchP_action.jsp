<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
if(request.getMethod().equals("GET")) {
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=chanhyuk&work=login';");
	out.println("</script>");
	return;
}


String email = request.getParameter("email");
String name = request.getParameter("name");
String phone = request.getParameter("phone");

MemberDTO member = new MemberDTO();
member = MemberDAO.getDAO().selectMember(email);

if (member == null) {
	out.println("<script type='text/javascript'>");
	out.println("alert('존재하지 않는 이메일입니다.')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=searchP';");
	out.println("</script");
	return;
} else if (!member.getName().equals(name)) {
	out.println("<script type='text/javascript'>");
	out.println("alert('존재하지 않는 이름입니다.')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=searchP';");
	out.println("</script");
	return;
} else if (!member.getPhone().equals(phone)) {
	out.println("<script type='text/javascript'>");
	out.println("alert('존재하지 않는 전화번호입니다.')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=searchP';");
	out.println("</script");
	return;
}

if (member.getEmail().equals(email) && member.getName().equals(name) && member.getPhone().equals(phone)) {
	MemberDAO.getDAO().resetPassword(member);
	out.println("<script type='text/javascript'>");
	out.println("alert('초기화된 비밀번호는 1q2w3e4r!@ 입니다. 반드시 마이페이지에서 변경해 주세요')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=login';");
	out.println("</script>");
	return;
}
%>