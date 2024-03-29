<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
 <%@page import="com.city.watch.entity.User"%>
 	<%
 	User usr=(User)session.getAttribute("user");
	%>
<div class="sidebar pe-4 pb-3">
            <nav class="navbar bg-secondary navbar-dark">
                <a href="index.jsp" class="navbar-brand mx-4 mb-3">
                  <h3 class="title-font">
				<img alt="Small Image" style="width: 50px; height: 50px;" class="img img-fluid" src="../img/cityscape.png"></i>&nbsp;<img alt="" src="../img/CityWatch.png" style="width: 142px;height: 50px;margin-left: -13px;" class="title">
				
			</h3>
                </a>
                <div class="d-flex align-items-center ms-4 mb-4">
                    <div class="position-relative">
                        <img class="rounded-circle" src="img/userimg.jpg" alt="" style="width: 40px; height: 42px;">
                        <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                    </div>
                    <div class="ms-3">
           
                       <c:if test="${not empty usr }">
                        <h6 class="mb-0"><%=usr.getName() %></h6>
                       </c:if>
                        
                        <span>Admin</span>
                    </div>
                </div>
                <div class="navbar-nav w-100">
                    <a href="index.jsp" class="nav-item nav-link ${currentPage eq 'dashboard' ? 'active' : ''}"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    <a href="issues.jsp" class="nav-item nav-link ${currentPage eq 'issues' ? 'active' : ''}"><i class="fa fa-th me-2"></i>Issues</a>
                    <a href="notifications.jsp" class="nav-item nav-link ${currentPage eq 'notifications' ? 'active' : ''} "><i class="fa fa-bell me-2"></i>Notifications</a>
                    <a href="add_pins.jsp" class="nav-item nav-link ${currentPage eq 'pins' ? 'active' : ''} "><i class="fas fa-map-marker-alt me-2"></i>Add Pins</a>
                    <a href="add_recruitment.jsp" class="nav-item nav-link ${currentPage eq 'recruitment' ? 'active' : ''} "><i class="fa fa-user me-2"></i>Recruitments</a>
                    <a href="users.jsp" class="nav-item nav-link ${currentPage eq 'users' ? 'active' : ''} "><i class="fa fa-user me-2"></i>Users</a>
                    <a href="donations.jsp" class="nav-item nav-link ${currentPage eq 'donations' ? 'active' : ''}"><i class="fa fa-credit-card me-2"></i>Donations</a>
                    <a href="suggestions.jsp" class="nav-item nav-link ${currentPage eq 'suggestions' ? 'active' : ''} "><i class="fa fa-comment me-2"></i>Suggestions</a>
                    <a href="developments.jsp" class="nav-item nav-link ${currentPage eq 'developments' ? 'active' : ''}"><i class="fa fa-wrench me-2"></i>Developments</a>
                    <a href="tax_payments.jsp" class="nav-item nav-link ${currentPage eq 'tax_payments' ? 'active' : ''} "><i class="fa fa-credit-card me-2"></i>Tax Payments</a>
                    <a href="rating_feedbacks.jsp" class="nav-item nav-link ${currentPage eq 'feedbacks' ? 'active' : ''} "><i class="fa fa-comment me-2"></i>Feedbacks</a>
               
                </div>
            </nav>
        </div>