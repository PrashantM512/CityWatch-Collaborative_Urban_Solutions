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
<html>
<head>
<%@include file="admin/components/header_links.jsp"%>
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<%@include file="components/header_links.jsp"%>
<title></title>
</head>
<style>
th, td {
	border-right: solid 2px #e5e5e5;
}
.nav-link {
	color: #373737;
}
.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
	color: #fff;
	background-color: #0067d5;
}
.table thead th {
    border-bottom:none;
}
.view-map-btn {
    background-color: #0bc140;
    color: white;
    padding: 8px 27px;
    border-radius: 4px;
    display: ruby;
    margin-right: 11px;
}
.view-map-btn:hover {
    text-decoration:none;
    color:white;
    background-color: #ebb207;
}
</style>
<body>
	<%@include file="components/navbar.jsp"%>

	<div style="display: flex; place-content: center;">
		<p class="text-center pgeheading">LOCATION PINS</p>
		<img alt="" class="pagetitle-img"
			style="height: 33px; margin-left: 10px; margin-top: 21px;"
			src="img/map.png">
	</div>

	<div class="container-fluid pt-1 px-4">
		<div class="row justify-content-center">
			<div class="col-sm-12 col-xl-11">
				<div class="rounded h-100">
					<h6 class="mb-4"></h6>
					<div class="d-flex align-items-start">
						<div class="nav flex-column nav-pills me-3" id="v-pills-tab"
							style="background-color: #e5e5e5; padding: 6px 5px 7px 5px; border-radius: 6px; width: 160px"
							role="tablist" aria-orientation="vertical">
							<button class="nav-link active" id="v-pills-home-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-Hospitals"
								type="button" role="tab" aria-controls="v-pills-Hospitals"
								aria-selected="true">Hospitals</button>
							<button class="nav-link" id="v-pills-profile-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-ATM"
								type="button" role="tab" aria-controls="v-pills-ATM"
								aria-selected="false">ATM's</button>
							<button class="nav-link" id="v-pills-messages-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-Restaurants"
								type="button" role="tab" aria-controls="v-pills-Restaurants"
								aria-selected="false">Restaurants</button>
							<button class="nav-link" id="v-pills-settings-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-Cafes"
								type="button" role="tab" aria-controls="v-pills-Cafes"
								aria-selected="false">Cafes</button>
							<button class="nav-link" id="v-pills-settings-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-Temples"
								type="button" role="tab" aria-controls="v-pills-Temples"
								aria-selected="false">Temples</button>
							<button class="nav-link" id="v-pills-Petrol-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-Petrol"
								type="button" role="tab" aria-controls="v-pills-Petrol"
								aria-selected="false">Petrol Pumps</button>
							<button class="nav-link" id="v-pills-School-tab"
								data-bs-toggle="pill" data-bs-target="#v-pills-School"
								type="button" role="tab" aria-controls="v-pills-School"
								aria-selected="false">Schools</button>
						</div>
						 <div class="tab-content" id="v-pills-tabContent"
							style="width: 100%;">
						
							<div class="tab-pane fade show active" id="v-pills-Hospitals" role="tabpanel"
								aria-labelledby="v-pills-Hospitals-tab">
								<div class="container-fluid">
									<div class="col-12">
										<div class="rounded h-100">
											<h6 class=""></h6>
											<div class="table-responsive">
												<table class="table"
													style="border-style: solid; border-color: #e5e5e5;">
													<thead style="height: 42px; background-color: #e5e5e5;">
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
													PinsDaoImpl dao=new PinsDaoImpl(ConnectionProvider.getConnection());
													List<Pins> list=new ArrayList<Pins>();
													list=dao.getPinByCategory("Hospital");
													int i=1;
													for(Pins pn:list){
														%>
														<tr>
															<th scope="row"><%=i %></th>
															<td><%=pn.getName() %></td>
															<td><%=pn.getCategory() %></td>
															<td><%=pn.getLocation() %></td>
															<td><a class="view-map-btn" scope="row" href="map.jsp?location=<%=pn.getLink()%>&name=<%=pn.getName() %>">View Map</a></td>
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
							
							<div class="tab-pane fade" id="v-pills-ATM" role="tabpanel"
								aria-labelledby="v-pills-ATM-tab">
								<div class="container-fluid">
									<div class="col-12">
										<div class="rounded h-100">
											<h6 class=""></h6>
											<div class="table-responsive">
												<table class="table"
													style="border-style: solid; border-color: #e5e5e5;">
													<thead style="height: 42px; background-color: #e5e5e5;">
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
													list=dao.getPinByCategory("ATM");
													i=1;
													for(Pins pn:list){
														%>
														<tr>
															<th scope="row"><%=i %></th>
															<td><%=pn.getName() %></td>
															<td><%=pn.getCategory() %></td>
															<td><%=pn.getLocation() %></td>
															<td><a class="view-map-btn" scope="row" href="map.jsp?location=<%=pn.getLink()%>&name=<%=pn.getName() %>">View Map</a></td>
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
							<div class="tab-pane fade" id="v-pills-Restaurants"
								role="tabpanel" aria-labelledby="v-pills-Restaurants-tab">

								<div class="container-fluid">
									<div class="col-12">
										<div class="rounded h-100">
											<h6 class=""></h6>
											<div class="table-responsive">
												<table class="table"
													style="border-style: solid; border-color: #e5e5e5;">
													<thead style="height: 42px; background-color: #e5e5e5;">
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
													list=dao.getPinByCategory("Restaurant");
													i=1;
													for(Pins pn:list){
														%>
														<tr>
															<th scope="row"><%=i %></th>
															<td><%=pn.getName() %></td>
															<td><%=pn.getCategory() %></td>
															<td><%=pn.getLocation() %></td>
															<td><a class="view-map-btn" scope="row" href="map.jsp?location=<%=pn.getLink()%>&name=<%=pn.getName() %>">View Map</a></td>
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
							<div class="tab-pane fade" id="v-pills-Cafes" role="tabpanel"
								aria-labelledby="v-pills-Cafes-tab">
								<div class="container-fluid">
									<div class="col-12">
										<div class="rounded h-100">
											<h6 class=""></h6>
											<div class="table-responsive">
												<table class="table"
													style="border-style: solid; border-color: #e5e5e5;">
													<thead style="height: 42px; background-color: #e5e5e5;">
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
													list=dao.getPinByCategory("Cafe");
													i=1;
													for(Pins pn:list){
														%>
														<tr>
															<th scope="row"><%=i %></th>
															<td><%=pn.getName() %></td>
															<td><%=pn.getCategory() %></td>
															<td><%=pn.getLocation() %></td>
															<td><a class="view-map-btn" scope="row" href="map.jsp?location=<%=pn.getLink()%>&name=<%=pn.getName() %>">View Map</a></td>
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
							<div class="tab-pane fade" id="v-pills-Temples" role="tabpanel"
								aria-labelledby="v-pills-Temples-tab">
								<div class="container-fluid">
									<div class="col-12">
										<div class="rounded h-100">
											<h6 class=""></h6>
											<div class="table-responsive">
												<table class="table"
													style="border-style: solid; border-color: #e5e5e5;">
													<thead style="height: 42px; background-color: #e5e5e5;">
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
													list=dao.getPinByCategory("Temple");
													i=1;
													for(Pins pn:list){
														%>
														<tr>
															<th scope="row"><%=i %></th>
															<td><%=pn.getName() %></td>
															<td><%=pn.getCategory() %></td>
															<td><%=pn.getLocation() %></td>
															<td><a class="view-map-btn" scope="row" href="map.jsp?location=<%=pn.getLink()%>&name=<%=pn.getName() %>">View Map</a></td>
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

							<div class="tab-pane fade" id="v-pills-Petrol" role="tabpanel"
								aria-labelledby="v-pills-Petrol-tab">
								<div class="container-fluid">
									<div class="col-12">
										<div class="rounded h-100">
											<h6 class=""></h6>
											<div class="table-responsive">
												<table class="table"
													style="border-style: solid; border-color: #e5e5e5;">
													<thead style="height: 42px; background-color: #e5e5e5;">
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
													list=dao.getPinByCategory("Petrol_Pump");
													i=1;
													for(Pins pn:list){
														%>
														<tr>
															<th scope="row"><%=i %></th>
															<td><%=pn.getName() %></td>
															<td><%=pn.getCategory() %></td>
															<td><%=pn.getLocation() %></td>
															<td><a class="view-map-btn" scope="row" href="map.jsp?location=<%=pn.getLink()%>&name=<%=pn.getName() %>">View Map</a></td>
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
							<div class="tab-pane fade" id="v-pills-School" role="tabpanel"
								aria-labelledby="v-pills-School-tab">
								<div class="container-fluid">
									<div class="col-12">
										<div class="rounded h-100">
											<h6 class=""></h6>
											<div class="table-responsive">
												<table class="table"
													style="border-style: solid; border-color: #e5e5e5;">
													<thead style="height: 42px; background-color: #e5e5e5;">
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
													list=dao.getPinByCategory("School");
													i=1;
													for(Pins pn:list){
														%>
														<tr>
															<th scope="row"><%=i %></th>
															<td><%=pn.getName() %></td>
															<td><%=pn.getCategory() %></td>
															<td><%=pn.getLocation() %></td>
															<td><a class="view-map-btn" scope="row" href="map.jsp?location=<%=pn.getLink()%>&name=<%=pn.getName() %>">View Map</a></td>
														</tr>
													<%
													i++;
													}
													%>
														<tr>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>