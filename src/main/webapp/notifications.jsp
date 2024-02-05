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
			<div class="notification2 -active" style=" z-index: 0; ">
				<div class="notification__content">
					<h2 class="notification__title">This is a notification!</h2>
					<p class="notification__message">There's a new move in your
						local theaters new move in your local theaters new move in your
						local theaters !</p>
					<div class="notification__footer">
						<a href="#" class="notification__button -primary">Checked ?</a> <a
							href="#" class="notification__button -secondary">Delete</a>
					</div>
				</div>
			</div>
			<div class="notification2 -active" style=" z-index: 0; ">
				<div class="notification__content">
					<h2 class="notification__title">This is a notification!</h2>
					<p class="notification__message">There's a new move in your
						local theaters new move in your local theaters new move in your
						local theaters !</p>
					<div class="notification__footer">
						<a href="#" class="notification__button -primary">Checked ?</a> <a
							href="#" class="notification__button -secondary">Delete</a>
					</div>
				</div>
			</div>
			<div class="notification2 -active" style=" z-index: 0; ">
				<div class="notification__content">
					<h2 class="notification__title">This is a notification!</h2>
					<p class="notification__message">There's a new move in your
						local theaters new move in your local theaters new move in your
						local theaters !</p>
					<div class="notification__footer">
						<a href="#" class="notification__button -primary">Checked ?</a> <a
							href="#" class="notification__button -secondary">Delete</a>
					</div>
				</div>
			</div>
			<div class="notification2 -active">
				<div class="notification__content">
					<h2 class="notification__title">This is a notification!</h2>
					<p class="notification__message">There's a new move in your
						local theaters new move in your local theaters new move in your
						local theaters !</p>
					<div class="notification__footer">
						<a href="#" class="notification__button -primary">Checked ?</a> <a
							href="#" class="notification__button -secondary">Delete</a>
					</div>
				</div>
			</div>

		</div>
	</div>

	<script>
		
	</script>
	<%@include file="components/footer.jsp"%>
</body>
</html>