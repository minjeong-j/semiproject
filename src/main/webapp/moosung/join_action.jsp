<%@page import="util.Utility"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
if (request.getMethod().equals("GET")) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=moosung&work=join'");
	out.println("</script>");
	return;
}
request.setCharacterEncoding("UTF-8");
String email = request.getParameter("email");
String password = Utility.encrypt(request.getParameter("password"));
String name = request.getParameter("name").trim();
String phone = request.getParameter("phone");
String grade = "10";

MemberDTO member = new MemberDTO();
member.setEmail(email);
member.setPassword(password);
member.setName(name);
member.setPhone(phone);
member.setGrade(grade);

if (MemberDAO.getDAO().selectMember(email) != null) {
	out.println("<script type='text/javascript'>");
	out.println("alert('이미 가입된 이메일입니다. 비밀번호 찾기 페이지로 이동합니다.')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=searchP'");
	out.println("</script>");
} else {
	MemberDAO.getDAO().insertMember(member);

	out.println("<script type='text/javascript'>");
	out.println("alert('회원가입을 환영합니다! 로그인 페이지로 이동합니다.')");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=chanhyuk&work=login'");
	out.println("</script>");
}
%>