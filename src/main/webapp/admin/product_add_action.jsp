<%@page import="java.io.File"%>
<%@page import="dao.ProductDAO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="dto.ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String saveDirectory=request.getServletContext().getRealPath("/images");
	System.out.println(saveDirectory);

	MultipartRequest multipartRequest=new MultipartRequest(request, saveDirectory
		, 30*1024*1024, "utf-8", new DefaultFileRenamePolicy());

	String productIdx=multipartRequest.getParameter("productIdx");
	String productName=multipartRequest.getParameter("productName");
	String mainImage=multipartRequest.getFilesystemName("mainImage");
	String mainImage1=multipartRequest.getFilesystemName("mainImage1");
	String mainImage2=multipartRequest.getFilesystemName("mainImage2");
	String mainImage3=multipartRequest.getFilesystemName("mainImage3");
	String mainImage4=multipartRequest.getFilesystemName("mainImage4");
	int productPrice=Integer.parseInt(multipartRequest.getParameter("productPrice"));
	String category=multipartRequest.getParameter("category");
	int productStock=Integer.parseInt(multipartRequest.getParameter("productStock"));
	
	String imagelink = mainImage+","+mainImage1+","+mainImage2+","+mainImage3+","+mainImage4;
	
	ProductDTO product=new ProductDTO();
	product.setIdx(productIdx);
	product.setName(productName);
	product.setImg_source(imagelink);
	product.setPrice(productPrice);
	product.setKinds(category);
	product.setStock(productStock);
	
	if(ProductDAO.getDAO().selectProduct(productIdx)!=null){
		new File(saveDirectory, mainImage).delete();
		out.println("<script type='text/javascript'>");
		out.println("alert('이미 등록된 제품코드입니다..')");
		out.println("location.href='"+request.getContextPath()+"/admin_index.jsp?workgroup=admin&work=product_manager';");
		out.println("</script");
	}
	
	ProductDAO.getDAO().insertProduct(product);

	out.println("<script type='text/javascript'>");
	out.println("alert('제품이 추가되었습니다.')");
	out.println("location.href='"+request.getContextPath()+"/admin_index.jsp?workgroup=admin&work=product_manager';");
	out.println("</script");

%>