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
<p class="text-center pgeheading">DETAILS ABOUT PROJECT</p>

<div class="container-fluid px-4">
    <div class="row g-4">
        <div class="col-xl-6" style=" text-align-last: center; ">
            <div class="h-100 rounded p-4 border" style="background-color: #f1f1f1;  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
                <div class="d-flex align-items-center justify-content-between mb-2">
                    <h6 class="mb-0">Photo :</h6>
                    <a href=""></a>
                </div>
                <img src="img/road.jpg" class="img-fluid curved-image" style=" border-radius: 10px; " alt="Responsive Image">
            </div>
        </div>
 <div class="col-xl-6" style="position: relative;">
    <div class="h-100 rounded p-4 border" style="background-color: #f1f1f1;  box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;">
        <div class="d-flex align-items-center justify-content-between mb-4">
            <h6 class="mb-0">Project Details</h6>
            <a href=""></a>
        </div>
        <div class="mt-4">
            <p>Title: </p>
            <p>Location:</p>
            <p>Start Date:</p>
            <p>Completion date:</p>
            <p>Status:</p>
            <p>Need Of Donation:</p>
            <p>Description:</p>
        </div>
        <div class="text-center" style="position: absolute; bottom: 20px; width:90%">
            <a class="btn btn-success text-white" style="width:100%">Donate For Project</a>
        </div>
    </div>
</div>

</div>
                    
</div>

	
	
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>