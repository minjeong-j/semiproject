<%@page import="util.Utility"%>
<%@page import="dao.AddressDAO"%>
<%@page import="dto.AddressDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if (request.getMethod().equals("GET")) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + request.getContextPath() + "/index.jsp'");
	out.println("</script>");
	return;
}
request.setCharacterEncoding("UTF-8");
String id = request.getParameter("id");

AddressDAO.getDAO().deleteAddress(id);

out.println("<script type='text/javascript'>");
out.println("location.href='" + request.getContextPath() + "/moosung/address_list.jsp'");
out.println("</script>");

%>