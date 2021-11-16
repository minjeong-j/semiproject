<%@page import="util.Utility"%>
<%@page import="dao.MemberDAO"%>
<%@page import="dto.MemberDTO"%>
<%@page import="dao.AddressDAO"%>
<%@page import="dto.AddressDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
MemberDTO loginMember=(MemberDTO)session.getAttribute("loginMember");

if (request.getMethod().equals("GET")) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + request.getContextPath() + "/index.jsp'");
	out.println("</script>");
	return;
}
request.setCharacterEncoding("UTF-8");
String email = request.getParameter("email");
String password = Utility.encrypt(request.getParameter("password"));
String name = request.getParameter("name").trim();
String address_id = request.getParameter("address_id");
String phone = request.getParameter("phone");
String post_code = request.getParameter("post_code");
String road_address = request.getParameter("road_address");
String detail_address = request.getParameter("detail_address");
String member_since = loginMember.getMember_since();

if(address_id.equals("")){
	address_id="최근 배송지";
}

MemberDTO member = new MemberDTO();
member.setEmail(email);
member.setPassword(password);
member.setName(name);
member.setPhone(phone);
member.setAddress_id(address_id);
member.setMember_since(member_since);

MemberDAO.getDAO().updateMember(member);

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

out.println("<script type='text/javascript'>");
out.println("alert('회원 정보가 변경되었습니다.')");
out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=moosung&work=profile'");
out.println("</script>");
%>