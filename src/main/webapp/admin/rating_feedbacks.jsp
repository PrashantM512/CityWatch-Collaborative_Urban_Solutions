<%@page import="java.util.Map"%>
<%@page import="com.city.watch.entity.Rating"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.RatingsDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Ratings & Feedbacks</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
		String currentPage = "feedbacks";
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
						<h6 class="mb-4">All Ratings and Feedbacks :</h6>
						<div class="table-responsive">
							<table class="table">
								<thead
									style="background-image: linear-gradient(3deg, black, #3807fd) !important; color: white; height: 42px;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Project</th>
										<th scope="col">User Name</th>
										<th scope="col">Date</th>
										<th scope="col">Stars</th>
										<th scope="col">Feedback</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
								    <%
								    RatingsDaoImpl dao=new RatingsDaoImpl(ConnectionProvider.getConnection());
								    List<Map<String, Object>> list = dao.getFeedbackDetails();
								    int i=1;
								    for (Map<String, Object> fd : list) {
								    %>
								  <tr>
										<th scope="row"><%=i %></th>
										<td><%=((Map<String, Object>) fd.get("development")).get("title") %></td>
										<td><%=((Map<String, Object>) fd.get("user")).get("name") %></td>
										<td><%=fd.get("date") %></td>
										<td>
										<%
									        int ratingLevel = (int) fd.get("stars");
									        for (int j = 0; j < ratingLevel; j++) {
									       	out.println("<i class=\"fa-solid fa-star\" style=\"color: orange;\"></i>");
								         	}
									     %>
										</td>
										<td><%=fd.get("feedback") %></td>
										<td>
										    <a href="../development_fullscreen.jsp?pid=<%=((Map<String, Object>) fd.get("development")).get("pid") %>" type="button" class="btn" style="background: #0072ff;color: white;">View Project</a>
											<a href="../DeleteRatingServlet?rid=<%=fd.get("rid") %>" type="button" class="btn btn-danger">Delete Feedback</a>
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