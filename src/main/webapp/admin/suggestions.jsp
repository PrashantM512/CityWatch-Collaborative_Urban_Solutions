<%@page import="com.city.watch.entity.Suggestion"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.SuggestionDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Suggestions</title>
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
		String currentPage = "suggestions";
		request.setAttribute("currentPage", currentPage);
		%>
		<!-- Sidebar Start -->
		<%@include file="components/sidebar.jsp"%>
		<!-- Sidebar End -->
		<%
		request.removeAttribute("currentPage");
		%>

		<div class="content">
			<!-- Navbar Start -->
			<%@include file="components/navbar.jsp"%>
			<!-- Navbar End -->
			
	<div class="container-fluid pt-4 px-4 mb-4">
				<div class="col-12">
					<div class="bg-secondary rounded h-100 p-4">
						<h6 class="mb-4">Suggestions :</h6>
						<div class="table-responsive">
							<table class="table">
								<thead
									style="background-image: linear-gradient(3deg, black, #3807fd) !important; color: white; height: 42px;">
									<tr>
										<th scope="col">Sr.No.</th>
										<th scope="col">Title</th>
										<th scope="col">Description</th>
										<th scope="col">Date</th>
										<th scope="col">User Name</th>
										<th scope="col">Mobile</th>
										<th scope="col">Age</th>
										<th scope="col">Education</th>
										<th scope="col">Actions</th>
									</tr>
								</thead>
								<tbody>
								<%
								SuggestionDaoImpl dao = new SuggestionDaoImpl(ConnectionProvider.getConnection());
								List<Map<String, Object>> list = dao.getAllSuggestionsWithUserDetails();
								int i = 1;
								for (Map<String, Object> suggestionWithUser : list) {
								    Suggestion s = (Suggestion) suggestionWithUser.get("suggestion");
								    User u = (User) suggestionWithUser.get("user");
									
								    %>
									<tr>
										<th scope="row"><%=i %></th>
										<td><%=s.getTitle() %></td>
										<td><%=s.getDescription() %></td>
										<td><%=s.getDate() %></td>
										<td><%=u.getName() %></td>
										<td><%=u.getMobile() %></td>
										<td><%=s.getAge() %></td>
										<td><%=s.getEducation() %></td>
										<td>
											<button type="button" class="btn btn-danger">Delete</button>
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