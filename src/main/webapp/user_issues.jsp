<%@page import="com.city.watch.entity.Issue"%>
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
<title></title>
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
<h3 class="text-center mb-3"
			style="margin-top: -25px; margin-bottom: -13px;">
			<img alt="" src="img/YourIssues.png" class="pagetitle"><img
				alt="" class="pagetitle-img" src="img/complain.png">
		</h3>
<div class="container-fluid px-4">
			 <div class="col-12">
                        <div class="rounded h-100">
                            <h6 class="mb-4"></h6>
                            <div class="table-responsive">
                                <table class="table" style="border-style: solid; border-color: #e5e5e5;">
                                    <thead style="height: 42px;background-color: #e5e5e5;">
                                        <tr>
                                            <th scope="col">Sr.No.</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">Photo</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Progress</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                       <%
                                       IssueDaoImpl dao=new IssueDaoImpl(ConnectionProvider.getConnection());
                                       int userId=user.getUid();
                                       int i=1;
                                       List<Issue> list=dao.getIssuesByUserId(userId);
                                       for(Issue is:list){
                                    	   %>
                                    
                                        <tr>
                                            <th scope="row"><%=i %></th>
                                            <td><%=is.getTitle() %></td>
                                            <td><img alt="" src="issues_img/<%=is.getPhoto() %>" style="height:70px;width:80px;"></td>
                                            <td><%=is.getDescription() %></td>
                                            <td><%=is.getType() %></td>
                                            <td><%=is.getDate() %></td>
                                             <td><%=is.getStatus() %></td>
                                            <td class="btn-danger btn" scope="row" style=" height: 40px; padding-top: 6px; margin-top: 3px;width: 80%; ">Delete
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
	
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>