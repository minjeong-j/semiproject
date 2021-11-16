<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- <%@include file="/security/admin_check.jspf" %> --%>
<%	
	String idx=request.getParameter("idx");
	
	ProductDAO.getDAO().deleteProduct(idx);
	
	out.println("<script type='text/javascript'>");
	out.println("alert('제품이 삭제되었습니다.')");
	out.println("alert('"+idx+"')");
	out.println("location.href = '"+request.getContextPath() + "/admin_index.jsp?workgroup=admin&work=product_manager';");
	out.println("</script>");
%>