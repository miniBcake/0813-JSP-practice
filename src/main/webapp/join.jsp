<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <form action="ctrl.jsp" method="POST" class="form-center">
  	<input type="hidden" name="action" value="JOIN_TRY">
	<h2>회원가입</h2> 
	<div>이름 <span>(필수)</span></div>
	<input type="text" name="name" placeholder="이름을 입력하세요." required><br>
	<div>아이디 <span>(필수)</span></div>
	<input type="text" name="mid" placeholder="아이디를 입력하세요." required><br>
	<div>비밀번호 <span>(필수)</span></div>
	<input type="password" name="password" placeholder="비밀번호를 입력하세요." required><br>
	<input type="submit" value="회원가입">
	<button type="button" class="not-import" onclick = "location.href = 'controller.jsp'">취 소</button>
 </form>
</main>
<%@ include file="headerfooter/footer.jsp" %>
</body>
</html>