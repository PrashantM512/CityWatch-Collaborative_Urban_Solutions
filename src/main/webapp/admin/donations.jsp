<%@page import="com.city.watch.entity.Donation"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.DonationDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Donations</title>
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
		String currentPage = "donations";
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
						<%@include file="components/alert.jsp"%>
						<h6 class="mb-4">All Donations :</h6>
						<div class="table-responsive">
							<table class="table">
								<thead
									style="background-image: linear-gradient(3deg, black, #3807fd) !important; color: white; height: 42px;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Name</th>
										<th scope="col">Mobile</th>
										<th scope="col">Project Name</th>
										<th scope="col">Amount</th>
										<th scope="col">Date</th>
										<th scope="col">Payment Id</th>
										<th scope="col">Status</th>
									</tr>
								</thead>
								<tbody>
									<%
									DonationDaoImpl dao = new DonationDaoImpl(ConnectionProvider.getConnection());
									List<Donation> list = dao.getAllDonationsWithDevelopments();
									int i=1;
									for (Donation donation : list) {
									%>
									<tr>
										<td><%=i%></td>
										<td><%=donation.getName()%></td>
										<td><%=donation.getMobile()%></td>
										<td><%=donation.getDevelopment().getTitle()%></td>
										<td><%=donation.getAmount()%></td>
										<td><%=donation.getDate() %></td>
										<td>
											<%
											if (donation.getPaymentId() == null) {
											%> - <%
											} else {
											%> <%=donation.getPaymentId()%>
											<%
											}
											%>
										</td>
										<td><%=donation.getStatus()%></td>
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
		<%@include file="components/footer.jsp"%>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>