<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="userList" type="java.util.ArrayList" %>
 <form action="ctrl.jsp" method="POST">
<h3>상품 추가하기</h3>
	<c:if test="${empty userList}">
		등록가능한 판매자가 없습니다.
	</c:if>
	<c:if test="${not empty userList}">
		<input type="hidden" name="action" value="INSERTPRODUCT">
		 상품명 <input type="text" name="name" placeholder="상품명을 입력하세요." required> <br>
		 상품설명 <input type="text" name="details" placeholder="상품설명을 입력하세요." required> <br>
		 상품개수 <input type="number" name="cnt" min="0" placeholder="상품개수를 설정하세요." value="0"> <br>
		 상품가격 <input type="number" name="price" min="0" placeholder="상품가격을 입력하세요." required> <br>
		 판매자 <select name='seller' required>
		 <c:forEach var="user" items="${userList}">
		 	<option value="${user.mid}">${user.name}</option>
		 </c:forEach>
	 	</select> <br>
		<button>상품추가하기</button>
	</c:if>
 </form>