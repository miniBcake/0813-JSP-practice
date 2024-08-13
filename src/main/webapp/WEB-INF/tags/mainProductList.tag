<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="datas" type="java.util.ArrayList" %>
<h3>상품 목록</h3>
	<form action="ctrl.jsp" method="POST">
		<input type="hidden" name="action" value="ADDCART">
		<ol>
			<c:if test="${empty datas}">
	    		<div class='result-none'>상품이 없습니다.</div>
	    	</c:if>
			<c:if test="${not empty datas}">
				<c:forEach var="data" items="${datas}">
					<li>
						<c:if test="${data.cnt <= 0}">
							<input type='checkbox' disabled>
							<strong>[품절]</strong> [상품명] ${data.name}
						</c:if>
						<c:if test="${data.cnt > 0}">
							<input type='checkbox' name='product' value='${data.num}'>
							<a href='ctrl.jsp?action=PRODUCT&num=${data.num}'>
							[상품명] ${data.name}[수량] ${data.cnt}개 [가격] ${data.price}원</a>
						</c:if>
					</li>
	    		</c:forEach>
				<br><button>물건 담기</button>
	    	</c:if>
		</ol>
	</form>