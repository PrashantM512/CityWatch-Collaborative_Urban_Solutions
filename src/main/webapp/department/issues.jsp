<%@page import="com.city.watch.entity.User"%>
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
<html lang="en">
<head>
<meta charset="utf-8">
<title>Issues</title>
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
		String currentPage = "issues";
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
			
			<div class="container-fluid pt-4 px-4">
			 <div class="col-12">
                        <div class="bg-secondary rounded h-100 p-4">
                        <%@include file="components/alert.jsp" %>
                            <h6 class="mb-4">Public Issues</h6>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead style="background-image: linear-gradient(3deg, black, #3807fd)!important;color: white;height: 42px;">
                                       <tr>
                                            <th scope="col">Sr.No.</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">User Name</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Action</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
								IssueDaoImpl dao = new IssueDaoImpl(ConnectionProvider.getConnection());
								List<Map<String, Object>> list = dao.getPublicIssues();
								int i = 1;
								for (Map<String, Object> getPublicIssues : list) {
								    Issue is  = (Issue) getPublicIssues.get("issue");
								    User u = (User) getPublicIssues.get("user");
								    if(is.getStatus().equals("In_Progress") || is.getStatus().equals("Solved")){
									    
								    %>
                                        <tr>
                                            <th scope="row"><%=i %></th>
                                            <td><%=is.getTitle() %></td>
                                            <td><%=u.getName() %></td>
                                            <td><%=is.getType() %></td>
                                            <td><%=is.getDate() %></td>
                                            <td>
                                            <a href="issue_details.jsp?id=<%=is.getId()%>&by=<%=u.getName()%>&mb=<%=u.getMobile() %>" type="button" class="btn " style="background-color:#007bff;color:white">View Details</a>
                                            
                                          <% if(is.getStatus().equals("In_Progress")){ %> 	
                                           <a href="../IssueProgressServlet?id=<%=is.getId() %>&prg=Solved&rd=dept" type="button" class="btn btn-warning">Solved ?</a>
                                          <%} %>
                                           <% if(is.getStatus().equals("Solved")){ %> 	
                                           <button type="button" class="btn btn-success">Issue Solved <i class="fas fa-check-circle"></i></button>
                                          <%} %>
                                            
                                            </td>
                                        </tr>
                                       <%
                                       i++;
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