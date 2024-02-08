<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.city.watch.entity.User" %>
<!DOCTYPE html>
<html>
<head>
<%@include file="components/header_links.jsp"%>
<title>Home</title>
</head>
<body>
    <%@include file="components/check_session.jsp" %>
	<%@include file="components/navbar.jsp"%>
    <div class="container" style="height: 345px;text-align: center;margin-bottom: auto;">
        <div style="padding-top: 10%;">
        <img src="img/error-img.png" alt="Error Image" style=" height: 117px; " class="error-image img-fluid">
        <h4 class="text-center text-danger mt-2"><b>Sorry... Only admin can access admin panel!!</b> </h4>
        <a href="index.jsp" class="btn btn-primary mt-1">Home</a>
        </div>
    </div>
	

<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>