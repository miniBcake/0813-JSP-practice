<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ attribute name="cart" type="java.util.HashMap" %>
<c:if test="${empty cart}">
	장바구니가 비었습니다.
	<br><button type='button' onclick="location.href='ctrl.jsp?action=MAIN'">상품 추가하러가기</button>
</c:if>
<c:if test="${not empty cart}">
	<input type='hidden' name='action' value='DELETECART'>
	<c:forEach var="data" items="${cart}">
		<li>
			<input type='checkbox' name='product' value='${data.key.num}'>
			<a href='ctrl.jsp?action=PRODUCT&num=${data.key.num}'>
			[상품명] ${data.key.name} [가격] ${data.key.price}원</a> 
			[구매 수량] ${data.value}개
		</li>
	</c:forEach>
	<button>선택 상품 장바구니에서 삭제하기</button>
</c:if>