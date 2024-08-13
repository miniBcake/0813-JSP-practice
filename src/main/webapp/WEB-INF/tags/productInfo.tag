<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="datas" type="java.util.ArrayList" %>
	<form action="ctrl.jsp" method="POST">
		<input type="hidden" name="action" value="ADDCART">
		<h3>상품 정보</h3>
	    <c:if test="${not empty data}">
	    	<div class='center'>[상품명] ${data.name}</div>
			<div class='center'>[수량] ${data.cnt}개</div>
			<div class='center'>[가격] ${data.price}원</div>
			<div class='center'>[판매자] ${data.seller}</div>
			<div class='center'>[상품 상세 정보] ${data.details}</div>
		    <c:if test="${not empty user}">
		    	<input type='hidden' name='product' value='${data.num}'>
		    	<br><button>물건 담기</button>
		    </c:if>
	    </c:if>
	    <c:if test="${empty data}">
	    	<div>상품 정보를 불러올 수 없습니다.</div>
	    </c:if>
	</form>