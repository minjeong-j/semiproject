<%@page import="dao.MemberDAO"%>
<%@page import="dao.OrdersDetailDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.OrdersDAO"%>
<%@page import="dao.AddressDAO"%>
<%@page import="dto.AddressDTO"%>
<%@page import="dto.OrdersDetailDTO"%>
<%@page import="dto.OrdersDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<%
if (request.getMethod().equals("GET")) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + request.getContextPath() + "/index.jsp'");
	out.println("</script>");
	return;
}

request.setCharacterEncoding("UTF-8");	

String email = loginMember.getEmail();
String address_id = request.getParameter("address_id");
String post_code = request.getParameter("post_code");
String road_address = request.getParameter("road_address");
String detail_address = request.getParameter("detail_address");

AddressDTO address = new AddressDTO();
OrdersDTO order = new OrdersDTO();
List<OrdersDetailDTO> orderDetaillist = new ArrayList<OrdersDetailDTO>();
OrdersDetailDTO orderDetail = new OrdersDetailDTO();
MemberDTO member = new MemberDTO();

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

order.setEmail(email);
order.setAddress_id(address_id);
OrdersDAO.getDAO().insertOrders(order);

String orders_idx= OrdersDAO.getDAO().selectOrderEmail(email).getIdx();
String[] pr = request.getParameterValues("price_post");
String[] q = request.getParameterValues("quantity_post");
String[] pidx = request.getParameterValues("productIdx_post");
int[] quantity = new int[q.length];
int[] price = new int[pr.length];

for(int i=0;i<pr.length;i++){
	quantity[i] = Integer.parseInt(q[i]);
	price[i] = Integer.parseInt(pr[i]);
	orderDetail.setOrders_idx(orders_idx);
	orderDetail.setProduct_idx(pidx[i]);
	orderDetail.setPrice(price[i]);
	orderDetail.setQuantity(quantity[i]);
	
	OrdersDetailDAO.getDAO().insertOrdersDetail(orderDetail);
}

member = MemberDAO.getDAO().selectMember(email);
int pay = member.getTotal_pay();
String total_pay = request.getParameter("total_call");
pay+=Integer.parseInt(total_pay);
member.setTotal_pay(pay);
MemberDAO.getDAO().updateMember(member);

out.println("<script type='text/javascript'>");
out.println("alert('주문이 완료되었습니다!')");
out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=moonhee&work=order_complete'");
out.println("</script>");
%>