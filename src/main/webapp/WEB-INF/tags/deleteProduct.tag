<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="datas" type="java.util.ArrayList" %>
 <form action="ctrl.jsp" method="POST">
	<input type='hidden' name='action' value='DELETEPRODUCT'>
	<ol>
		<c:if test="${empty datas}">
			<div class='result-none'>상품이 없습니다.</div>
		</c:if>
		<c:if test="${not empty datas}">
			<c:forEach var="data" items="${datas}">
			<li>
			 	<input type='checkbox' name='product' value='${data.num}'>
			 	<c:if test="${data.cnt <= 0}">
			 		<strong>[품절]</strong>
			 	</c:if>
			 	[상품명] ${data.name} [수량] ${data.cnt}개 [가격] ${data.price}원 [판매자] ${data.seller}
		 	</li>
			</c:forEach>
			<br><button>상품 삭제하기</button>
		</c:if>
	</ol>
 </form>