<%@page import="dto.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dto.CartDTO"%>
<%@page import="dao.CartDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf" %>
<%-- 주문 --%>
<%
if (request.getMethod().equals("GET")) {
	out.println("<script type='text/javascript'>");
	out.println("location.href='" + request.getContextPath() + "/index.jsp'");
	out.println("</script>");
	return;
}
request.setCharacterEncoding("UTF-8");

String email = loginMember.getEmail();
CartDAO.getDAO().clearCart(email);

String[] cartIdx = request.getParameterValues("checkP");
String[] q = request.getParameterValues("countInput");
String[] productIdx = request.getParameterValues("productIdx");
int[] quantity = new int[q.length];

ProductDTO product = new ProductDTO();
CartDTO cart = new CartDTO();

for(int i=0;i<cartIdx.length;i++){
	quantity[i] = Integer.parseInt(q[i]);
	cart.setEmail(email);
	cart.setProduct_idx(productIdx[i]);
	cart.setQuantity(quantity[i]);
	CartDAO.getDAO().insertCart(cart);
}
out.println("<script type='text/javascript'>");
out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=moosung&work=order'");
out.println("</script>");
%>
