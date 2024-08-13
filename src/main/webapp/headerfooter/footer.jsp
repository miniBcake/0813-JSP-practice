<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<body>
  <footer> 
  <section>
  	<c:if test="${role eq 'ADMIN'}">
  		<a href='ctrl.jsp?action=ADMIN'>⚙️관리자페이지⚙️</a>
  	</c:if>
  </section>
  </footer>
</body>
</html>