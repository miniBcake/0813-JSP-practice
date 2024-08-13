<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ attribute name="page" %>
 <form action="ctrl.jsp" method="GET">
    <input type="hidden" name="action" value="${page}">
    <select name="type">
    	<option>상품명</option>
    	<option>판매자</option>
    </select>
    <input type="text" name="searchKeyword" placeholder="검색어를 입력하세요.">
    <input type="submit" value="검색">
 </form>