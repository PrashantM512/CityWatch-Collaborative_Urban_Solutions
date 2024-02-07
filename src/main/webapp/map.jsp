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
	<%
	String location = request.getParameter("location");
	%>
	<div class="container">

		<p class="text-center pgeheading">FIND YOUR LOCATION HERE</p>
		<div class="container-fluid pt-4 px-4" style="margin-top: -21px;">
			<div class="row justify-content-center">
				<div class="map-container"
					style="box-shadow: rgba(0, 5, 0, 1.35) 0px 0px 25px;">
					<iframe src="<%=location %>" frameborder="0" allowfullscreen="true"
						aria-hidden="false" tabindex="0"></iframe>
				</div>

			</div>
		</div>
	</div>

	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>