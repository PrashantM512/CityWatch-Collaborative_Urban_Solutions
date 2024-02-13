<%@page import="java.util.Map"%>
<%@page import="com.city.watch.dao.JobApplicationDaoImpl"%>
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
<title>Applied Applications</title>
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
			<%@include file="components/navbar.jsp"%>

			<div class="container-fluid pt-4 px-4 mb-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">
					 <%@include file="components/alert.jsp" %>
						<h6 class="mb-4">Manage Applications :</h6>
						<div class="table-responsive">
							<table class="table">
								<thead
									style="background-image: linear-gradient(3deg, black, #3807fd) !important; color: white; height: 42px;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Job Title</th>
										<th scope="col">User Name</th>
										<th scope="col">Mobile</th>
										<th scope="col">Application Date</th>
										<th scope="col">CV</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
									<%
                                     JobApplicationDaoImpl jobApplicationDao = new JobApplicationDaoImpl(ConnectionProvider.getConnection());
                                     List<Map<String, Object>> jobApplicationsDetails = jobApplicationDao.getJobApplicationsDetails();
                                     if (jobApplicationsDetails.isEmpty()) {
                                     out.println("<p class='text-danger'>No job applications found.</p>");
                                     } else {
                                     int i=1;
                                     for (Map<String, Object> a : jobApplicationsDetails) {
                                     %>
									<tr>
										<th scope="row"><%=i %></th>
										<td><%= a.get("job_title") %></td>
										<td><%=a.get("name") %></td>
										<td><%=a.get("mobile") %></td>
										<td><%=a.get("applicationDate") %></td>
										<td>                      
				                         <% 
                                           String cvFilePath = "../pdf_files/" + a.get("cv");
                                           if (a.get("cv") != null && !cvFilePath.trim().isEmpty()) {
                                           %>
                                           <a href="<%= cvFilePath %>" target="_blank" class="btn btn-info text-white">Open CV</a>
                                           <%
                                            } else {
                                            out.println("No CV available");
                                            }
                                           %>
										</td>
										<td><a href="../DeleteJobApplicationServlet?id=<%=a.get("applicationId") %>" type="button" class="btn btn-danger">Delete</a>
										</td>
									</tr>
									<%  i++;
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
	<%@include file="components/allscripts.jsp"%>
</body>
</html>