<%@page import="com.city.watch.entity.Recruitment"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.RecruitmentDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.city.watch.entity.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Add Recruitments</title>
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
		String currentPage = "recruitment";
		request.setAttribute("currentPage", currentPage);
		%>
		<%@include file="components/sidebar.jsp"%>
		<%
		request.removeAttribute("currentPage");
		%>

		<div class="content">
			<!-- Navbar Start -->
			<%@include file="components/navbar.jsp"%>
			<!-- Navbar End -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-12">
						<div class="h-100 bg-secondary rounded p-4">
						 <%@include file="components/alert.jsp" %>
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Add Recruitments :</h6>
								<a href="applied_applications.jsp"></a>
							</div>
							<div class="">
							<%
							int id=Integer.parseInt(request.getParameter("id"));
							RecruitmentDaoImpl dao=new RecruitmentDaoImpl(ConnectionProvider.getConnection());
							Recruitment r=dao.getRecruitmentById(id);
							%>
								<form action="../UpdateRecruitmentServlet" method="post">
								   <input type="hidden" name="id" value="<%=id %>">
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputEmail4">Job Title</label> <input type="text"
											class="form-control" value="<%=r.getJobTitle() %>" name="title" id="inputEmail4" placeholder="">
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputPassword4">Description</label> <input
											type="text" class="form-control" value="<%=r.getDescription() %>" name="description" id="inputPassword4">
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputPassword4">Application End Date</label> <input
											type="text" class="form-control" value="<%=r.getApplicationEndDate() %>" name="edate" id="inputPassword4">
									</div>
									<div class="form-row" style="display:flex;">
									<div class="form-group col-md-6 ">
										<label for="inputPassword4">Criteria</label> <input
											type="text" class="form-control" value="<%=r.getCriteria() %>" name="criteria" id="inputPassword4">
									</div>
										<div class="form-group col-md-6"
											style="margin-left: 18px; width: 49%;">
											<label for="inputState">CV need</label> <select id="inputState" class="form-control" name="need"
												required>
												<option value="" disabled>Choose...</option>
												<option value="Yes"
													<%=r.getCv_need().equals("Yes") ? "selected" : ""%>>Yes</option>
												<option value="No"
													<%=r.getCv_need().equals("No") ? "selected" : ""%>>No</option>
											</select>
										</div>
									</div>	
									<div class="form-group col-md-6">
										<button type="submit" class="btn"
											style="background-color: #007bff; color: white; margin-top: 10px; width: 51%;">Update</button>
									</div>
								</form>
							</div>
							<div class="d-flex align-items-center">
							</div>
						</div>
					</div>
				</div>
			</div>
		<%@include file="components/allscripts.jsp"%>
</body>
</html>