<%@page import="com.city.watch.entity.Suggestion"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.SuggestionDaoImpl"%>
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
			<img alt="" src="img\YourSuggestions.png" class="pagetitle"><img
				alt="" class="pagetitle-img" src="img/suggestion.png">
		</h3>
<div class="container-fluid px-4 col-md-10">
			 <div class="col-12">
                        <div class="rounded h-100">
                            <h6 class="mb-4"></h6>
                            <div class="table-responsive">
                                <table class="table mt-2" style="border-style: solid; border-color: #e5e5e5;">
                                    <thead style="height: 42px;background-color: #e5e5e5;">
                                        <tr>
                                            <th scope="col">Sr.No.</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Age</th>
                                            <th scope="col">Education</th>
                                            <th scope="col">Action</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                    SuggestionDaoImpl dao=new SuggestionDaoImpl(ConnectionProvider.getConnection());
                                    int uid=user.getUid();
                                    int i=1;
                                    List<Suggestion> list=dao.getSuggestionsById(uid);
                                    for(Suggestion s:list){
                                       %>
                                        <tr>
                                            <th scope="row"><%=i %></th>
                                            <td><%=s.getTitle() %></td>
                                            <td><%=s.getDescription() %></td>
                                            <td><%=s.getDate() %></td>
                                            <td><%=s.getAge() %></td>
                                            <td><%=s.getEducation() %></td>
                                            <td><a class="btn-danger btn text-white" href="DeleteSuggestionServlet?id=<%=s.getId()%>&uid=<%=user.getUid() %>" scope="row" style="padding-top: 4px;margin-top: -8px;width: 100%;">Delete</a></td>
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