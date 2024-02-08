<%@page import="com.city.watch.entity.User" %>
	<%
	User user=(User)session.getAttribute("user");
	if(user==null){
		response.sendRedirect("login.jsp");
	}
	%>