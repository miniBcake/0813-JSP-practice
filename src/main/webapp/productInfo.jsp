<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, dto.ProductDTO, dto.MemberDTO"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="css/common.css">
</head>
<body>
<%--헤더 --%>
<%@ include file="headerfooter/header.jsp" %>

  <main>
    <h1>제품 상세화면</h1>
    <%--유저인사--%>
    <mytag:userHello></mytag:userHello>
    <%--상품 정보 출력, 상세 정보 보고있는 물품 담기 --%>
	<mytag:productInfo datas="${datas}"></mytag:productInfo>
  </main>
 
 <%--푸터 --%>
<%@ include file="headerfooter/footer.jsp" %>
</body>
</html>