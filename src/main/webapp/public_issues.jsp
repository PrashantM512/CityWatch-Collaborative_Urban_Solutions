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
<body>
	<%@include file="components/navbar.jsp"%>

<div class="conatiner">
<p class="text-center pgeheading">Public Submitted Issues</p>

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
                                            <th scope="col">Description</th>
                                            <th scope="col">Mobile</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">Date</th>
                                            <th scope="col">Progress</th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Street Light</td>
                                            <td>hi jkbc wfdwt ckj kjbc bacsk</td>
                                            <td>9027462837</td>
                                            <td>Major</td>
                                            <td>12/1/2024</td>
                                            <td class="btn-primary btn" scope="row" style=" height: 40px; padding-top: 6px; margin-top: 3px;width: 80%; ">Submitted</td>
                                         </tr>
                                         <tr>
                                            <th scope="row">1</th>
                                            <td>Street Light</td>
                                            <td>hi jkbc wfdwt ckj kjbc bacsk</td>
                                            <td>9027462837</td>
                                            <td>Major</td>
                                            <td>12/1/2024</td>
                                            <td class="btn-warning btn" scope="row" style=" height: 40px; padding-top: 6px; margin-top: 3px;width: 80%; ">In Process</td>
                                         </tr>
                                         <tr>
                                            <th scope="row">1</th>
                                            <td>Street Light</td>
                                            <td>hi jkbc wfdwt ckj kjbc bacsk</td>
                                            <td>9027462837</td>
                                            <td>Major</td>
                                            <td>12/1/2024</td>
                                            <td class="btn-success btn" scope="row" style=" height: 40px; padding-top: 6px; margin-top: 3px;width: 80%; ">Solved</td>
                                         </tr>
                                         <tr>
                                            <th scope="row">1</th>
                                            <td>Street Light</td>
                                            <td>hi jkbc wfdwt ckj kjbc bacsk</td>
                                            <td>9027462837</td>
                                            <td>Major</td>
                                            <td>12/1/2024</td>
                                            <td class="btn-danger btn" scope="row" style=" height: 40px; padding-top: 6px; margin-top: 3px;width: 80%; ">Rejected</td>
                                         </tr>
                                    </tbody>
                                </table>
                            </div>
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