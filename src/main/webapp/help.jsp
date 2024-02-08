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
.footer{
   margin-top: 81px;
}
</style>
<body>
 <%@include file="components/check_session.jsp" %>
	<%@include file="components/navbar.jsp"%>

<div class="conatiner mt-4">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4 text-center" style=" margin-top: 33px; ">
				<div class="text-success">
					<img alt="" src="img/phone.png" style="height:85px;width:85px">
				</div>
				<h3>24*7 Service</h3>
				<h4>Help Line Number</h4>
				<h5>+91 869899023</h5>
				<a href="index.jsp" class="btn btn-primary">Home</a>  <a class="btn btn-success" href="tel:+91869899023">Call Us</a>
			</div>
		</div>
	</div>

<%@include file="components/footer.jsp" %>
<%@include file="components/all_js.jsp"%>
</body>
</html>