<%@page import="com.city.watch.entity.User" %>
<% 
        User us = (User) session.getAttribute("user");
		if (us != null && (us.getUsertype().equals("Normal") || !us.getUsertype().equals("Admin"))) {
			response.sendRedirect("../admin_error.jsp");
		}
%>