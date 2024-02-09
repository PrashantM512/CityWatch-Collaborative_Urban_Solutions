<%@page import="com.city.watch.entity.Issue"%>
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
<title>Issue Details</title>
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
    <div class="row g-4">
        <div class="col-xl-6">
            <div class="h-100 bg-secondary rounded p-4">
                <%
            int id=Integer.parseInt(request.getParameter("id"));
            String username=request.getParameter("by");
            String mobile=request.getParameter("mb");
            IssueDaoImpl dao=new IssueDaoImpl(ConnectionProvider.getConnection());
            Issue is=dao.getIssueById(id);
            %>
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h6 class="mb-0">Image :</h6>
                    <a href=""></a>
                </div>
                <img src="../issues_img/<%=is.getPhoto() %>" class="img-fluid curved-image" style=" border-radius: 10px;    width: -webkit-fill-available; " alt="Responsive Image">
            </div>
        </div>
        <div class="col-xl-6">
            <div class="h-100 bg-secondary rounded p-4">
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <h6 class="mb-0">Issue Details</h6>
                    <a href=""></a>
                </div>
                 <div class="mt-4">
                     <p><b class="text-white">Title:&nbsp; </b><%=is.getTitle() %> </p>
                     <p><b class="text-white">Sent By:&nbsp; </b><%=username %></p>
                     <p><b class="text-white">Mobile No:&nbsp; </b><%=mobile %></p>
                     <p><b class="text-white">Type:&nbsp; </b><%=is.getType() %></p>
                     <p><b class="text-white">Status:&nbsp; </b><%=is.getStatus() %></p>
                     <p><b class="text-white">Date:&nbsp; </b><%=is.getDate() %></p>
                     <p><b class="text-white">Description:&nbsp; </b><%=is.getDescription() %></p>
                   
                </div>
            </div>
        </div>
    </div>
</div>

			
			<!-- Footer Start -->
			<%@include file="components/footer.jsp"%>
			<!-- Footer End -->
		</div>
	</div>
	<%@include file="components/allscripts.jsp"%>
</body>
</html>