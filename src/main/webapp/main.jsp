<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, dto.ProductDTO, dto.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>메인페이지</title>
</head>
<body>

  <%--헤더 --%>
  <%@ include file="headerfooter/header.jsp" %>
  
  <main>
    <h1>메인화면입니다.</h1>
    <%--로그인 유저 환영인사 --%>
    <mytag:userHello user="${user}" userName="${userName}"></mytag:userHello>
    <%--상품 검색 --%>
    <mytag:search page="MAIN"></mytag:search>
    <%--상품 출력 및 담기, 상세 정보보기 --%>
	<mytag:mainProductList datas="${datas}"></mytag:mainProductList>
  </main>
  
  <%--푸터 --%>
  <%@ include file="headerfooter/footer.jsp" %>
</body>
</html>