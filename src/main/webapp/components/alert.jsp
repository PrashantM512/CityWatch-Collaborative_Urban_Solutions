<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<c:if test="${not empty alertClass and not empty alertMessage}">
	<div class="alert ${alertClass} animate__animated animate__slideInDown"
		role="alert" style="z-index: 0;">${alertMessage}</div>
	<c:remove var="alertClass" scope="session" />
	<c:remove var="alertMessage" scope="session" />
</c:if>