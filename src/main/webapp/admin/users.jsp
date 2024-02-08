<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.UserDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Users</title>
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
		String currentPage = "users";
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
					<%@include file="components/alert.jsp" %>
						<h6 class="mb-4">All Users :</h6>
						<div class="table-responsive">
							<table class="table">
								<thead
									style="background-image: linear-gradient(3deg, black, #3807fd) !important; color: white; height: 42px;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Name</th>
										<th scope="col">Email</th>
										<th scope="col">Mobile</th>
										<th scope="col">Zone</th>
										<th scope="col">Aadhar</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
									<%
									UserDaoImpl dao=new UserDaoImpl(ConnectionProvider.getConnection());
									List<User> list=dao.getAllUsers();
									int i=1;
									for(User usrList:list){
										%>
									<tr>
										<th scope="row"><%=i %></th>
										<td><%=usrList.getName() %></td>
										<td><%=usrList.getEmail() %></td>
										<td><%=usrList.getMobile() %></td>
										<td><%=usrList.getZone() %></td>
										<td><%=usrList.getAadhar() %></td>
										<td>
										<a href="../DeleteUserServlet?uid=<%=usrList.getUid() %>" type="button" class="btn btn-danger">Delete User</a>
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