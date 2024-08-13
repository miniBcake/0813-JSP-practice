<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ attribute name="user" %>
<%@ attribute name="userName" %>
<c:if test="${not empty user}"> 
    <h3 class='login'>${userName}님 안녕하세요.</h3>
</c:if>