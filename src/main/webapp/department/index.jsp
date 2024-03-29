<%@page import="com.city.watch.entity.Donation"%>
<%@page import="com.city.watch.dao.DonationDaoImpl"%>
<%@page import="com.city.watch.entity.TransactionDetails"%>
<%@page import="com.city.watch.dao.TransactionDetailsDAOImpl"%>
<%@page import="com.city.watch.entity.Development"%>
<%@page import="com.city.watch.dao.DevelopmentDaoImpl"%>
<%@page import="java.util.Map"%>
<%@page import="com.city.watch.entity.Issue"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.IssueDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Department</title>
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
		String currentPage = "dashboard";
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

			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-exclamation-triangle fa-3x text-warning"></i>
							<div class="ms-3">
								<p class="mb-2">Total Issues</p>
								<%
								IssueDaoImpl dao = new IssueDaoImpl(ConnectionProvider.getConnection());
								List<Map<String, Object>> list = dao.getPublicIssues();
								int i = 0;
								for (Map<String, Object> getPublicIssues : list) {
									i++;
								}
								%>
								
								<h6 class="mb-0"><%=i %></h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-heart fa-3x text-danger"></i>

							<div class="ms-3">
								<p class="mb-2">Total Donations</p>
								<%
								DonationDaoImpl dt=new DonationDaoImpl(ConnectionProvider.getConnection());
								List<Donation> donations = dt.getAllDonations();
							    
							    double totalAmount = 0;
							    for (Donation donation : donations) {
							        totalAmount += donation.getAmount();
							    }
								
								%>
								<h6 class="mb-0">&#8377; <%=totalAmount %></h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-building fa-3x "></i>

							<div class="ms-3">
								<p class="mb-2">Developments</p>
								<%
								DevelopmentDaoImpl dao2=new DevelopmentDaoImpl(ConnectionProvider.getConnection());
								List<Development> list2=dao2.getAlldevelopments();
								int j=0;
								for(Development d:list2){
									j++;
								}
								%>
								<h6 class="mb-0"><%=j %></h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-credit-card fa-3x text-info"></i>

							<div class="ms-3">
								<p class="mb-2">Total Tax Payments</p>
								<%
									TransactionDetailsDAOImpl transactionDetailsDao = new TransactionDetailsDAOImpl(ConnectionProvider.getConnection());
									List<TransactionDetails> transactionList = transactionDetailsDao.getAllTransactionDetailsWithUser();
									int k = 0;
									for (TransactionDetails transaction : transactionList) {
										k++;
									}
									%>
								<h6 class="mb-0"><%=k %></h6>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-lg-12 col-xl-12">
						<div class="bg-secondary text-center rounded p-4">
							<div
								class="d-flex align-items-center justify-content-between">
								<h6 class="mb-0"></h6>
								<a href=""></a>
							</div>
                              <img src="../img/dashboard.jpg" class="card-img-top img-fluid" alt="Responsive image">
							<div></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>