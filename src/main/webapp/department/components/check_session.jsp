<%@page import="com.city.watch.entity.Department" %>
	<%
	Department dept=(Department)session.getAttribute("dept");
	if(dept==null){
		response.sendRedirect("signin.jsp");
	}
	%>