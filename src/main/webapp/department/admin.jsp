<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Manage Admins</title>
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
		String currentPage = "admin";
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
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<!-- First card -->
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<!-- Second card -->
					<div class="col-12">
						<!-- Third card -->
						<div class="h-100 bg-secondary rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Manage Admins :</h6>
								<a href=""></a>
							</div>
							<div class="">
								<form>
									<div class="form-group col-md-12">
										<label for="inputEmail4">User Email ID</label> <input
											type="email" class="form-control" id="inputEmail4"
											placeholder="">
									</div>
									<div class="form-group col-md-12">
										<label for="inputState">Action</label> <select id="inputState"
											class="form-control">
											<option selected>Choose...</option>
											<option>Make Admin</option>
											<option>Remove From Admin</option>
										</select>
									</div>
									<div class="form-group col-md-6">
										<button type="submit" class="btn"
											style="background-color: #007bff; color: white; margin-top: 10px; width: 51%;">Submit</button>
									</div>
								</form>
							</div>
							<div class="d-flex align-items-center"></div>

						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid pt-4 px-4 mb-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">
						<h6 class="mb-4">Current Admins :</h6>
						<div class="table-responsive">
							<table class="table">
								<thead
									style="background-image: linear-gradient(3deg, black, #3807fd) !important; color: white; height: 42px;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Name</th>
										<th scope="col">Email</th>
										<th scope="col">Mobile</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">1</th>
										<td>Ram Suryawanshi</td>
										<td>ram@gmail.com</td>
										<td>9035482483</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>