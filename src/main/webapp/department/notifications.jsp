<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Notifications</title>
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
		String currentPage = "notifications";
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
								<h6 class="mb-0">Send Notifications :</h6>
								<a href=""></a>
							</div>
							<div class="">
								<form>

									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputEmail4">Title</label> <input type="text"
											class="form-control" id="inputEmail4" placeholder="">
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputPassword4">Description</label> <input
											type="text" class="form-control" id="inputPassword4">
									</div>
									<div class="form-row" style="display: flex;">
										<div class="form-group col-md-6"
											style="margin-right: 18px; width: 49%;">
											<label for="inputState">Zone</label> <select id="inputState"
												class="form-control">
												<option selected>Choose...</option>
												<option>All</option>
												<option>East</option>
												<option>West</option>
												<option>North</option>
												<option>South</option>
											</select>
										</div>
										<div class="form-group col-md-6"
											style="margin-right: 18px; width: 49%;">
											<label for="inputState">From</label> <select
												class="form-control">
												<option selected>Choose...</option>
												<option>Nagarpanchayt</option>
												<option>State Government</option>
												<option>Central Government</option>
											</select>
										</div>
									</div>
									<div class="form-group col-md-6">
										<button type="submit" class="btn"
											style="background-color: #007bff; color: white; margin-top: 10px; width: 51%;">Send</button>
									</div>
								</form>
							</div>
							<div class="d-flex align-items-center">
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid pt-4 px-4 mb-4">
			 <div class="col-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h6 class="mb-4">Manage Notifications :</h6>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead style="background-image: linear-gradient(3deg, black, #3807fd)!important;color: white;height: 42px;">
                                        <tr>
                                            <th scope="col">Sr.No.</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">description</th>
                                            <th scope="col">From</th>
                                            <th scope="col">Target</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Street Light</td>
                                            <td>9035482483</td>
                                            <td>Major</td>
                                            <td>12/1/2024</td>
                                            <td>
                                            <button type="button" class="btn " style="background-color:#007bff;color:white">Update</button>
                                           
                                            <button type="button" class="btn btn-danger">Delete</button>
                                            
                                            </td>
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