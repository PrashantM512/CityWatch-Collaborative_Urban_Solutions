<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.entity.TransactionDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.dao.TransactionDetailsDAOImpl"%>
<%@page import="com.city.watch.entity.Donation"%>
<%@page import="com.city.watch.dao.DonationDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title></title>
</head>
<style>
.nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	color: #ffffff;
	background-color: #1938cf;
}
</style>
<body>
	<%@include file="components/check_session.jsp"%>
	<%@include file="components/navbar.jsp"%>

	<div class="conatiner" style="text-align: -webkit-center;">
		<p class="text-center pgeheading">YOUR TRANSACTIONS</p>
		<div class="col-sm-10 col-xl-11 text-left">
			<div class="rounded h-100 p-2">
				<nav>
					<div class="nav nav-tabs" id="nav-tab" role="tablist">
						<button class="nav-link active" id="nav-home-tab"
							data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
							role="tab" aria-controls="nav-home" aria-selected="true">Tax
							Payments</button>
						<button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab"
							data-bs-target="#nav-profile" type="button" role="tab"
							aria-controls="nav-profile" aria-selected="false">Donations</button>
					</div>
				</nav>
				<div class="tab-content pt-3" id="nav-tabContent">
					<div class="tab-pane fade show active" id="nav-home"
						style="text-align: -webkit-center;" role="tabpanel"
						aria-labelledby="nav-home-tab">

						<div class="container-fluid px-4"
							style="text-align: -webkit-center;">
							<div class="col-12">
								<div class="rounded h-100">
									<h6 class="mb-4"></h6>
									<div class="table-responsive">
										<table class="table"
											style="border-style: solid; border-color: #e5e5e5; width: 90%;">
											<thead style="height: 42px; background-color: #e5e5e5;">
												<tr>
													<th scope="col">Sr.No.</th>
													<th scope="col">Tax Type</th>
													<th scope="col">Property Tax Id/House Id</th>
													<th scope="col">Amount</th>
													<th scope="col">Property Type</th>
													<th scope="col">Status</th>
													<th scope="col">Date</th>
													<th scope="col">Transaction Id</th>
												</tr>
											</thead>
											<tbody>
												<%
												TransactionDetailsDAOImpl transactionDetailsDao = new TransactionDetailsDAOImpl(ConnectionProvider.getConnection());
												List<TransactionDetails> transactionList = transactionDetailsDao.getAllTransactionDetailsWithUser();
												int count = 1;
												for (TransactionDetails transaction : transactionList) {
													User ud = transaction.getUser();
													String taxType = "";
													if (ud.getUid() == user.getUid()) {
														if (transaction.getPropertyTaxId().matches("\\d.*")) {
													taxType = "Property Tax";
														} else {
													taxType = "Water Tax";
														}
												%>
												<tr>
													<td  scope="row"><%=count++%></td>
									            	<td><%=taxType%></td>
									            	<td><%=transaction.getPropertyTaxId()%></td>
									            	<td><%=transaction.getAmount()%></td>
													<%
													if (transaction.getPropertyType() == null) {
													%>
													<td>-</td>
													<%
													} else {
													%>
													<td><%=transaction.getPropertyType()%></td>
													<%
													}
													%>
													<td><%=transaction.getStatus()%></td>
										            <td><%=transaction.getDate() %></td>
													<%
													if (transaction.getPaymentId() == null) {
													%>
													<td>-</td>
													<%
													} else {
													%>
													<td><%=transaction.getPaymentId()%></td>
													<%
													}
													%>
												</tr>
												<%
									         	   }
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
			</div>
		</div>

		<div class="tab-pane fade" id="nav-profile" role="tabpanel"
			aria-labelledby="nav-profile-tab" style="text-align: -webkit-center;">

			<div class="container-fluid px-4" style="text-align: -webkit-center;">
				<div class="col-12">
					<div class="rounded h-100">
						<h6 class="mb-4"></h6>
						<div class="table-responsive">
							<table class="table"
								style="border-style: solid; border-color: #e5e5e5; width: 80%;">
								<thead style="height: 42px; background-color: #e5e5e5;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Project Name</th>
										<th scope="col">Amount</th>
										<th scope="col">Date</th>
										<th scope="col">Status</th>
										<th scope="col">Transaction Id</th>
									</tr>
								</thead>
								<tbody>
                                      <%
									DonationDaoImpl dao = new DonationDaoImpl(ConnectionProvider.getConnection());
									List<Donation> list = dao.getAllDonationsWithDevelopments();
									int cnt=1;
									for (Donation donation : list) {
									%>
									<tr>
										<td scope="row"><%=cnt++ %></td>
										<td><%=donation.getDevelopment().getTitle()%></td>
										<td><%=donation.getAmount()%></td>
										<td><%=donation.getDate() %></td>
										<td><%=donation.getStatus()%></td>
									    <td>
									    	<%
											if (donation.getPaymentId() == null) {
											%> - <%
											} else {
											%> <%=donation.getPaymentId()%>
											<%
											}
											%></td>
									</tr>
									<%
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
	<%@include file="components/all_js.jsp"%>
</body>
</html>