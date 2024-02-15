<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.entity.TransactionDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.dao.TransactionDetailsDAOImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Tax Payemnts</title>
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
		String currentPage = "tax_payments";
		request.setAttribute("currentPage", currentPage);
		%>
		<%@include file="components/sidebar.jsp"%>
		<%
		request.removeAttribute("currentPage");
		%>

		<div class="content">
			<%@include file="components/navbar.jsp"%>

			<div class="container-fluid pt-4 px-4 mb-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">
						<%@include file="components/alert.jsp"%>
						<div class="d-flex align-items-center justify-content-between mb-4">
						<h6 class="mb-0">All Tax Payments :</h6>
						<a href="tax_bills.jsp"><b>Send Tax Bills</b></a>
						</div>
						<div class="table-responsive">
							<table class="table">
								<thead
									style="background-image: linear-gradient(3deg, black, #3807fd) !important; color: white; height: 42px;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Tax Type</th>
										<th scope="col">Name</th>
										<th scope="col">Mobile</th>
										<th scope="col">Property Tax id/House id</th>
										<th scope="col">Amount</th>
										<th scope="col">Payment Id</th>
										<th scope="col">Status</th>
										<th scope="col">Date</th>
										<th scope="col">Property Type</th>
									</tr>
								</thead>
								<tbody>
									<%
									TransactionDetailsDAOImpl transactionDetailsDao = new TransactionDetailsDAOImpl(ConnectionProvider.getConnection());
									List<TransactionDetails> transactionList = transactionDetailsDao.getAllTransactionDetailsWithUser();
									int count = 1;
									for (TransactionDetails transaction : transactionList) {
										User user = transaction.getUser();
										String taxType = "";
										if (transaction.getPropertyTaxId().matches("\\d.*")) {
											taxType = "Property Tax";
										} else {
											taxType = "Water Tax";
										}
									%>
									<tr>
										<td><%=count++%></td>
										<td><%=taxType%></td>
										<td><%=user.getName()%></td>
										<td><%=user.getMobile()%></td>
										<td><%=transaction.getPropertyTaxId()%></td>
										<td><%=transaction.getAmount()%></td>
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

										<td><%=transaction.getStatus()%></td>
										<td><%=transaction.getDate() %></td>
										<td><%=transaction.getPropertyType()%></td>
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


			<%@include file="components/footer.jsp"%>
		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>