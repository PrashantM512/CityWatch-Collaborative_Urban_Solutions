<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Admin: Dashboard</title>
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
		String currentPage = "dashboard";
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
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-exclamation-triangle fa-3x text-warning"></i>

							<div class="ms-3">
								<p class="mb-2">Total Issues</p>
								<h6 class="mb-0">256</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-heart fa-3x text-danger"></i>

							<div class="ms-3">
								<p class="mb-2">Total Donations</p>
								<h6 class="mb-0">34</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-building fa-3x text-dark"></i>

							<div class="ms-3">
								<p class="mb-2">Ongoing Projects</p>
								<h6 class="mb-0">4</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-credit-card fa-3x text-info"></i>

							<div class="ms-3">
								<p class="mb-2">Total Tax Payments</p>
								<h6 class="mb-0">18</h6>
							</div>
						</div>
					</div>
				</div>
			</div>

<div class="container-fluid pt-4 px-4">
    <div class="row g-4">
        <div class="col-lg-12 col-xl-12">
            <div class="bg-secondary text-center rounded p-4" style="height: 330px;">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0"></h6>
                    <a href=""></a>
                </div>
               
               <div></div>
            </div>
        </div>
    </div>
</div>

		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>