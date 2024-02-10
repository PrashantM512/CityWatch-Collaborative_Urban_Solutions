<%@page import="com.city.watch.dao.RatingsDaoImpl"%>
<%@page import="com.city.watch.entity.Development"%>
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
<title>Development Details</title>
</head>
<body>
 <%@include file="components/check_session.jsp" %>
 <%@include file="components/navbar.jsp"%>

<div class="conatiner">
<p class="text-center pgeheading">DETAILS ABOUT PROJECT</p>
<%
int pid=Integer.parseInt(request.getParameter("pid"));
DevelopmentDaoImpl dao=new DevelopmentDaoImpl(ConnectionProvider.getConnection());
Development dev=new Development();
dev=dao.getDevelopmentById(pid);
%>
<div class="container-fluid px-4">
    <div class="row g-4">
        <div class="col-xl-6" style=" text-align-last: center; ">
            <div class="h-100 rounded p-4 border" style=" box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 20px;">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h6 class="mb-0">Photo :</h6>
                    <a href=""></a>
                </div>
                <img src="developments_img/<%=dev.getPhoto() %>" class="img-fluid curved-image" style=" border-radius: 10px;max-height: 400px; min-height: 300px " alt="Responsive Image">
            </div>
        </div>
 <div class="col-xl-6" style="position: relative;">
    <div class="h-100 rounded p-4 border" style="box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 20px;display: inline-grid;width: 100%;">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h6 class="mb-0">Project Details</h6>
            <a href=""></a>
        </div>
        <div class="mt-4">
            <p><b class="text-dark">Title:</b>&nbsp;<%=dev.getTitle() %></p>
            <p><b class="text-dark">Location:</b>&nbsp;<%=dev.getLocation() %></p>
            <p><b class="text-dark">Start Date:</b>&nbsp;<%=dev.getsDate() %></p>
            <p><b class="text-dark">Completion date:</b>&nbsp;<%=dev.geteDate() %></p>
            <p><b class="text-dark">Status:</b>&nbsp;<%=dev.getStatus() %></p>
            <p><b class="text-dark">Need Of Donation:</b>&nbsp;<%=dev.getNeed() %></p>
            <p><b class="text-dark">Description:</b>&nbsp;<%=dev.getDescription() %></p>
        </div>
        <div class="text-center" style=" bottom: 20px; width:90%">
            
            <%
            int uid=user.getUid();
            RatingsDaoImpl dao2=new RatingsDaoImpl(ConnectionProvider.getConnection());
            boolean f=dao2.checkFeedback(pid, uid);
            if(f){ %>
            <button class="btn primary-colour text-white mb-1" style="width:100%">Thanks you for ratings...</button>	
             <%	
            }else{
            %>
            <%
            if(dev.getStatus().equals("Ongoing") || dev.getStatus().equals("Completed")){
            %>
            <a href="ratings_feedback.jsp?pid=<%=dev.getPid() %>" class="btn btn-primary text-white mb-1" style="width:100%">Give Review & Feedback</a>	
            <% } %>
            <%
            }
            %>
            
           
        
        
        
            <%
            if(dev.getNeed().equals("Yes") && dev.getStatus().equals("Ongoing") || dev.getStatus().equals("Upcoming")){
            %>
            <a class="btn btn-success text-white" style="width:100%">Donate For Project</a>	
            <% } %>
        </div>
    </div>
</div>

</div>
                    
</div>
</div>
	
	
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>