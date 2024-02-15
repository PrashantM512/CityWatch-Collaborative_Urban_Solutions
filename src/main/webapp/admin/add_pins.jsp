<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.city.watch.dao.PinsDaoImpl" %>
<%@ page import="com.city.watch.db.*" %>
<%@ page import="com.city.watch.entity.Pins" %>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.util.*"%>
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
			<div class="container-fluid pt-4 px-4">
				<div class="">
					<div class="col-12">
						<div class="h-100 bg-secondary rounded p-4">
						 <%@include file="components/alert.jsp" %>
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Add Pins :</h6>
								<a href=""></a>
							</div>
							<div class="">
								<form action="../AddPinsServlet" method="post">
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputEmail4">Name</label> <input type="text"
											class="form-control" name="name" id="inputEmail4"
											placeholder="" required>
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputPassword4">Location</label> <input
											type="text" class="form-control" name="location"
											id="inputPassword4" required>
									</div>
									<div class="form-row" style="display: flex;">
										<div class="form-group col-md-12" style="margin-right: 18px;">
											<label for="inputState">Category</label> <select
												id="inputState" class="form-control" name="category"
												required>
												<option value="" selected>Choose...</option>
												<option value="Hospital">Hospital</option>
												<option value="ATM">ATM</option>
												<option value="Restaurant">Restaurants</option>
												<option value="Temple">Temples</option>
												<option value="Petrol_Pump">Petrol Pump</option>
												<option value="Cafe">Cafe</option>
												<option value="School">School</option>
											</select>
										</div>
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputPassword4">Link</label> <input type="text"
											class="form-control" name="link" id="inputPassword4" required>
									</div>
									<div class="form-group col-md-6">
										<button type="submit" class="btn"
											style="background-color: #007bff; color: white; margin-top: 10px; width: 51%;">Add
											Pin</button>
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
						<h6 class="mb-4">Manage Pins :</h6>
						<div class="table-responsive">
							<table class="table">
								<thead
									style="background-image: linear-gradient(3deg, black, #3807fd) !important; color: white; height: 42px;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Name</th>
										<th scope="col">Category</th>
										<th scope="col">Location</th>
										<th scope="col">action</th>
									</tr>
								</thead>
								<tbody>

									<%
									PinsDaoImpl dao = new PinsDaoImpl(ConnectionProvider.getConnection());
									List<Pins> list = new ArrayList<Pins>();
									list = dao.getAllPins();
									int i = 1;
									for (Pins pn : list) {
									%>
									<tr>
										<th scope="row"><%=i%></th>
										<td><%=pn.getName()%></td>
										<td><%=pn.getCategory()%></td>
										<td><%=pn.getLocation()%></td>
										<td><a class="btn-primary btn"
											href="../DeletePinServlet?id=<%=pn.getId()%>">Delete</a></td>
									</tr>
									<%
									i++;
									}
									%>

								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

			
			<%@include file="components/footer.jsp"%>
	
	<%@include file="components/allscripts.jsp"%>
</body>
</html>