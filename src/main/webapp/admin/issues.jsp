<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Issues</title>
<%@include file="components/header_links.jsp"%>
</head>
<body>
	<div class="container-fluid position-relative d-flex p-0">
		<div id="spinner"
			class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<%
		String currentPage = "issues";
		request.setAttribute("currentPage", currentPage);
		%>
		<!-- Sidebar Start -->
		<%@include file="components/sidebar.jsp"%>
		<!-- Sidebar End -->
		<%
		request.removeAttribute("currentPage");
		%>

		<div class="content">
			<!-- Navbar Start -->
			<%@include file="components/navbar.jsp"%>
			<!-- Navbar End -->
			
	
			
			<!-- Footer Start -->
			<%@include file="components/footer.jsp"%>
			<!-- Footer End -->
		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>