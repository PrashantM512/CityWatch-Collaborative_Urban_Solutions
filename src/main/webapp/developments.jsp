<%@page import="com.city.watch.entity.Development"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.DevelopmentDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Developments</title>
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
		<p class="text-center pgeheading">OUR DEVELOPMENTS</p>

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
									<th scope="col">Title</th>
									<th scope="col">Start Date</th>
									<th scope="col">Address</th>
									<th scope="col">Need Of Donation</th>
									<th scope="col">Status</th>
									<th scope="col">Action</th>
                               </tr>
							</thead>
							<tbody>
							    <%
								DevelopmentDaoImpl dao=new DevelopmentDaoImpl(ConnectionProvider.getConnection());
								List<Development> list=dao.getAlldevelopments();
								int i=1;
								for(Development d:list){
								%>
								<tr>
									<th scope="row"><%=i %></th>
									<td><%=d.getTitle() %></td>
									<td><%=d.getsDate() %></td>
									<td><%=d.getLocation() %></td>
									<td><%=d.getNeed() %></td>
									<td><%=d.getStatus() %></td>
									<td><a class="text-white btn-primary btn" href="development_fullscreen.jsp?pid=<%=d.getPid() %>"
										style="text-decoration: none;padding: 6px 14px;margin: -6px;">View Details&nbsp;<i class="fa-solid fa-circle-info"></i></a>
									<%
									if(d.getStatus().equals("Ongoing") || d.getStatus().equals("Completed")){
									%>
									<a class="text-white btn-info ml-2 btn" href="View_Feedbacks.jsp?pid=<%=d.getPid() %>" style="text-decoration: none;padding: 6px 14px;margin: -6px;">View Feedbacks&nbsp;<i class="fa-solid fa-comments"></i></a>
									<%
									}
									%>	
										
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
	<div style="height: 100px"></div>
	
	 <c:if test="${not empty averageRating}">
    <c:remove var="averageRating" scope="session"/>
    </c:if>
    
	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>