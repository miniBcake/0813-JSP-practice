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
 	<input type="hidden" name="action" value="LOGIN_TRY">
	<h2>로그인</h2> 
	<div>아이디</div>
	<input type="text" name="mid" placeholder="아이디를 입력하세요." required><br>
	<div>비밀번호</div>
	<input type="password" name="password" placeholder="비밀번호를 입력하세요." required><br>
	<input type="submit" id="login"  value="로그인">
<!-- 	<button type="button" class="not-import" onclick = "location.href = 'join.jsp'">회원가입</button> -->
 </form>
</main>
<%@ include file="headerfooter/footer.jsp" %>
</body>
</html>