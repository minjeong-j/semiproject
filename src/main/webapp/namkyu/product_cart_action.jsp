<%@page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@page import="dao.CartDAO"%>
<%@page import="dto.CartDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/security/login_check.jspf"%>
<%
	String memberEmail = loginMember.getEmail();

	
 	 if (request.getMethod().equals("GET")) {
		out.println("<script type='text/javascript'>");
		out.println("location.href='" + request.getContextPath() + "/index.jsp?workgroup=namkyu&work=product'");
		out.println("</script>");
		return;
 	} 
		request.setCharacterEncoding("UTF-8");	
		/* String email= request.getParameter("email"); */
		/* String email= request.getParameter("moo_sung@naver.com"); */
		String productIdx = request.getParameter("productIdx");
		/* String idx= request.getParameter("idx"); */
		String price = request.getParameter("price");
		int quantity = Integer.parseInt(request.getParameter("quantity"));

		
		CartDTO cart= new CartDTO();
		cart.setCart_idx(memberEmail); 
		cart.setEmail(memberEmail);
		cart.setProduct_idx(productIdx);
		cart.setQuantity(quantity);
		CartDAO.getDAO().insertCart(cart);
				
		
 		out.println("<script type='text/javascript'>");
		/* String str = (String)(session.getAttribute("moveCart")); */
		/* if(str!=null){
			session.removeAttribute("moveCart");
			out.println("alert('장바구니로 이동되었습니다.')");	
		} else{
			str = "";
		}
		
		if(str.equals("y")){
			out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=minjeong&work=cart'");
		} else{
			session.removeAttribute("moveCart");
		}
		*/
		
		/* out.println(request.getHeader("referer"));
		System.out.println(request.getHeader("referer")); */
		
		
		out.println("if(confirm('장바구니로 이동하시겠습니까?')) { ");
		out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=minjeong&work=cart'");
		out.println(" } else { ");
	 	out.println("history.back()");		
		out.println(" } ");
		
		
	 /* 		if(confrim("장바구니로 이동하시겠습니까?")) {
	 			response.sendRedirect("request.getContextPath()/index.jsp?workgroup=minjeong&work=cart");
	 		} else {
	 			response.sendRedirect("request.getContextPatt()/index.jsp?workgroup=namkyu&work=product&product="+productIdx);
	 		}
		 */
		/* out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=minjeong&work=cart'"); */
		out.println("</script>"); 		 
%>