<%@page import="dto.MemberDTO"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dto.PostDTO"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	request.setCharacterEncoding("utf-8");

	MemberDTO member = (MemberDTO)session.getAttribute("loginMember");
	
	//문의 페이지에서 제품 선택한 값
	String productName = request.getParameter("product");
	
	//가져온 값으로 테이블 행 검색해 저장	
	ProductDTO product = ProductDAO.getDAO().selectProductName(productName);
	
	//Product 테이블의 IDX는 Post 테이블의 Product_IDX와 같다
	String questionProductIdx = product.getIdx();

	// DTO 인스턴스 생성 후 값 입력
	PostDTO post = new PostDTO();
	
	// 어느 관리자인지 인스턴스 DTO 필요
	
	String idx=request.getParameter("TEST");
	String kinds_post="QUESTION";
	String email=member.getEmail();
	String product_idx=questionProductIdx;
	String title=request.getParameter("questionTitle").replace("<", "&lt;").replace(">", "&gt;").replaceAll("\r\n", "<br>");
	String content=request.getParameter("questionContent").replace("<", "&lt;").replace(">", "&gt;").replaceAll("\r\n", "<br>");
	
	post.setIdx(idx);
	post.setKinds_post(kinds_post);
	post.setEmail(email);
	post.setProduct_idx(product_idx);
	post.setTitle(title);
	post.setContent(content);
	
	PostDAO.getDAO().insertPost(post);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=wontack&work=question';");
	out.println("</script>");
%>