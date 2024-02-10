<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Developments</title>
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
		String currentPage = "developments";
		request.setAttribute("currentPage", currentPage);
		%>
		<!-- Sidebar Start -->
		<%@include file="components/sidebar.jsp"%>
		<!-- Sidebar End -->
		<%
		request.removeAttribute("currentPage");
		%>

		<div class="content">
			<%@include file="components/navbar.jsp"%>
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-12">
						<div class="h-100 bg-secondary rounded p-4">
						 <%@include file="components/alert.jsp" %>
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Add Developments :</h6>
								<a href="manage_devlopments.jsp">Manage Developments</a>
							</div>
							<div class="">
								<form action="../AddDevelopmentServlet" method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label for="inputAddress">Title</label> <input type="text"
											class="form-control col-md-12" name="title" id="inputAddress" required>
									</div>
									<div class="form-group">
										<label for="inputAddress">Description</label> <input
											type="text" class="form-control" name="description" id="inputAddress" required>
									</div>
									<div class="form-group">
										<label for="inputAddress2">Location (Address)</label> <input
											type="text" class="form-control" name="address" id="inputAddress2" required>
									</div>

									<div class="form-row" style="display: flex;">
										<div class="form-group col-md-6"
											style="margin-right: 18px; width: 49%;">
											<label for="inputEmail4">Start Date</label> <input
												type="text" class="form-control" name="sdate" id="inputEmail4" required>
										</div>
										<div class="form-group col-md-6">
											<label for="inputEmail4">End Date</label> <input type="text"
												class="form-control" id="inputEmail4" name="edate" required>
										</div>
									</div>

									<div class="form-row" style="display: flex;">
										<div class="form-group col-md-4" style="width: 33.33%">
											<label for="inputState">Status</label> <select
												id="inputState" class="form-control" name="status" required>
												<option value="" selected>Choose...</option>
												<option value="Upcoming">Upcoming</option>
												<option value="Ongoing">Ongoing</option>
												<option value="Completed">Completed</option>
											</select>
										</div>
										<div class="form-group col-md-4"
											style="width: 33.33%; margin-left: 10px;">
											<label for="inputState">Need Donation ?</label> <select
												id="inputState" class="form-control" name="need" required>
												<option value="" selected>Choose...</option>
												<option value="Yes">Yes</option>
												<option value="No">No</option>
											</select>
										</div>
										<div class="form-group col-md-4"
											style="width: 32.33%; margin-left: 10px;">
											<label for="exampleFormControlFile1">Upload Photo</label> <input
												type="file" class="form-control-file form-control" name="photo"
												id="exampleFormControlFile1" required>
										</div>
									</div>
									<div class="form-group col-md-6">
										<button type="submit" class="btn"
											style="background-color: #007bff; color: white; margin-top: 10px; width: 66%;">Upload</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>