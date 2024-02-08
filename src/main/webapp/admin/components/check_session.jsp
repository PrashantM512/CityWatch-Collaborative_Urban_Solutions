<%@page import="com.city.watch.entity.User" %>
	<%
	User userSess=(User)session.getAttribute("user");
	if(userSess==null){
		response.sendRedirect("../login.jsp");
	}
	%>