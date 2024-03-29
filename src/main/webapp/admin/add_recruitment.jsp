<%@page import="com.city.watch.entity.Recruitment"%>
<%@page import="java.util.List"%>
<%@page import="com.city.watch.db.ConnectionProvider"%>
<%@page import="com.city.watch.dao.RecruitmentDaoImpl"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.city.watch.entity.User"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Add Recruitments</title>
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
		String currentPage = "recruitment";
		request.setAttribute("currentPage", currentPage);
		%>
		<%@include file="components/sidebar.jsp"%>
		<%
		request.removeAttribute("currentPage");
		%>

		<div class="content">
			<!-- Navbar Start -->
			<%@include file="components/navbar.jsp"%>
			<!-- Navbar End -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-sm-12 col-md-6 col-xl-4"></div>
					<div class="col-12">
						<div class="h-100 bg-secondary rounded p-4">
						 <%@include file="components/alert.jsp" %>
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<h6 class="mb-0">Add Recruitments :</h6>
								<a href="applied_applications.jsp">View Applied Applications</a>
							</div>
							<div class="">
								<form action="../AddRecruitmentServlet" method="post">
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputEmail4">Job Title</label> <input type="text"
											class="form-control" name="title" id="inputEmail4" placeholder="">
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputPassword4">Description</label> <input
											type="text" class="form-control" name="description" id="inputPassword4">
									</div>
									<div class="form-group col-md-6" style="width: 100%;">
										<label for="inputPassword4">Application End Date</label> <input
											type="text" class="form-control" name="edate" id="inputPassword4">
									</div>
									<div class="form-row" style="display:flex;">
									<div class="form-group col-md-6 ">
										<label for="inputPassword4">Criteria</label> <input
											type="text" class="form-control" name="criteria" id="inputPassword4">
									</div>
										<div class="form-group col-md-6"
											style="margin-left: 18px; width: 49%;">
											<label for="inputState">CV need</label> <select id="inputState"
												class="form-control" name="need" required>
												<option value="" selected disabled>Choose...</option>
												<option value="Yes">Yes</option>
												<option value="No">No</option>
											</select>
										</div>
									</div>	
									<div class="form-group col-md-6">
										<button type="submit" class="btn"
											style="background-color: #007bff; color: white; margin-top: 10px; width: 51%;">Add</button>
									</div>
								</form>
							</div>
							<div class="d-flex align-items-center">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="container-fluid pt-4 px-4 mb-4">
			 <div class="col-12">
                        <div class="bg-secondary rounded h-100 p-4">
                            <h6 class="mb-4">Manage Recruitments :</h6>
                            <div class="table-responsive">
                                <table class="table">
                                    <thead style="background-image: linear-gradient(3deg, black, #3807fd)!important;color: white;height: 42px;">
                                        <tr>
                                            <th scope="col">Sr.No.</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">Description</th>
                                            <th scope="col">End Date</th>
                                            <th scope="col">Criteria</th>
                                            <th scope="col">CV needed ?</th>
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
                                            <td><%=r.getApplicationEndDate() %></td>
                                            <td><%=r.getCriteria() %></td>
                                            <td><%=r.getCv_need() %></td>
                                            <td>
                                             <a href="update_recruitment.jsp?id=<%=r.getRecruitmentId() %>" type="button" class="btn text-white" style="background-color:#007bff">Update</a>
                                            <a href="../DeleteRecruitmentServlet?id=<%=r.getRecruitmentId() %>" type="button" class="btn btn-primary">Delete</a>
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