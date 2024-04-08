<%@page import="java.util.ArrayList"%>
<%@page import="com.city.watch.entity.Notification"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.NotificationDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<link href="components/notification_css.css" rel="stylesheet"
	type="text/css">
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Notifications</title>
</head>
<style>
.ft {
	margin-top: 200px;
}
</style>
<body>
<%
User usd = (User) session.getAttribute("user");
if (usd == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
    <%@include file="components/check_session.jsp" %>
	<%@include file="components/navbar.jsp"%>

	<div class="container" style="margin-bottom: 16px;">
		<h3 class="text-center">
			<img alt="" src="img/Your-Notifications.png" class="pagetitle"><img
				alt="" class="pagetitle-img" src="img/notifications2.png"
				style="margin-left: -41px;">
		</h3>
	</div>

	<div class="container">
		<div class="page">
			
			<%
			NotificationDaoImpl dao=new NotificationDaoImpl(ConnectionProvider.getConnection());
			List<Notification> list=new ArrayList<Notification>();
			String target=user.getZone();
			list=dao.getNotificationByTarget(target);
			for(Notification n:list){
				%>
			  <div class="notification2 -active" style=" z-index: 0; ">
				<div class="notification__content">
					<h2 class="notification__title"><%=n.getTitle() %></h2>
					<p class="notification__message"><%=n.getDescription() %></p>
					<div class="notification__footer">
						<button class="notification__button -primary">By&nbsp;<%=n.getFrm() %></button> 
						<a href="#" class="notification__button -secondary">Delete</a>
					   <p class="notification__button -white" style=" background: white; color: #1938cf; padding-left: 0px; font-size: small; "><%=n.getDate() %></p>
					</div>
				</div>
			</div>
			<%
			}
			%>
		
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
</body>
</html>