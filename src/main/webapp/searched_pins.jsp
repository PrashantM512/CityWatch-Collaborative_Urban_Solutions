<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.city.watch.entity.Pins" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Developments</title>
</head>
<style>
th, td {
	border-right: solid 2px #e5e5e5;
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

	<div class="conatiner">
		<p class="text-center pgeheading">YOUR SEARCHED PINS</p>

		<div class="container-fluid px-4" style="text-align: -webkit-center;">
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
								List<Pins> list=(List<Pins>)session.getAttribute("SearchList");
								int i=1;
								if(list!=null){
								for(Pins pn:list){
								%>
								<tr>
									<th scope="row"><%=i%></th>
									<td><%=pn.getName()%></td>
									<td><%=pn.getCategory()%></td>
									<td><%=pn.getLocation()%></td>
									<td><a class="view-map-btn" scope="row"
										href="map.jsp?location=<%=pn.getLink()%>&name=<%=pn.getName()%>">View
											Map</a></td>
								</tr>
								<%
								i++;
								}}else{
									
								}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="height: 100px"></div>

	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>