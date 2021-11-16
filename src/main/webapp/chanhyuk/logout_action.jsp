<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
session.removeAttribute("loginMember");

String url = (String) session.getAttribute("url");
if (url == null) {//메인페이지 이동
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=moosung&work=main';");
	out.println("</script>");
} else {//기존페이지로 이동
	session.removeAttribute("url");
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + url + "';");
	out.println("</script>");
}
%>