<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title></title>
</head>
<style>
.footer {
	margin-top: 81px;
}

.container {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

.pgeheading {
	margin-bottom: 20px;
}

.map-container {
	width: 99vw;
	max-width: 100%;
	height: 66vh;
	max-height: 600px;
	overflow: hidden;
	border-radius: 4px;
}

.map-container iframe {
	width: 100%;
	height: 100%;
	border: 0;
}
</style>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container">

		<p class="text-center pgeheading">FIND YOUR LOCATION HERE</p>
		<div class="container-fluid pt-4 px-4" style="margin-top: -21px;">
			<div class="row justify-content-center">
				<div class="map-container"
					style="box-shadow: rgba(0, 5, 0, 1.35) 0px 0px 25px;">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3773.774044900283!2d73.94508878551532!3d19.002154670875296!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bdd3085d417857b%3A0x59b22615c59d1297!2s19.002154670875296%2C%2073.94508878551532!5e0!3m2!1sen!2sin!4v1646478200187!5m2!1sen!2sin"
						frameborder="0" allowfullscreen="true" aria-hidden="false"
						tabindex="0"></iframe>
				</div>

			</div>
		</div>
	</div>

	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>