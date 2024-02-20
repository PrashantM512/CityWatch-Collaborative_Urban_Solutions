<%@page import="com.city.watch.entity.Issue"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.IssueDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Issues</title>
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
<p class="text-center pgeheading">Public Submitted Issues</p>

<div class="container-fluid px-4">
			 <div class="col-12">
                        <div class="rounded h-100">
                            <h6 class="mb-4"></h6>
                            <div class="table-responsive">
						<%
						IssueDaoImpl dao = new IssueDaoImpl(ConnectionProvider.getConnection());
							List<Map<String, Object>> list = dao.getPublicIssues();
							int i = 1;
						%>

						<table class="table"
							style="border-style: solid; border-color: #e5e5e5;">
							<thead style="height: 42px; background-color: #e5e5e5;">
								<tr>
									<th scope="col">Sr.No.</th>
									<th scope="col">Title</th>
									<th scope="col">Description</th>
									<th scope="col">User Name</th>
									<th scope="col">Status</th>
									<th scope="col">Date</th>
									<th scope="col">Progress</th>
								</tr>
							</thead>
							<tbody>
								<%
								for (Map<String, Object> getPublicIssues : list) {
									Issue is = (Issue) getPublicIssues.get("issue");
									User u = (User) getPublicIssues.get("user");
									String statusClass = "";
									String icon="";
									switch (is.getStatus()) {
									case "Submitted":
										statusClass = "btn-primary";
										
										break;
									case "Rejected":
										statusClass = "btn-danger";
										icon="<i class='fa-regular fa-circle-xmark'></i>";
										break;
									case "In_Progress":
										statusClass = "btn-warning";
										icon ="<i class='fa-solid fa-spinner'></i>";
										break;
									case "Solved":
										statusClass = "btn-success";
										icon="<i class='fa-regular fa-circle-check'></i>";
										break;
									default:
										statusClass = "";
									}
								%>
								<tr>
									<th scope="row"><%=i%></th>
									<td><%=is.getTitle()%></td>
									<td><%=is.getDescription()%></td>
									<td><%=u.getName()%></td>
									<td><%=is.getType()%></td>
									<td><%=is.getDate()%></td>
									<td class="<%=statusClass%> btn" scope="row"
										style="height: 40px;padding-top: 6px;margin-top: 3px;min-width: 100%;">
										<%=is.getStatus()%>&nbsp;<%=icon %>
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
	
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>