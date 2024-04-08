<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Timestamp"%>
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
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Job Applications</title>
</head>
<style>
th,td{
   border-right: solid 2px #e5e5e5;
}
</style>
<body>
    <%@include file="components/check_session.jsp" %>
	<%@include file="components/navbar.jsp"%>

	<div class="conatiner">
		<p class="text-center pgeheading">YOUR JOB APPLICATIONS</p>

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
                                    	 if(a.get("userId").equals(user.getUid())){
                                     %>
									<tr>
										<th scope="row"><%=i %></th>
										<td><%= a.get("job_title") %></td>
										<td><%=a.get("name") %></td>
										<td><%=a.get("mobile") %></td>
									<%
									Timestamp timestamp = (Timestamp)a.get("applicationDate");
									SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MMM-yyyy hh:mm a");
									String formattedDate = outputFormat.format(timestamp);
									%>

									<td><%=formattedDate %></td>
										<td>                      
				                         <% 
                                           String cvFilePath = "pdf_files/" + a.get("cv");
                                           if (a.get("cv") != null && !cvFilePath.trim().isEmpty()) {
                                           %>
                                           <a href="<%= cvFilePath %>" target="_blank" class="btn btn-info text-white">Open CV</a>
                                           <%
                                            } else {
                                            out.println("No CV available");
                                            }
                                           %>
										</td>
										<td><a href="DeleteJobApplicationServlet?id=<%=a.get("applicationId") %>&rd=us" type="button" class="btn btn-danger">Delete</a>
										</td>
									</tr>
									<%  i++;
                                       }
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
	<div style="height: 100px"></div>

	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>