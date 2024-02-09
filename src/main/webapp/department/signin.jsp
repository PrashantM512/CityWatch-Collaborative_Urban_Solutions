<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Department: Signin</title>
<%@include file="components/header_links.jsp"%>
</head>
<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Spinner Start -->
		<div id="spinner"
			class="show bg-dark position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
			<div class="spinner-border text-primary"
				style="width: 3rem; height: 3rem;" role="status">
				<span class="sr-only">Loading...</span>
			</div>
		</div>
		<!-- Spinner End -->
		<!-- Sign In Start -->
		<div class="container-fluid">
			<div class="row h-100 align-items-center justify-content-center"
				style="min-height: 100vh;">
				<div class="col-12 col-sm-8 col-md-6 col-lg-5 col-xl-4">
					<div class="bg-secondary rounded p-4 p-sm-5 my-4 mx-3">
						<div
							class="d-flex align-items-center justify-content-between mb-3">
							<a href="index.jsp" class="navbar-brand mx-4 mb-3">
								<h3 class="title-font" style="margin-left: -25px;">
									<img alt="Small Image" style="width: 50px; height: 50px;"
										class="img img-fluid" src="../img/cityscape.png"></i>&nbsp;<img
										alt="" src="../img/CityWatch.png"
										style="width: 142px; height: 50px; margin-left: -13px;"
										class="title">
								</h3>
							</a>
							<h3>Sign In</h3>
						</div>
						<c:if test="${not empty invalid }">
							<p class="text-center text-danger">${invalid }</p>
							<c:remove var="invalid" scope="session" />
						</c:if>
						<c:if test="${not empty check }">
							<p class="text-center text-danger">${check }</p>
							<c:remove var="check" scope="session" />
						</c:if>

						<form action="../DepartmentLoginServlet" method="post">
							<div class="form-floating mb-3">
								<input type="text" class="form-control" id="floatingInput"
									name="dept_id" placeholder="name@example.com" style=" background: black; "> <label
									for="floatingInput">Department ID</label>
							</div>
							<div class="form-floating mb-4">
								<input type="password" class="form-control" style=" background: black; "
									id="floatingPassword" name="password" placeholder="Password">
								<label for="floatingPassword">Password</label>
							</div>
							<div
								class="d-flex align-items-center justify-content-between mb-4">
								<div class="form-check">
									<input type="checkbox" class="form-check-input" name="check"
										id="exampleCheck1"> <label class="form-check-label"
										for="exampleCheck1">I am not robot</label>
								</div>
								<a href=""></a>
							</div>
							<button type="submit" class="btn py-3 w-100 mb-4"
								style="background-color: #0026e1; color: white;">Sign
								In</button>
							<p class="text-center mb-0">
								Normal user or Admin? <a href="../login.jsp">&nbsp; Click
									Here</a>
							</p>
						</form>
					</div>

				</div>
			</div>
		</div>
		<!-- Sign In End -->
	</div>

	<%@include file="components/allscripts.jsp"%>
</body>

</html>