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
String email = request.getParameter("email");
String address_id = request.getParameter("address_id");
String post_code = request.getParameter("post_code");
String road_address = request.getParameter("road_address");
String detail_address = request.getParameter("detail_address");

AddressDTO address = new AddressDTO();

address.setEmail(email);
address.setId(address_id);
address.setPost_code(post_code);
address.setRoad_address(road_address);
address.setDetail_address(detail_address);

if(AddressDAO.getDAO().selectAddress(address_id)!=null){
	AddressDAO.getDAO().updateAddress(address);	
} else{
	AddressDAO.getDAO().insertAddress(address);	
}

%>