<%@page import="com.city.watch.entity.Development"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.DevelopmentDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Manage Developments</title>
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
			
			<div class="container-fluid pt-4 px-4 mb-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">
						<h6 class="mb-4">All Developments :</h6>
						<div class="table-responsive">
							<table class="table">
								<thead
									style="background-image: linear-gradient(3deg, black, #3807fd) !important; color: white; height: 42px;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Title</th>
										<th scope="col">Description</th>
										<th scope="col">Photo</th>
										<th scope="col">Address</th>
										<th scope="col">Start Date</th>
										<th scope="col">End Date</th>
										<th scope="col">Need Donation</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
								<%
								DevelopmentDaoImpl dao=new DevelopmentDaoImpl(ConnectionProvider.getConnection());
								List<Development> list=dao.getAlldevelopments();
								int i=1;
								for(Development d:list){
									%>
									<tr>
										<th scope="row"><%=i %></th>
										<td><%=d.getTitle() %></td>
										<td><%=d.getDescription() %></td>
										<td><img alt="" src="../developments_img/<%=d.getPhoto() %>" style="width: 100px; height: 115px" class="img-thumblin"></td>
										<td><%=d.getLocation()%></td>
										<td><%=d.getsDate() %></td>
										<td><%=d.geteDate() %></td>
										<td><%=d.getNeed() %></td>
										<td>
										   <button type="button" class="btn " style="background-color:#007bff;color:white">Update</button>
                                          <button type="button" class="btn btn-danger">Delete</button>
										</td>
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


	<%@include file="components/allscripts.jsp"%>
</body>
</html>