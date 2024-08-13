<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.HashMap, dto.ProductDTO, java.util.Map.Entry"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
  <%@ include file="headerfooter/header.jsp" %>
  <main>
 	<form action="ctrl.jsp" method="POST">
	<h2>장바구니 목록</h2>
	<ol>
		<%--장바구니 목록 출력 --%>
		<mytag:cartList cart="${cart}"></mytag:cartList>
	</ol>
	</form>
	<form action="ctrl.jsp" method="POST">
	 	<input type="hidden" name="action" value="BUYCART">
		 <br><button>장바구니 상품 전체 구매하기</button>
	</form>
  </main>
<%@ include file="headerfooter/footer.jsp" %>
</body>
</html>