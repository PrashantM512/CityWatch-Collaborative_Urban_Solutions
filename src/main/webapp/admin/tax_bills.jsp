<%@page import="java.util.ArrayList"%>
<%@page import="com.city.watch.entity.Notification"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.NotificationDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Send Tax Bills</title>
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
		String currentPage = "notifications";
		request.setAttribute("currentPage", currentPage);
		%>
		<%@include file="components/sidebar.jsp"%>
		<%
		request.removeAttribute("currentPage");
		%>

		<div class="content">
			<%@include file="components/navbar.jsp"%>

			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-12">
						<div class="h-100 bg-secondary rounded p-4">
						 <%@include file="components/alert.jsp" %>
							<div class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Send Property Tax Bill :</h6>
								<a href=""></a>
							</div>
							<div class="">
								<form action="../SendTaxBillServlet?updt=p" method="post">
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputEmail4">Property Tax Id</label> <input type="text"
											class="form-control" name="taxid" id="inputEmail4">
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputEmail4">Amount</label> <input type="text"
											class="form-control" name="amount" id="inputEmail4">
									</div>
									<div class="form-group col-md-6">
										<button type="submit" class="btn"
											style="background-color: #007bff; color: white; margin-top: 10px; width: 51%;">Send Bill</button>
									</div>
								</form>
							</div>
							<div class="d-flex align-items-center">
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-12">
						<div class="h-100 bg-secondary rounded p-4">
							<div class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Send Water Tax Bill :</h6>
								<a href=""></a>
							</div>
							<div class="">
								<form action="../SendTaxBillServlet?updt=w" method="post">
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputEmail4">House Id</label> <input type="text"
											class="form-control" name="taxid" id="inputEmail4">
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputEmail4">Amount</label> <input type="text"
											class="form-control" name="amount" id="inputEmail4">
									</div>
									<div class="form-group col-md-6">
										<button type="submit" class="btn"
											style="background-color: #007bff; color: white; margin-top: 10px; width: 51%;">Send Bill</button>
									</div>
								</form>
							</div>
							<div class="d-flex align-items-center">
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>