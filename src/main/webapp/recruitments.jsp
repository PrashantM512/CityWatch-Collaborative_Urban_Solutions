<%@page import="com.city.watch.dao.JobApplicationDaoImpl"%>
<%@page import="com.city.watch.dao.UserDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.dao.RecruitmentDaoImpl"%>
<%@page import="com.city.watch.entity.Recruitment"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Recruitments</title>
</head>
<style>
th,td{
   border-right: solid 2px #e5e5e5;
}
</style>
<body>
<%
User usd = (User) session.getAttribute("user");
if (usd == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
    <%@include file="components/check_session.jsp" %>
	<%@include file="components/navbar.jsp"%>
    <%  
    UserDaoImpl d=new UserDaoImpl(ConnectionProvider.getConnection());
    User u=d.getUserById(user.getUid());
    %>
	<div class="conatiner">
		<p class="text-center pgeheading">OUR ACTIVE RECRUITMENTS</p>
      
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
									<th scope="col">Description</th>
									<th scope="col">End Date</th>
									<th scope="col">Criteria</th>
									<th scope="col">CV needed?</th>
									<th scope="col">Action</th>
                               </tr>
							</thead>
							<tbody>
							    <%
                                  RecruitmentDaoImpl dao=new RecruitmentDaoImpl(ConnectionProvider.getConnection());
                                  List<Recruitment> list=dao.getAllRecruitments();
                                  int i=1;
                                  for(Recruitment r:list){
                                 %>
								<tr>
								 <th scope="row"><%=i %></th>
                                 <td><%=r.getJobTitle() %></td>
                                 <td><%=r.getDescription() %></td>
                                 <td style=" min-width: 135px; "><%=r.getApplicationEndDate() %></td>
                                 <td><%=r.getCriteria() %></td>
                                 <td><%=r.getCv_need() %></td>
                                 <td style=" display: grid; ">
                                   <%
                                    if (r.getCv_need().equals("Yes") && (u.getCv() == null || u.getCv().isEmpty())) {
                                   %>
                                     <a class="text-white btn-primary btn" href="upload_cv.jsp" style="text-decoration: none;padding: 6px 14px;margin: -6px;">Upload CV</a>
                                   <% } else { %>
                                   
                                       
                                       <%
                                       JobApplicationDaoImpl dd=new JobApplicationDaoImpl(ConnectionProvider.getConnection());
                                       boolean f=dd.getApplicationByRidAndUid(r.getRecruitmentId(), user.getUid());
                                       if(f){ %>
                                    	     <button class="text-white btn-success ml-2 btn" style="text-decoration: none;padding: 6px 14px;margin: -6px;">Applied&nbsp;<i class='fa-regular fa-circle-check'></i></button>  
                                        
                                     <%  }else{  %>
                                    	    <a class="text-white btn-info ml-2 btn" href="ApplyJobServlet?rid=<%=r.getRecruitmentId() %>&uid=<%=user.getUid() %>" style="text-decoration: none;padding: 6px 14px;margin: -6px;">Apply Now</a>  
                                      <% } %>
                                               
                                             <% 
                                               if(r.getCv_need().equals("Yes")){
                                        	 %>
                                        	  <a class="text-white btn-primary btn" href="upload_cv.jsp" style="text-decoration: none;padding: 6px 15px;margin-left: 9px;margin-top: 10px;">Update CV ?</a>
                                        	 <% } %>
                                     
                                   <% } %>
                                   
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
	<%@include file="components/footer.jsp"%>
	<%@include file="components/all_js.jsp"%>
</body>
</html>