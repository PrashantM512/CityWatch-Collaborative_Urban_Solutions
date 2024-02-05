<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Add Pins</title>
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
		String currentPage = "pins";
		request.setAttribute("currentPage", currentPage);
		%>
		<%@include file="components/sidebar.jsp"%>
		<%
		request.removeAttribute("currentPage");
		%>
		<div class="content">
			<%@include file="components/navbar.jsp"%>
	          <div class="container-fluid pt-4 px-4 " style=" margin-top: 66px; margin-bottom: 60px; ">
				<div class="" style=" text-align: -webkit-center; ">
					
					<div class="col-6" style=" text-align: justify; ">
						<!-- Third card -->
						<div class="h-100 bg-secondary rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Add Pins :</h6>
								<a href=""></a>
							</div>
							<div class="">
								<form>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputEmail4">Name</label> <input type="text"
											class="form-control" id="inputEmail4" placeholder="">
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputPassword4">Location</label> <input
											type="text" class="form-control" id="inputPassword4">
									</div>
									<div class="form-row" style="display: flex;">
										<div class="form-group col-md-12"
											style="margin-right: 18px;">
											<label for="inputState">Category</label> <select id="inputState"
												class="form-control">
												<option selected>Choose...</option>
												<option>Hospital</option>
												<option>ATM</option>
												<option>Restaurants</option>
												<option>Temples</option>
												<option>Petrol Pump</option>
												<option>Cafe</option>
												<option>School</option>
											</select>
										</div>
										</div>
										<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputPassword4">Link</label> <input
											type="text" class="form-control" id="inputPassword4">
									</div>
									<div class="form-group col-md-6">
										<button type="submit" class="btn"
											style="background-color: #007bff; color: white; margin-top: 10px; width: 51%;">Add Pin</button>
									</div>
								</form>
							</div>
							<div class="d-flex align-items-center">
								
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- Footer Start -->
			<%@include file="components/footer.jsp"%>
			<!-- Footer End -->
		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>