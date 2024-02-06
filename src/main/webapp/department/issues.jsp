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
			
			<div class="container-fluid pt-4 px-4">
			 <div class="col-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h6 class="mb-4">Public Issues</h6>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead style="background-image: linear-gradient(3deg, black, #3807fd)!important;color: white;height: 42px;">
                                        <tr>
                                            <th scope="col">Sr.No.</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">User Mobile</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Time</th>
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
                                            <td>10:12 PM</td>
                                            <td>
                                            <a href="issue_details.jsp" type="button" class="btn " style="background-color:#007bff;color:white">View Details</a>
                                            <button type="button" class="btn btn-success">Solved ?</button>
                                            <button type="button" class="btn btn-danger">Delete</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Street Light</td>
                                            <td>9035482483</td>
                                            <td>Major</td>
                                            <td>12/1/2024</td>
                                            <td>10:12 PM</td>
                                            <td>
                                            <button type="button" class="btn " style="background-color:#007bff;color:white">View Details</button>
                                            <button type="button" class="btn btn-success">Solved ?</button>
                                            <button type="button" class="btn btn-danger">Delete</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Street Light</td>
                                            <td>9035482483</td>
                                            <td>Major</td>
                                            <td>12/1/2024</td>
                                            <td>10:12 PM</td>
                                            <td>
                                            <button type="button" class="btn " style="background-color:#007bff;color:white">View Details</button>
                                           <button type="button" class="btn btn-success">Solved ?</button>
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
			
			<!-- Footer Start -->
			<%@include file="components/footer.jsp"%>
			<!-- Footer End -->
		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>