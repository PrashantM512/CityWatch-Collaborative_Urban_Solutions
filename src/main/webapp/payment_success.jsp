<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="components/ratings.css">
<%@include file="components/header_links.jsp"%>
<title>Success Page</title>
</head>
<style>
.footer{
margin-top:0px;
}
</style>
<body>
 <%@include file="components/check_session.jsp" %>
 <%@include file="components/navbar.jsp"%>
 <div class="containerr">
      <div class="text-center">
        <div class="text">Congratulations...Your Payment is Successful !!!</div>
        <a href="index.jsp" class="btn btn-outline-dark text-white mt-2">Home</a>
      </div>
 </div>
 
<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>