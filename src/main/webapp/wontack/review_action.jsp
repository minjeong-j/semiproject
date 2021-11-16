<%@page import="dto.MemberDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dao.ProductDAO"%>
<%@page import="dto.ProductDTO"%>
<%@page import="dto.PostDTO"%>
<%@page import="dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	

	String saveDirectory=request.getServletContext().getRealPath("/wontack/reviewImage");

	MemberDTO member = (MemberDTO)session.getAttribute("loginMember");

	//멀티파트폼데이터 리퀘스트
	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());
	
	//문의 페이지에서 제품 선택한 값
	String productName = multipartRequest.getParameter("product");
	
	//가져온 값으로 테이블 행 검색해 저장	
	ProductDTO product = ProductDAO.getDAO().selectProductName(productName);
	
	//Product 테이블의 IDX는 Post 테이블의 Product_IDX와 같다
	String reviewProductIdx = product.getIdx();
	
	// DTO 인스턴스 생성 후 값 입력
	PostDTO post = new PostDTO();
	
	// 어느 관리자인지 인스턴스 DTO 필요
	String idx=multipartRequest.getParameter("TEST");
	String kinds_post="REVIEW";
	String email=member.getEmail();
	String product_idx=reviewProductIdx;
	String title=multipartRequest.getParameter("reviewTitle").replace("<", "&lt;").replace(">", "&gt;").replaceAll("\r\n", "<br>");
	String content=multipartRequest.getParameter("reviewContent").replace("<", "&lt;").replace(">", "&gt;").replaceAll("\r\n", "<br>");
	String imgSource=multipartRequest.getFilesystemName("imgSource");
	
	post.setIdx(idx);
	post.setKinds_post(kinds_post);
	post.setEmail(email);
	post.setProduct_idx(product_idx);
	post.setTitle(title);
	post.setContent(content);
	post.setImg_source(imgSource);
	
	PostDAO.getDAO().insertPost(post);
	
	out.println("<script type='text/javascript'>");
	out.println("location.href='"+request.getContextPath()+"/index.jsp?workgroup=wontack&work=review';");
	out.println("</script>");
%>