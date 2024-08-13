<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, dto.ProductDTO, dto.MemberDTO, dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
  <link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
  <%@ include file="headerfooter/header.jsp" %>
 
 <main>
 <h2>관리자 페이지입니다.</h2>
 <%--상품 추가 --%>
<mytag:addProduct userList="${userList}"></mytag:addProduct>
<h3>상품 삭제하기</h3>
<%--상품 검색탭 --%>
<mytag:search page="ADMIN"></mytag:search>
<mytag:deleteProduct datas="${datas}"></mytag:deleteProduct>
 </main>
 <%@ include file="headerfooter/footer.jsp" %>
</body>
</html>